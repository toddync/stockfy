import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import CrudService from './crudService.js';
import Database from './database.js';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const crudService = new CrudService();

// Helper function to get the pool
const getPool = async () => {
    return await Database.getInstance();
};

// --- Specific Routes (No Mocks) ---

// GET /api/produtos with advanced filtering
app.get('/api/produtos', async (req, res) => {
    const filters = req.query;
    let query = 'SELECT * FROM produtos WHERE 1=1';
    const params: any[] = [];

    if (filters.tamanho) {
        query += ' AND tamanho = ?';
        params.push(filters.tamanho);
    }
    if (filters.cor) {
        query += ' AND cor LIKE ?';
        params.push(`%${filters.cor}%`);
    }
    if (filters.genero) {
        query += ' AND genero = ?';
        params.push(filters.genero);
    }
    if (filters.faixaEtaria) {
        query += ' AND "faixaEtaria" = ?';
        params.push(filters.faixaEtaria);
    }
    if (filters.material) {
        query += ' AND material LIKE ?';
        params.push(`%${filters.material}%`);
    }
    if (filters.temporada) {
        query += ' AND temporada = ?';
        params.push(filters.temporada);
    }

    try {
        const pool = await getPool();
        const [rows] = await pool.execute(query, params);
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error fetching filtered produtos:', error);
        res.status(500).json({ message: 'Error fetching filtered produtos.' });
    }
});


// GET /api/resumo-financeiro
app.get('/api/resumo-financeiro', async (req, res) => {
    try {
        const pool = await getPool();
        const [todayResult]: any = await pool.execute("SELECT SUM(valor_total) as total FROM pedidos WHERE DATE(data_pedido) = CURDATE()");
        const [monthResult]: any = await pool.execute("SELECT SUM(valor_total) as total FROM pedidos WHERE MONTH(data_pedido) = MONTH(CURDATE()) AND YEAR(data_pedido) = YEAR(CURDATE())");
        const [ticketResult]: any = await pool.execute("SELECT AVG(valor_total) as ticket FROM pedidos WHERE MONTH(data_pedido) = MONTH(CURDATE()) AND YEAR(data_pedido) = YEAR(CURDATE())");
        const [prevMonthResult]: any = await pool.execute("SELECT SUM(valor_total) as total FROM pedidos WHERE MONTH(data_pedido) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(data_pedido) = YEAR(CURDATE() - INTERVAL 1 MONTH)");

        const vendasDia = todayResult[0].total || 0;
        const vendasMes = monthResult[0].total || 0;
        const ticketMedio = ticketResult[0].ticket || 0;
        const vendasMesAnterior = prevMonthResult[0].total || 0;
        const comparacaoAnterior = vendasMesAnterior > 0 ? ((vendasMes - vendasMesAnterior) / vendasMesAnterior) * 100 : (vendasMes > 0 ? 100 : 0);

        res.status(200).json({
            vendasDia,
            vendasMes,
            ticketMedio,
            comparacaoAnterior,
        });
    } catch (error) {
        console.error('Error fetching financial summary:', error);
        res.status(500).json({ message: 'Error fetching financial summary.' });
    }
});

// GET /api/ranking-produtos
app.get('/api/ranking-produtos', async (req, res) => {
    try {
        const pool = await getPool();
        const [rows] = await pool.execute(`
            SELECT 
                p.id, 
                p.descricao as nome, 
                SUM(pi.quantidade_saida) as quantidade, 
                SUM(pi.preco_venda * pi.quantidade_saida) as valor 
            FROM pedido_itens pi
            JOIN produtos p ON pi.produto_id = p.id
            GROUP BY p.id, p.descricao
            ORDER BY valor DESC
            LIMIT 10
        `);
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error fetching product ranking:', error);
        res.status(500).json({ message: 'Error fetching product ranking.' });
    }
});

