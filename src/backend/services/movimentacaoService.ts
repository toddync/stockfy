import Database from '../database.js';
import type { Pool, RowDataPacket, ResultSetHeader } from 'mysql2/promise';

interface DevolucaoData {
    produto_id: number;
    quantidade: number;
    tipo_movimentacao: 'devolucao' | 'defeito';
    observacoes?: string;
    // We might need cliente_id or vendedor_id in the future, but let's keep it simple for now
}

interface AjusteData {
    produto_id: number;
    quantidade: number;
    tipo_ajuste: 'entrada' | 'saida' | 'perda' | 'quebra';
    observacoes?: string;
}

class MovimentacaoService {
    private pool: Pool | undefined;

    constructor() {
        this.initializePool();
    }

    private async initializePool() {
        this.pool = await Database.getInstance();
    }

    private async getPool(): Promise<Pool> {
        if (!this.pool) {
            await this.initializePool();
        }
        return this.pool!;
    }

    async registrarDevolucao(data: DevolucaoData): Promise<number> {
        const pool = await this.getPool();
        const connection = await pool.getConnection();

        try {
            await connection.beginTransaction();

            // 1. Create the 'movimentacoes_estoque' record
            const movimentacaoInsertData = {
                tipo_movimentacao: data.tipo_movimentacao,
                numero_documento: `DEV-${Date.now()}`, // Auto-generate a document number
                data_documento: new Date(),
                data_base: new Date(),
                observacoes: data.observacoes
            };

            const [movimentacaoResult] = await connection.execute<ResultSetHeader>(
                'INSERT INTO movimentacoes_estoque SET ?',
                [movimentacaoInsertData]
            );
            const movimentacaoId = movimentacaoResult.insertId;

            // 2. Get product cost
            const [productRows] = await connection.execute<RowDataPacket[]>(
                'SELECT preco_custo FROM produtos WHERE id = ?',
                [data.produto_id]
            );
            const preco_custo = productRows.length > 0 ? productRows[0].preco_custo : 0;

            // 3. Create the 'movimentacao_itens' record
            const itemInsertData = {
                movimentacao_id: movimentacaoId,
                produto_id: data.produto_id,
                quantidade: data.quantidade,
                preco_custo: preco_custo
            };
            await connection.execute('INSERT INTO movimentacao_itens SET ?', [itemInsertData]);

            // 4. If it's a simple return (not a defect), update the stock.
            // This is a simplified logic. It assumes the main product has stock.
            // A more complex system would update a specific variation (tamanho/cor).
            if (data.tipo_movimentacao === 'devolucao') {
                await connection.execute(
                    'UPDATE produtos SET estoque_atual = estoque_atual + ? WHERE id = ?',
                    [data.quantidade, data.produto_id]
                );
            }
            
            await connection.commit();
            return movimentacaoId;

        } catch (error) {
            await connection.rollback();
            console.error('Error in registrarDevolucao transaction:', error);
            throw new Error('Failed to register return in database.');
        } finally {
            connection.release();
        }
    }

    async registrarAjuste(data: AjusteData): Promise<number> {
        const pool = await this.getPool();
        const connection = await pool.getConnection();

        try {
            await connection.beginTransaction();

            // 1. Determine movimentacao_tipo and stock adjustment
            let movimentacaoTipo: string;
            let stockChangeFactor: number; // +1 for increase, -1 for decrease

            switch (data.tipo_ajuste) {
                case 'entrada':
                    movimentacaoTipo = 'ajuste_entrada';
                    stockChangeFactor = 1;
                    break;
                case 'saida':
                    movimentacaoTipo = 'ajuste_saida';
                    stockChangeFactor = -1;
                    break;
                case 'perda':
                    movimentacaoTipo = 'ajuste_perda';
                    stockChangeFactor = -1;
                    break;
                case 'quebra':
                    movimentacaoTipo = 'ajuste_quebra';
                    stockChangeFactor = -1;
                    break;
                default:
                    throw new Error('Tipo de ajuste inválido.');
            }

            // 2. Create the 'movimentacoes_estoque' record
            const movimentacaoInsertData = {
                tipo_movimentacao: movimentacaoTipo,
                numero_documento: `AJT-${Date.now()}`, // Auto-generate a document number
                data_documento: new Date(),
                data_base: new Date(),
                observacoes: data.observacoes
            };

            const [movimentacaoResult] = await connection.execute<ResultSetHeader>(
                'INSERT INTO movimentacoes_estoque SET ?',
                [movimentacaoInsertData]
            );
            const movimentacaoId = movimentacaoResult.insertId;

            // 3. Get product cost
            const [productRows] = await connection.execute<RowDataPacket[]>(
                'SELECT preco_custo FROM produtos WHERE id = ?',
                [data.produto_id]
            );
            const preco_custo = productRows.length > 0 ? productRows[0].preco_custo : 0;

            // 4. Create the 'movimentacao_itens' record
            const itemInsertData = {
                movimentacao_id: movimentacaoId,
                produto_id: data.produto_id,
                quantidade: data.quantidade,
                preco_custo: preco_custo
            };
            await connection.execute('INSERT INTO movimentacao_itens SET ?', [itemInsertData]);

            // 5. Update the stock
            await connection.execute(
                'UPDATE produtos SET estoque_atual = estoque_atual + (? * ?) WHERE id = ?',
                [stockChangeFactor, data.quantidade, data.produto_id]
            );
            
            await connection.commit();
            return movimentacaoId;

        } catch (error) {
            await connection.rollback();
            console.error('Error in registrarAjuste transaction:', error);
            throw new Error('Failed to register stock adjustment in database.');
        } finally {
            connection.release();
        }
    }
}

export default new MovimentacaoService();
