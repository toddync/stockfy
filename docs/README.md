# Stockfy System Documentation

## 1. System Overview

Stockfy is a hybrid desktop application that combines the developer experience of a modern web framework (SvelteKit) with the performance and capabilities of a native desktop shell (Tauri).

It is designed to run **offline-first** on a local machine, managing its own SQLite database file directly. There is no remote backend server; the "backend" is effectively the Tauri process communicating with the local file system.

### The Stack

| Layer | Technology | Role |
| :--- | :--- | :--- |
| **Shell** | [Tauri](https://tauri.app/) (Rust) | Native window management, file system access, system tray. |
| **Logic** | [SvelteKit](https://kit.svelte.dev/) | Application routing, UI logic, state management. |
| **Data** | [SQLite](https://www.sqlite.org/) | Relational database engine, stored locally (`stockfy.db`). |
| **UI** | [Shadcn-Svelte](https://www.shadcn-svelte.com/) | Accessible, reusable UI components (TailwindCSS). |

## 2. The Mental Model

To understand how Stockfy works, visualize it not as a client-server app, but as a **local state machine**.

### 2.1. "The Desktop Web App"
Although it looks and feels like a web app (it runs in a WebView), it has "superuser" privileges. It bypasses standard web restrictions (like CORS) because it doesn't make network requests to a server for data; it asks the Rust process to read the local disk.

### 2.2. Imperative Data Flow
Data synchronization is **manual and imperative**. There is no "magic" realtime sync or websocket connection.

1.  **Mount**: When a page loads (`onMount`), the component asks the DB for data (`db.select`).
2.  **State**: The data is stored in local Svelte 5 Runes (`$state`).
3.  **Render**: The UI renders based on this local state.
4.  **Mutation**: precise actions (e.g., clicking "Save") trigger an `async` function.
5.  **Write**: The function executes SQL (`db.execute`).
6.  **Refresh**: The function **must manually** re-fetch data or update the local state to reflect the change.

*> **Key Takeaway**: If you write to the DB, the UI won't update unless you tell it to (by reloading the list or pushing to the array).*

### 2.3. Component Composition
The UI is built atomically. We avoid "Mega-Components". Instead of a giant `CustomerForm.svelte`, we compose:
```svelte
<Card.Root>
  <Card.Header>...</Card.Header>
  <Card.Content>
     <Input />
     <Button />
  </Card.Content>
</Card.Root>
```
This ensures consistent styling and behavior across the entire app.

## 3. Architecture Deep Dive

### 3.1. Database Layer (`src/lib/db`)

Everything starts with `src/lib/db/db.svelte.ts`. This file exports a singleton `DB` class instance.

*   **Initialization**: On app start, `init()` connects to `stockfy.db`.
*   **Schema Enforcement**: It checks if tables exist. If not, it runs `schema.ts`.
*   **Migrations**: It checks the `_migrations` table and applies any new scripts from `migrations.ts`.

**Usage Pattern**:
```typescript
import db from "@/db/db.svelte";

// Read
const users = await db.select("SELECT * FROM users WHERE active = $1", [1]);

// Write
await db.execute("INSERT INTO users (name) VALUES ($1)", ["John"]);
```

### 3.2. Routing & File Structure (`src/routes`)

We use SvelteKit's file-system based routing.

*   `src/routes/clientes/+page.svelte` -> **List View** (`/clientes`)
    *   *Responsibility*: Fetch all clients, handle search/filtering, render the table.
*   `src/routes/clientes/novo/+page.svelte` -> **Create View** (`/clientes/novo`)
    *   *Responsibility*: Render empty form, validate input, insert into DB.
*   `src/routes/clientes/[id]/edit/+page.svelte` -> **Edit View** (`/clientes/123/edit`)
    *   *Responsibility*: Fetch specific client by ID, populate form, update DB.

### 3.3. Business Logic Location

Currently, business logic is **co-located with the UI** in the `.svelte` files.
*   *Validation*: Happens inside `save()` functions in the component.
*   *Calculations*: Happen inside `$derived` runes or utility functions.

*> **Note**: As the app grows, complex logic (like tax calculations or stock movement rules) should be moved to dedicated `src/lib/services/*.ts` files to keep components clean.*

## 4. Domain Deep Dive

Understanding the business entities is crucial for extending the system.

### 4.1. Commercial Structure (The "Who" and "Where")
This is the backbone of sales routing.
*   **`pracas` (Zones)**: Broad geographic areas (e.g., "North Zone", "Downtown").
*   **`rotas` (Routes)**: Specific paths within a Zone (e.g., "Street A to Street B").
*   **Relationship**: A `Cliente` belongs to a `Rota`, which belongs to a `Praca`.
*   **Use Case**: This allows generating calling lists for salespeople based on their daily route.

### 4.2. Fluxo de Vendas (Sales Flow)
The core revenue loop.

1.  **Orçamento (Quote)**: A `Pedido` starts as `pendente`.
2.  **Conversion**: User converts it to a confirmed sale.
3.  **Faturamento (Invoicing)**:
    *   **Stock**: Items are deducted from `produto_variacoes`. A `movimentacoes_estoque` record is created with type `saida_venda`.
    *   **Finance**: A `contas_financeiras` record (Receivable) is created.
        *   If `prazo`, status is `pendente`.
        *   If `vista`, status is `pago`.

### 4.3. Inventory Logic
Stock is tracked at the **Variation** level, not the Product level.
*   *Wrong*: "We have 10 T-Shirts".
*   *Right*: "We have 4 Red S T-Shirts and 6 Blue L T-Shirts".

**`movimentacoes_estoque`** is the source of truth for *history*, but **`produto_variacoes.estoque_atual`** is the cached value used for quick checks. *Ideally, `estoque_atual` should be recalculated from history occasionally to ensure integrity.*

## 5. Styling & Theming

The application uses **Tailwind CSS v4** with a custom theme defined in `src/routes/layout.css`.

*   **Colors**: Defined as OKLCH variables (e.g., `--primary`, `--background`). This allows for silky smooth dark mode transitions.
*   **Components**: We use the `shadcn-svelte` library, which relies on these variables. Modifying `layout.css` propagates changes to all UI components.
*   **Typography**: Uses `Geist Mono` and `JetBrains Mono` for a technical, data-heavy aesthetic.

## 6. Developer Guide: How to Add a New Feature

Example: Adding a "Brands" (Marcas) feature.

1.  **Database**:
    *   Edit `src/lib/db/schema.ts`: Add `CREATE TABLE marcas (...)`.
    *   Edit `src/lib/db/migrations.ts`: Add the `CREATE TABLE` statement to the array (for existing users).
    *   Run the app to apply schema/migrations.

2.  **Types**:
    *   Edit `src/lib/types.ts`: Export `interface Marca { ... }`.

3.  **UI (List)**:
    *   Create `src/routes/marcas/+page.svelte`.
    *   Copy structure from `clientes/+page.svelte`.
    *   Update `select` query and table columns.

4.  **UI (Create/Edit)**:
    *   Create `src/routes/marcas/novo/+page.svelte`.
    *   Link to it from the list page.
    *   Implement `save()` using `INSERT INTO marcas ...`.

5.  **Menu**:
    *   Update `src/routes/+layout.svelte` or sidebar component to add the "Marcas" link.
