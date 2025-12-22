import type { Pool, RowDataPacket, ResultSetHeader } from 'mysql2/promise';
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

    async create<T extends Record<string, any>>(tableName: string, data: T): Promise<number> { // eslint-disable-line @typescript-eslint/no-explicit-any
        const pool = await this.getPool();
        const columns = Object.keys(data).map(key => `${key}`).join(', ');
        const placeholders = Object.keys(data).map(() => '?').join(', ');
        const values = Object.values(data);

        const query = `INSERT INTO ${tableName} (${columns}) VALUES (${placeholders})`;
        const [result] = await pool.execute<ResultSetHeader>(query, values);
        return result.insertId;
    }

    async update<T extends Record<string, any>>(tableName: string, id: string | number, data: Partial<T>): Promise<boolean> { // eslint-disable-line @typescript-eslint/no-explicit-any
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

    async getPaginated<T extends RowDataPacket>(
        tableName: string,
        page: number = 1,
        limit: number = 10,
        sortField: string = 'id',
        sortOrder: 'asc' | 'desc' = 'asc',
        filters: Record<string, any> = {} // eslint-disable-line @typescript-eslint/no-explicit-any
    ): Promise<{ data: T[], total: number, page: number, totalPages: number }> {
        const pool = await this.getPool();
        const offset = (page - 1) * limit;

        // Build WHERE clause
        const whereClauses: string[] = [];
        const values: any[] = []; // eslint-disable-line @typescript-eslint/no-explicit-any

        for (const [key, value] of Object.entries(filters)) {
            if (value !== undefined && value !== null && value !== '') {
                whereClauses.push(`${key} LIKE ?`);
                values.push(`%${value}%`);
            }
        }

        const whereSql = whereClauses.length > 0 ? `WHERE ${whereClauses.join(' AND ')}` : '';

        // Count total
        const [countResult] = await pool.execute<RowDataPacket[]>(
            `SELECT COUNT(*) as total FROM ${tableName} ${whereSql}`,
            values
        );
        const total = (countResult[0] as { total: number }).total;

        // Fetch data
        const [rows] = await pool.execute<T[]>(
            `SELECT * FROM ${tableName} ${whereSql} ORDER BY ${sortField} ${sortOrder} LIMIT ? OFFSET ?`,
            [...values, limit, offset]
        );

        return {
            data: rows,
            total,
            page,
            totalPages: Math.ceil(total / limit)
        };
    }
}

export default CrudService;