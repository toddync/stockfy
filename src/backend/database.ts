import mysql, { type Pool, type PoolOptions } from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

class Database {
    private static instance: Pool;

    private constructor() {}

    public static async getInstance(): Promise<Pool> {
        if (!Database.instance) {
            const access: PoolOptions = {
                host: process.env.DB_HOST || 'localhost',
                user: process.env.DB_USER || 'root',
                password: process.env.DB_PASSWORD || '',
                database: process.env.DB_NAME || 'stockify_db',
                waitForConnections: true,
                connectionLimit: 10,
                queueLimit: 0
            };

            try {
                Database.instance = await mysql.createPool(access);
                console.log('Database connection pool created successfully.');
            } catch (error) {
                console.error('Failed to create database connection pool:', error);
                throw new Error('Could not connect to the database.');
            }
        }
        return Database.instance;
    }
}

export default Database;