// GET /api/pedidos/:id/detalhes
app.get('/api/pedidos/:id/detalhes', async (req, res) => {
    const { id } = req.params;
    try {
        const pool = await getPool();
        const [pedidoRows]: any = await pool.execute(`
            SELECT p.*, c.nome as cliente_nome 
            FROM pedidos p 
            LEFT JOIN clientes c ON p.cliente_id = c.id 
            WHERE p.id = ?
        `, [id]);

        if (pedidoRows.length === 0) {
            return res.status(404).json({ message: `Pedido with ID ${id} not found.` });
        }

        const [itemRows] = await pool.execute('SELECT * FROM pedido_itens WHERE pedido_id = ?', [id]);
        
        const pedido = pedidoRows[0];
        pedido.itens = itemRows;

        res.status(200).json(pedido);
    } catch (error) {
        console.error(`Error fetching order details for ID ${id}:`, error);
        res.status(500).json({ message: 'Error fetching order details.' });
    }
});

// POST /api/pedidos/:id/itens
app.post('/api/pedidos/:id/itens', async (req, res) => {
    const { id: pedido_id } = req.params;
    const newItem = { ...req.body, pedido_id };
    try {
        const insertId = await crudService.create('pedido_itens', newItem);
        res.status(201).json({ message: `Item added to pedido ${pedido_id} successfully.`, id: insertId });
    } catch (error) {
        console.error(`Error adding item to order ${pedido_id}:`, error);
        res.status(500).json({ message: 'Error adding item to order.' });
    }
});

// PUT /api/pedidos/:pedidoId/itens/:itemId
app.put('/api/pedidos/:pedidoId/itens/:itemId', async (req, res) => {
    const { itemId } = req.params;
    const updatedItem = req.body;
    try {
        const success = await crudService.update('pedido_itens', itemId, updatedItem);
        if (success) {
            res.status(200).json({ message: `Item ${itemId} updated successfully.` });
        } else {
            res.status(404).json({ message: `Item with ID ${itemId} not found.` });
        }
    } catch (error) {
        console.error(`Error updating item ${itemId}:`, error);
        res.status(500).json({ message: 'Error updating item.' });
    }
});

// DELETE /api/pedidos/:pedidoId/itens/:itemId
app.delete('/api/pedidos/:pedidoId/itens/:itemId', async (req, res) => {
    const { itemId } = req.params;
    try {
        const success = await crudService.delete('pedido_itens', itemId);
        if (success) {
            res.status(200).json({ message: `Item ${itemId} deleted successfully.` });
        } else {
            res.status(404).json({ message: `Item with ID ${itemId} not found.` });
        }
    } catch (error) {
        console.error(`Error deleting item ${itemId}:`, error);
        res.status(500).json({ message: 'Error deleting item.' });
    }
});


