import { Router } from "express";
import CrudService from "../crudService.js";
import Database from "../database.js";
import type { Pool, RowDataPacket } from "mysql2/promise";

const router = Router();
const crudService = new CrudService();
const TABLE_NAME = "pedidos";

const getPool = async (): Promise<Pool> => {
    return await Database.getInstance();
};

// --- Specific Pedidos Routes ---

// GET /api/pedidos/ticket-medio-analysis
router.get("/ticket-medio-analysis", async (_req, res) => {
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
        const [d7rows] = await pool.execute<RowDataPacket[]>(query("7 DAY"));
        const [m1rows] = await pool.execute<RowDataPacket[]>(query("1 MONTH"));
        const [m3rows] = await pool.execute<RowDataPacket[]>(query("3 MONTH"));

        res.status(200).json([d7rows[0], m1rows[0], m3rows[0]]);
    } catch (error) {
        console.error("Error fetching ticket medio analysis:", error);
        res.status(500).json({
            message: "Error fetching ticket medio analysis.",
        });
    }
});

// GET /api/pedidos/:id/detalhes
router.get("/:id/detalhes", async (req, res) => {
    const { id } = req.params;
    try {
        const pool = await getPool();
        const [pedidoRows] = await pool.execute<RowDataPacket[]>(
            `
            SELECT p.*, c.nome as cliente_nome, v.nome as vendedor_nome
            FROM pedidos p
            LEFT JOIN clientes c ON p.cliente_id = c.id
            LEFT JOIN vendedores v ON p.vendedor_id = v.id
            WHERE p.id = ?
        `,
            [id],
        );

        if (pedidoRows.length === 0) {
            return res
                .status(404)
                .json({ message: `Pedido with ID ${id} not found.` });
        }

        const [itemRows] = await pool.execute(
            `
                SELECT pi.*, p.descricao as nome, p.codigo as codigo
                FROM pedido_itens pi
                LEFT JOIN produtos p ON pi.produto_id = p.id
                WHERE pedido_id = ?
            `,
            [id],
        );

        const pedido = pedidoRows[0];
        pedido.itens = itemRows;

        res.status(200).json(pedido);
    } catch (error) {
        console.error(`Error fetching order details for ID ${id}:`, error);
        res.status(500).json({ message: "Error fetching order details." });
    }
});

// GET /api/pedidos/:pedidoId/timeline
router.get("/:pedidoId/timeline", async (req, res) => {
    const { pedidoId } = req.params;
    try {
        // Assuming a 'pedido_eventos' table exists
        const data = await crudService.getAll(
            `pedido_eventos WHERE pedido_id = ${pedidoId} ORDER BY created_at`,
        );
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching timeline for order ${pedidoId}:`, error);
        res.status(500).json({ message: "Error fetching order timeline." });
    }
});

// POST /api/pedidos/:id/itens
router.post("/:id/itens", async (req, res) => {
    const { id: pedido_id } = req.params;
    const newItem = { ...req.body, pedido_id };
    try {
        const insertId = await crudService.create("pedido_itens", newItem);
        res.status(201).json({
            message: `Item added to pedido ${pedido_id} successfully.`,
            id: insertId,
        });
    } catch (error) {
        console.error(`Error adding item to order ${pedido_id}:`, error);
        res.status(500).json({ message: "Error adding item to order." });
    }
});

// PUT /api/pedidos/:pedidoId/itens/:itemId
router.put("/:pedidoId/itens/:itemId", async (req, res) => {
    const { itemId } = req.params;
    const updatedItem = req.body;
    try {
        const success = await crudService.update(
            "pedido_itens",
            itemId,
            updatedItem,
        );
        if (success) {
            res.status(200).json({
                message: `Item ${itemId} updated successfully.`,
            });
        } else {
            res.status(404).json({
                message: `Item with ID ${itemId} not found.`,
            });
        }
    } catch (error) {
        console.error(`Error updating item ${itemId}:`, error);
        res.status(500).json({ message: "Error updating item." });
    }
});

// DELETE /api/pedidos/:pedidoId/itens/:itemId
router.delete("/:pedidoId/itens/:itemId", async (req, res) => {
    const { itemId } = req.params;
    try {
        const success = await crudService.delete("pedido_itens", itemId);
        if (success) {
            res.status(200).json({
                message: `Item ${itemId} deleted successfully.`,
            });
        } else {
            res.status(404).json({
                message: `Item with ID ${itemId} not found.`,
            });
        }
    } catch (error) {
        console.error(`Error deleting item ${itemId}:`, error);
        res.status(500).json({ message: "Error deleting item." });
    }
});

// --- Generic CRUD Routes for Pedidos ---

// GET all
router.get("/", async (_req, res) => {
    try {
        const data = await crudService.getAll(TABLE_NAME);
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching all from ${TABLE_NAME}:`, error);
        res.status(500).json({
            message: `Error fetching data from ${TABLE_NAME}.`,
        });
    }
});

// GET by ID
router.get("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const data = await crudService.getById(TABLE_NAME, id);
        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({
                message: `${TABLE_NAME} with ID ${id} not found.`,
            });
        }
    } catch (error) {
        console.error(`Error fetching ${TABLE_NAME} by ID:`, error);
        res.status(500).json({
            message: `Error fetching ${TABLE_NAME} by ID.`,
        });
    }
});

// POST new
router.post("/", async (req, res) => {
    const newData = req.body;
    try {
        const insertId = await crudService.create(TABLE_NAME, newData);
        res.status(201).json({
            message: `${TABLE_NAME} created successfully.`,
            id: insertId,
        });
    } catch (error) {
        console.error(`Error creating ${TABLE_NAME}:`, error);
        res.status(500).json({ message: `Error creating ${TABLE_NAME}.` });
    }
});

// PUT update
router.put("/:id", async (req, res) => {
    const { id } = req.params;
    const updatedData = req.body;
    try {
        const success = await crudService.update(TABLE_NAME, id, updatedData);
        if (success) {
            res.status(200).json({
                message: `${TABLE_NAME} with ID ${id} updated successfully.`,
            });
        } else {
            res.status(404).json({
                message: `${TABLE_NAME} with ID ${id} not found or no changes made.`,
            });
        }
    } catch (error) {
        console.error(`Error updating ${TABLE_NAME} by ID:`, error);
        res.status(500).json({
            message: `Error updating ${TABLE_NAME} by ID.`,
        });
    }
});

// DELETE
router.delete("/:id", async (req, res) => {
    const { id } = req.params;
    try {
        const success = await crudService.delete(TABLE_NAME, id);
        if (success) {
            res.status(200).json({
                message: `${TABLE_NAME} with ID ${id} deleted successfully.`,
            });
        } else {
            res.status(404).json({
                message: `${TABLE_NAME} with ID ${id} not found.`,
            });
        }
    } catch (error) {
        console.error(`Error deleting ${TABLE_NAME} by ID:`, error);
        res.status(500).json({
            message: `Error deleting ${TABLE_NAME} by ID.`,
        });
    }
});

export default router;
