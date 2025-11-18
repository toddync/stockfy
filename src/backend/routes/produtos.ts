import { Router } from 'express';
import Database from '../database.js';
import type { RowDataPacket, ResultSetHeader, FieldPacket } from 'mysql2/promise'; // Import RowDataPacket and ResultSetHeader

const router = Router();

// Add these interfaces
interface ProdutoRawRow extends RowDataPacket {
  id: number;
  codigo: string;
  descricao: string;
  grupo_id: number;
  preco_custo: number;
  preco_venda: number;
  estoque_atual: number;
  tabela_preco: string;
  preco_minimo: number;
  data_atualizacao: string;
  tags_string: string | null;
}

interface BackendVariation {
  id: number;
  sku: string;
  tamanho: string;
  cor: string;
  estoque_atual: number;
  produto_id?: number;
}

// This will be moved to a service
const getPool = async () => {
    return await Database.getInstance();
};


router.get('/', async (req, res) => {
    const filters = req.query;
    let query = `
        SELECT 
            p.*,
            (SELECT SUM(pv.estoque_atual) FROM produto_variacoes pv WHERE pv.produto_id = p.id) as estoque_atual,
            (SELECT GROUP_CONCAT(CONCAT(t.id, ':', t.nome) SEPARATOR ';')
             FROM produto_tags pt 
             JOIN tags t ON pt.tag_id = t.id 
             WHERE pt.produto_id = p.id) as tags_string
        FROM produtos p
        WHERE 1=1
    `;
    const params: (string | number)[] = [];

    if (filters.tamanho || filters.cor) {
        query += ' AND p.id IN (SELECT produto_id FROM produto_variacoes WHERE 1=1';
        if (filters.tamanho) {
            query += ' AND tamanho = ?';
            params.push(filters.tamanho as string);
        }
        if (filters.cor) {
            query += ' AND cor LIKE ?';
            params.push(`%${filters.cor as string}%`);
        }
        query += ')'
    }

    try {
        const pool = await getPool();
        const [rows] = await pool.execute(query, params);
        
        const processedRows = (rows as ProdutoRawRow[]).map(row => {
            const { tags_string, ...rest } = row;
            const tags = tags_string ? tags_string.split(';').map((t:string) => {
                const parts = t.split(':');
                return { id: parseInt(parts[0]), nome: parts.slice(1).join(':') };
            }) : [];
            return { ...rest, tags };
        });

        res.status(200).json(processedRows);
    } catch (error) {
        console.error('Error fetching filtered produtos:', error);
        res.status(500).json({ message: 'Error fetching filtered produtos.' });
    }
});

router.post('/', async (req, res) => {
    const { variations, tags, ...productData } = req.body;
    const pool = await getPool();
    const connection = await pool.getConnection();

    try {
        await connection.beginTransaction();

        const [result] = await connection.execute(
            'INSERT INTO produtos (codigo, descricao, grupo_id, preco_custo, preco_venda, tabela_preco, preco_minimo) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [productData.codigo, productData.descricao, productData.grupo_id, productData.preco_custo, productData.preco_venda, productData.tabela_preco, productData.preco_minimo]
        ) as [ResultSetHeader, FieldPacket[]]; // Explicitly cast result to ResultSetHeader
        const productId = result.insertId;
        if (variations && variations.length > 0) {
            for (const v of variations) {
                await connection.execute(
                    'INSERT INTO produto_variacoes (produto_id, sku, tamanho, cor, estoque_atual) VALUES (?, ?, ?, ?, ?)',
                    [productId, v.sku, v.tamanho, v.cor, v.estoque_atual]
                );
            }
        }

        if (tags && tags.length > 0) {
            for (const tag of tags) {
                if (tag.id) {
                    await connection.execute(
                        'INSERT INTO produto_tags (produto_id, tag_id) VALUES (?, ?)',
                        [productId, tag.id]
                    );
                }
            }
        }

        await connection.commit();
        res.status(201).json({ message: 'Product created successfully.', id: productId });
    } catch (error) {
        await connection.rollback();
        console.error('Error creating product:', error);
        res.status(500).json({ message: `Error creating product.` });
    } finally {
        connection.release();
    }
});