// GET /api/produtos/search
app.get('/api/produtos/search', async (req, res) => {
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

// GET /api/produtos/:productId/variacoes
app.get('/api/produtos/:productId/variacoes', async (req, res) => {
    const { productId } = req.params;
    try {
        const data = await crudService.getAll(`produto_variacoes WHERE produto_id = ${productId}`);
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching variations for product ${productId}:`, error);
        res.status(500).json({ message: 'Error fetching product variations.' });
    }
});

// PUT /api/produtos/:productId/variacoes/bulk
app.put('/api/produtos/:productId/variacoes/bulk', async (req, res) => {
    const updatedVariations = req.body as any[];
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
                'UPDATE produto_variacoes SET estoque = ?, preco_adicional = ? WHERE id = ?',
                [dataToUpdate.estoque, dataToUpdate.precoAdicional, id]
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

// GET /api/produtos/abc-analysis
app.get('/api/produtos/abc-analysis', async (req, res) => {
    try {
        const pool = await getPool();
        const [rows]: any = await pool.execute(`
            WITH ProductSales AS (
                SELECT 
                    p.id,
                    p.descricao AS nome,
                    SUM(pi.preco_venda * pi.quantidade_saida) AS valorTotalVendas
                FROM pedido_itens pi
                JOIN produtos p ON pi.produto_id = p.id
                GROUP BY p.id, p.descricao
            ),
            CumulativeSales AS (
                SELECT
                    id,
                    nome,
                    valorTotalVendas,
                    SUM(valorTotalVendas) OVER (ORDER BY valorTotalVendas DESC) AS cumulativeValue,
                    (SELECT SUM(valorTotalVendas) FROM ProductSales) AS totalSales
                FROM ProductSales
            )
            SELECT
                id,
                nome,
                valorTotalVendas,
                (cumulativeValue / totalSales) * 100 AS porcentagemAcumulada,
                CASE
                    WHEN (cumulativeValue / totalSales) * 100 <= 80 THEN 'A'
                    WHEN (cumulativeValue / totalSales) * 100 <= 95 THEN 'B'
                    ELSE 'C'
                END AS classe
            FROM CumulativeSales
            ORDER BY valorTotalVendas DESC;
        `);
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error fetching ABC analysis:', error);
        res.status(500).json({ message: 'Error fetching ABC analysis.' });
    }
});

// GET /api/heatmap-vendas-grupos
app.get('/api/heatmap-vendas-grupos', async (req, res) => {
    try {
        const pool = await getPool();
        const [rows]: any = await pool.execute(`
            SELECT 
                g.descricao as grupo,
                SUM(pi.preco_venda * pi.quantidade_saida) as vendas
            FROM pedido_itens pi
            JOIN produtos p ON pi.produto_id = p.id
            JOIN produto_grupos g ON p.grupo_id = g.id
            GROUP BY g.descricao
            ORDER BY vendas DESC;
        `);
        // Simple color logic, can be improved
        const maxVendas = Math.max(...rows.map((r: any) => r.vendas));
        const data = rows.map((r: any) => {
            const ratio = r.vendas / maxVendas;
            let cor = '#ef4444'; // red
            if (ratio > 0.66) cor = '#22c55e'; // green
            else if (ratio > 0.33) cor = '#f97316'; // orange
            return { ...r, cor };
        });
        res.status(200).json(data);
    } catch (error) {
        console.error('Error fetching sales heatmap:', error);
        res.status(500).json({ message: 'Error fetching sales heatmap.' });
    }
});

// GET /api/sistema-alertas
app.get('/api/sistema-alertas', async (req, res) => {
    try {
        const pool = await getPool();
        const [lowStock]: any = await pool.execute('SELECT id, descricao, estoque_atual FROM produtos WHERE estoque_atual < 10'); // Assuming 10 is the minimum stock
        const [staleProducts]: any = await pool.execute(`
            SELECT p.id, p.descricao, p.data_atualizacao
            FROM produtos p 
            WHERE p.data_atualizacao < DATE_SUB(CURDATE(), INTERVAL 60 DAY)
        `);
        
        const alerts = [];
        lowStock.forEach((p: any) => alerts.push({ id: `ls-${p.id}`, tipo: 'estoque_baixo', mensagem: `Estoque baixo para ${p.descricao} (${p.estoque_atual} un.)`, data: new Date().toISOString(), resolvido: false }));
        staleProducts.forEach((p: any) => alerts.push({ id: `sp-${p.id}`, tipo: 'produto_parado', mensagem: `Produto "${p.descricao}" sem vendas desde ${new Date(p.data_atualizacao).toLocaleDateString()}`, data: new Date().toISOString(), resolvido: false }));
        
        res.status(200).json(alerts);
    } catch (error) {
        console.error('Error fetching system alerts:', error);
        res.status(500).json({ message: 'Error fetching system alerts.' });
    }
});

// GET /api/grafico-tendencias
app.get('/api/grafico-tendencias', async (req, res) => {
    try {
        const pool = await getPool();
        const [rows]: any = await pool.execute(`
            SELECT 
                DATE_FORMAT(data_pedido, '%Y-%m') as mes,
                SUM(valor_total) as vendas
            FROM pedidos
            WHERE data_pedido >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
            GROUP BY mes
            ORDER BY mes;
        `);
        // This needs more logic to separate current/previous year, but it's a start
        const trendData = rows.map((r: any) => ({
            mes: r.mes,
            vendasAnoAtual: r.vendas, // Simplified for now
            vendasAnoAnterior: 0 // Needs a more complex query
        }));
        res.status(200).json(trendData);
    } catch (error) {
        console.error('Error fetching trend data:', error);
        res.status(500).json({ message: 'Error fetching trend data.' });
    }
});

// GET /api/performance-vendedores
app.get('/api/performance-vendedores', async (req, res) => {
    try {
        const pool = await getPool();
        const [rows] = await pool.execute(`
            SELECT 
                v.id,
                v.nome,
                SUM(p.valor_total) as vendasMes
            FROM vendedores v
            LEFT JOIN pedidos p ON v.id = p.vendedor_id AND MONTH(p.data_pedido) = MONTH(CURDATE()) AND YEAR(p.data_pedido) = YEAR(CURDATE())
            GROUP BY v.id, v.nome
        `);
        res.status(200).json(rows);
    } catch (error) {
        console.error('Error fetching vendor performance:', error);
        res.status(500).json({ message: 'Error fetching vendor performance.' });
    }
});

// GET /api/indicadores-giro
app.get('/api/indicadores-giro', async (req, res) => {
    try {
        const pool = await getPool();
        // These are complex calculations and might need more refined queries
        const [costOfGoodsSold]: any = await pool.execute("SELECT SUM(pi.quantidade_saida * pr.preco_custo) as total FROM pedido_itens pi JOIN produtos pr ON pi.produto_id = pr.id JOIN pedidos p ON pi.pedido_id = p.id WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)");
        const [avgInventory]: any = await pool.execute("SELECT AVG(estoque_atual * preco_custo) as avg_inv FROM produtos");

        const cmv = costOfGoodsSold[0].total || 0;
        const estoqueMedio = avgInventory[0].avg_inv || 0;

        const taxaGiro = estoqueMedio > 0 ? cmv / estoqueMedio : 0;
        const coberturaEstoque = taxaGiro > 0 ? 365 / taxaGiro : 0;

        res.status(200).json({
            taxaGiro,
            coberturaEstoque,
            diasVendaCobertos: coberturaEstoque, // Simplified
        });
    } catch (error) {
        console.error('Error fetching stock turnover indicators:', error);
        res.status(500).json({ message: 'Error fetching stock turnover indicators.' });
    }
});

// GET /api/pedidos/ticket-medio-analysis
app.get('/api/pedidos/ticket-medio-analysis', async (req, res) => {
    try {
        const pool = await getPool();
        const query = (interval: string) => `
            SELECT 
                '${interval}' as periodo,
                AVG(p.valor_total) as valorMedio,
                (SELECT COUNT(*) FROM pedido_itens pi WHERE pi.pedido_id = p.id) as itensPorPedido,
                COUNT(p.id) as totalPedidos,
                SUM(p.valor_total) as totalVendas
            FROM pedidos p
            WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL ${interval})
        `;
        const [d7]: any = await pool.execute(query('7 DAY'));
        const [m1]: any = await pool.execute(query('1 MONTH'));
        const [m3]: any = await pool.execute(query('3 MONTH'));
        
        res.status(200).json([d7[0], m1[0], m3[0]]);
    } catch (error) {
        console.error('Error fetching ticket medio analysis:', error);
        res.status(500).json({ message: 'Error fetching ticket medio analysis.' });
    }
});

// GET /api/produtos/:productId/cross-selling-suggestions
app.get('/api/produtos/:productId/cross-selling-suggestions', async (req, res) => {
    const { productId } = req.params;
    try {
        const pool = await getPool();
        const [rows] = await pool.execute(`
            SELECT p2.id, p2.descricao, p2.codigo, p2.preco_venda
            FROM pedido_itens pi1
            JOIN pedido_itens pi2 ON pi1.pedido_id = pi2.pedido_id AND pi1.produto_id != pi2.produto_id
            JOIN produtos p2 ON pi2.produto_id = p2.id
            WHERE pi1.produto_id = ?
            GROUP BY p2.id, p2.descricao, p2.codigo, p2.preco_venda
            ORDER BY COUNT(pi1.pedido_id) DESC
            LIMIT 5;
        `, [productId]);
        res.status(200).json(rows);
    } catch (error) {
        console.error(`Error fetching cross-selling suggestions for product ${productId}:`, error);
        res.status(500).json({ message: 'Error fetching cross-selling suggestions.' });
    }
});

// GET /api/pedidos/:pedidoId/timeline
app.get('/api/pedidos/:pedidoId/timeline', async (req, res) => {
    const { pedidoId } = req.params;
    try {
        // Assuming a 'pedido_eventos' table exists
        const data = await crudService.getAll(`pedido_eventos WHERE pedido_id = ${pedidoId} ORDER BY created_at`);
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching timeline for order ${pedidoId}:`, error);
        res.status(500).json({ message: 'Error fetching order timeline.' });
    }
});

