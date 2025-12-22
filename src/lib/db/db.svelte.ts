import Database from "@tauri-apps/plugin-sql";
import schema from "./schema";
import seed from "./seed";

class DB {
    db = $state<Database | undefined>();

    async init() {
        this.db = await Database.load("sqlite:stockfy.db");

        if (
            !(
                (await this.db.select(
                    "SELECT name FROM sqlite_schema WHERE type='table' ORDER BY name",
                )) as Array<unknown>
            ).length
        ) {
            console.log("cool");
            try {
                await this.db.execute(schema);
            } catch (_: unknown) {
                /* empty */
            }

            try {
                await this.db.execute(seed);
            } catch (_: unknown) {
                /* empty */
            }
        }
    }

    execute(query: string, bindValues: unknown[]) {
        return this.db!.execute(query, bindValues);
    }

    select(query: string, bindValues: unknown[]) {
        return this.db!.select(query, bindValues);
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