router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const { variations, tags, ...productData } = req.body;
    const pool = await getPool();
    const connection = await pool.getConnection();

    try {
        await connection.beginTransaction();

        await connection.execute(
            'UPDATE produtos SET codigo = ?, descricao = ?, grupo_id = ?, preco_custo = ?, preco_venda = ?, tabela_preco = ?, preco_minimo = ? WHERE id = ?',
            [productData.codigo, productData.descricao, productData.grupo_id, productData.preco_custo, productData.preco_venda, productData.tabela_preco, productData.preco_minimo, id]
        );

        // Manage variations: simple approach - delete and recreate
        await connection.execute('DELETE FROM produto_variacoes WHERE produto_id = ?', [id]);
        if (variations && variations.length > 0) {
            for (const v of variations) {
                await connection.execute(
                    'INSERT INTO produto_variacoes (produto_id, sku, tamanho, cor, estoque_atual) VALUES (?, ?, ?, ?, ?)',
                    [id, v.sku, v.tamanho, v.cor, v.estoque_atual]
                );
            }
        }

        // Manage tags: simple approach - delete and recreate
        await connection.execute('DELETE FROM produto_tags WHERE produto_id = ?', [id]);
        if (tags && tags.length > 0) {
            for (const tag of tags) {
                if (tag.id) {
                    await connection.execute(
                        'INSERT INTO produto_tags (produto_id, tag_id) VALUES (?, ?)',
                        [id, tag.id]
                    );
                }
            }
        }

        await connection.commit();
        res.status(200).json({ message: `Product with ID ${id} updated successfully.` });
    } catch (error) {
        await connection.rollback();
        console.error(`Error updating product by ID:`, error);
        res.status(500).json({ message: `Error updating product by ID.` });
    } finally {
        connection.release();
    }
});

router.get('/search', async (req, res) => {
    const { q } = req.query;
    if (!q) {
        return res.status(400).json({ message: 'Query parameter "q" is required.' });
    }
    try {
        const pool = await getPool();
        const [rows] = await pool.execute(
            'SELECT id, descricao, codigo, preco_venda FROM produtos WHERE descricao LIKE ? OR codigo LIKE ? LIMIT 50',
            [`%${q}%`, `%${q}%`]
        );
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error searching products:', error);
        res.status(500).json({ message: 'Error searching products.' });
    }
});

router.get('/:productId/variacoes', async (req, res) => {
    const { productId } = req.params;
    try {
        const pool = await getPool();
        const [rows] = await pool.execute('SELECT * FROM produto_variacoes WHERE produto_id = ?', [productId]);
        res.status(200).json(rows);
    } catch (error) {
        console.error(`Error fetching variations for product ${productId}:`, error);
        res.status(500).json({ message: 'Error fetching product variations.' });
    }
});

router.put('/:productId/variacoes/bulk', async (req, res) => {
    const updatedVariations = req.body as BackendVariation[];
    if (!Array.isArray(updatedVariations) || updatedVariations.length === 0) {
        return res.status(400).json({ message: 'Request body must be a non-empty array of variations.' });
    }

    const pool = await getPool();
    const connection = await pool.getConnection();
    try {
        await connection.beginTransaction();
        for (const variant of updatedVariations) {
            const { id, ...dataToUpdate } = variant;
            await connection.execute(
                'UPDATE produto_variacoes SET tamanho = ?, cor = ?, estoque_atual = ?, sku = ? WHERE id = ?',
                [dataToUpdate.tamanho, dataToUpdate.cor, dataToUpdate.estoque_atual, dataToUpdate.sku, id]
            );
        }
        await connection.commit();
        res.status(200).json({ message: 'Variations updated successfully.' });
    } catch (error) {
        await connection.rollback();
        console.error('Error bulk updating variations:', error);
        res.status(500).json({ message: 'Error bulk updating variations.' });
    } finally {
        connection.release();
    }
});

export default router;
