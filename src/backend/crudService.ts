import { Pool, RowDataPacket, ResultSetHeader } from 'mysql2/promise';
import Database from './database.js';

interface CrudServiceOptions {
    idColumn?: string; // Name of the ID column, defaults to 'id'
}

class CrudService {
    private pool?: Pool;
    private idColumn: string;

    constructor(options?: CrudServiceOptions) {
        this.idColumn = options?.idColumn || 'id';
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

    async getAll<T extends RowDataPacket>(tableName: string): Promise<T[]> {
        const pool = await this.getPool();
        const [rows] = await pool.execute<T[]>(`SELECT * FROM ${tableName}`);
        return rows;
    }

    async getById<T extends RowDataPacket>(tableName: string, id: string | number): Promise<T | null> {
        const pool = await this.getPool();
        const [rows] = await pool.execute<T[]>(`SELECT * FROM ${tableName} WHERE ${this.idColumn} = ? LIMIT 1`, [id]);
        return rows.length > 0 ? rows[0] : null;
    }

    async create<T extends Record<string, any>>(tableName: string, data: T): Promise<number> {
        const pool = await this.getPool();
        const columns = Object.keys(data).map(key => `${key}`).join(', ');
        const placeholders = Object.keys(data).map(() => '?').join(', ');
        const values = Object.values(data);

        const query = `INSERT INTO ${tableName} (${columns}) VALUES (${placeholders})`;
        const [result] = await pool.execute<ResultSetHeader>(query, values);
        return result.insertId;
    }

    async update<T extends Record<string, any>>(tableName: string, id: string | number, data: Partial<T>): Promise<boolean> {
        const pool = await this.getPool();
        const setClauses = Object.keys(data).map(key => `${key} = ?`).join(', ');
        const values = Object.values(data);

        const query = `UPDATE ${tableName} SET ${setClauses} WHERE ${this.idColumn} = ?`;
        const [result] = await pool.execute<ResultSetHeader>(query, [...values, id]);
        return result.affectedRows > 0;
    }

    async delete(tableName: string, id: string | number): Promise<boolean> {
        const pool = await this.getPool();
        const query = `DELETE FROM ${tableName} WHERE ${this.idColumn} = ?`;
        const [result] = await pool.execute<ResultSetHeader>(query, [id]);
        return result.affectedRows > 0;
    }
}

export default CrudService;