import Database, { type QueryResult } from "@tauri-apps/plugin-sql";
import schema from "./schema";
import seed from "./seed";
import migrations from "./migrations";

class DB {
    db = $state<Database | undefined>();

    async init() {
        this.db = await Database.load("sqlite:stockfy.db");
        let l = !(
            (await this.db.select(
                "SELECT name FROM sqlite_schema WHERE type='table' ORDER BY name",
            )) as Array<unknown>
        ).length;

        try {
            await this.db.execute(schema);
        } catch (_: unknown) {}

        if (l) {
            try {
                await this.db.execute(seed);
            } catch (_: unknown) {}
        }

        // Run migrations
        await this.db.execute(
            `CREATE TABLE IF NOT EXISTS _migrations (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                migration_id INTEGER NOT NULL UNIQUE,
                applied_at DATETIME DEFAULT CURRENT_TIMESTAMP
            );`,
        );

        const appliedMigrations = (await this.db.select(
            "SELECT migration_id FROM _migrations",
        )) as { migration_id: number }[];

        const appliedIds = new Set(
            appliedMigrations.map((m) => m.migration_id),
        );

        for (let i = 0; i < migrations.length; i++) {
            if (!appliedIds.has(i)) {
                console.log(`Applying migration ${i}...`);
                try {
                    await this.db.execute(migrations[i]);
                    await this.db.execute(
                        "INSERT INTO _migrations (migration_id) VALUES ($1)",
                        [i],
                    );
                } catch (e) {
                    console.error(`Error applying migration ${i}:`, e);
                }
            }
        }
    }

    execute(query: string, bindValues: unknown[]): Promise<QueryResult> {
        return this.db!.execute(query, bindValues);
    }

    select<T>(query: string, bindValues: unknown[]): Promise<Array<T>> {
        return this.db!.select<Array<T>>(query, bindValues);
    }

    close() {
        return this.db!.close();
    }
}

export default new DB();

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function queryHelper<T extends Record<string, any>>(data: T) {
    const columns = Object.keys(data)
        .map((key) => `${key}`)
        .join(", ");

    const placeholders = Object.keys(data)
        .map((_, i) => `$${i + 1}`)
        .join(", ");

    const setClauses = Object.keys(data)
        .map((key, i) => `${key} = $${i + 1}`)
        .join(", ");

    const values = Object.values(data);

    return { columns, placeholders, setClauses, values };
}
