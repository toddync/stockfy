# Database Documentation

> [!IMPORTANT]
> **SOURCE OF TRUTH**
> The active database schema is defined in the application code at:
> `src/lib/db/schema.ts`
>
> The SQL files in this directory are:
> 1.  **Legacy / Reference**: `create_database.sql`, `db_otimizado.sql` (Derived from the old Delphi system).
> 2.  **Seeds**: `seed_missing_data.sql` (For populating test environments).
>
> Do not use these SQL files to initialize the production application. The app handles initialization automatically via `@tauri-apps/plugin-sql` and the logic in `src/lib/db/db.svelte.ts`.
