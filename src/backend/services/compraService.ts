import Database from '../database.js';
import type { Pool, ResultSetHeader } from 'mysql2/promise';

interface CompraData {
    numero_pedido: string;
    tipo_pedido?: string;
    fornecedor_id: number;
    data_pedido: string;
    data_entrega?: string;
    data_nota?: string;
    tipo_nota?: string;
    numero_nota?: string;
    valor_total_pedido?: number;
    valor_total_nota?: number;
    desconto?: number;
    frete?: number;
    situacao?: string;
    parcelas?: string;
    observacoes?: string;
}

interface CompraItemData {
    produto_id: number;
    quantidade: number;
    preco_compra: number;
    desconto?: number;
    valor_total: number;
    tamanho?: string;
    cor?: string;
}

class CompraService {
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

    async novaCompra(compraData: CompraData, itensData: CompraItemData[]): Promise<number> {
        const pool = await this.getPool();
        const connection = await pool.getConnection();

        try {
            await connection.beginTransaction();

            // 1. Insert the new Compra (purchase order)
            const compraColumns = Object.keys(compraData).join(', ');
            const compraPlaceholders = Object.keys(compraData).map(() => '?').join(', ');
            const compraValues = Object.values(compraData);

            const [compraResult] = await connection.execute<ResultSetHeader>(
                `INSERT INTO compras (${compraColumns}) VALUES (${compraPlaceholders})`,
                compraValues
            );
            const compraId = compraResult.insertId;

            // 2. Insert all CompraItems (purchase order items)
            if (itensData && itensData.length > 0) {
                for (const item of itensData) {
                    const itemToInsert = { ...item, compra_id: compraId };
                    const itemColumns = Object.keys(itemToInsert).join(', ');
                    const itemPlaceholders = Object.keys(itemToInsert).map(() => '?').join(', ');
                    const itemValues = Object.values(itemToInsert);

                    await connection.execute(
                        `INSERT INTO compra_itens (${itemColumns}) VALUES (${itemPlaceholders})`,
                        itemValues
                    );
                }
            }

            await connection.commit();
            return compraId;

        } catch (error) {
            await connection.rollback();
            console.error('Error in novaCompra transaction:', error);
            throw new Error('Failed to create new purchase and its items in database.');
        } finally {
            connection.release();
        }
    }
}

export default new CompraService();