// GET /api/pedidos-recorrentes
app.get('/api/pedidos-recorrentes', async (req, res) => {
    try {
        const data = await crudService.getAll('pedidos_recorrentes');
        res.status(200).json(data);
    } catch (error) {
        console.error('Error fetching recurring orders:', error);
        res.status(500).json({ message: 'Error fetching recurring orders.' });
    }
});

// PUT /api/pedidos-recorrentes/:id
app.put('/api/pedidos-recorrentes/:id', async (req, res) => {
    const { id } = req.params;
    const updatedData = req.body;
    try {
        const success = await crudService.update('pedidos_recorrentes', id, updatedData);
        if (success) {
            res.status(200).json({ message: `Recurring order with ID ${id} updated successfully.` });
        } else {
            res.status(404).json({ message: `Recurring order with ID ${id} not found or no changes made.` });
        }
    } catch (error) {
        console.error(`Error updating recurring order by ID:`, error);
        res.status(500).json({ message: 'Error updating recurring order by ID.' });
    }
});


// --- Generic CRUD Routes (Keep as fallback) ---

app.get('/api/:tableName', async (req, res) => {
    const { tableName } = req.params;
    try {
        const data = await crudService.getAll(tableName);
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching all from ${tableName}:`, error);
        res.status(500).json({ message: `Error fetching data from ${tableName}.` });
    }
});

app.get('/api/:tableName/:id', async (req, res) => {
    const { tableName, id } = req.params;
    try {
        const data = await crudService.getById(tableName, id);
        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: `${tableName} with ID ${id} not found.` });
        }
    } catch (error) {
        console.error(`Error fetching ${tableName} by ID:`, error);
        res.status(500).json({ message: `Error fetching ${tableName} by ID.` });
    }
});

app.post('/api/:tableName', async (req, res) => {
    const { tableName } = req.params;
    const newData = req.body;
    try {
        const insertId = await crudService.create(tableName, newData);
        res.status(201).json({ message: `${tableName} created successfully.`, id: insertId });
    } catch (error) {
        console.error(`Error creating ${tableName}:`, error);
        res.status(500).json({ message: `Error creating ${tableName}.` });
    }
});

app.put('/api/:tableName/:id', async (req, res) => {
    const { tableName, id } = req.params;
    const updatedData = req.body;
    try {
        const success = await crudService.update(tableName, id, updatedData);
        if (success) {
            res.status(200).json({ message: `${tableName} with ID ${id} updated successfully.` });
        } else {
            res.status(404).json({ message: `${tableName} with ID ${id} not found or no changes made.` });
        }
    } catch (error) {
        console.error(`Error updating ${tableName} by ID:`, error);
        res.status(500).json({ message: `Error updating ${tableName} by ID.` });
    }
});

app.delete('/api/:tableName/:id', async (req, res) => {
    const { tableName, id } = req.params;
    try {
        const success = await crudService.delete(tableName, id);
        if (success) {
            res.status(200).json({ message: `${tableName} with ID ${id} deleted successfully.` });
        } else {
            res.status(404).json({ message: `${tableName} with ID ${id} not found.` });
        }
    } catch (error) {
        console.error(`Error deleting ${tableName} by ID:`, error);
        res.status(500).json({ message: `Error deleting ${tableName} by ID.` });
    }
});

app.get('/', (req, res) => {
    res.send('Stockify Renewed Backend is running!');
});

// Start the server
app.listen(port, () => {
  console.log(`Backend server running on http://localhost:${port}`);
});