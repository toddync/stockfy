import { Router } from 'express';
import CrudService from '../crudService.js';

const router = Router();
const crudService = new CrudService();
const TABLE_NAME = 'compra_itens';

// GET all
router.get('/', async (_req, res) => {
    try {
        const data = await crudService.getAll(TABLE_NAME);
        res.status(200).json(data);
    } catch (error) {
        console.error(`Error fetching all from ${TABLE_NAME}:`, error);
        res.status(500).json({ message: `Error fetching data from ${TABLE_NAME}.` });
    }
});

// GET by ID
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const data = await crudService.getById(TABLE_NAME, id);
        if (data) {
            res.status(200).json(data);
        } else {
            res.status(404).json({ message: `${TABLE_NAME} with ID ${id} not found.` });
        }
    } catch (error) {
        console.error(`Error fetching ${TABLE_NAME} by ID:`, error);
        res.status(500).json({ message: `Error fetching ${TABLE_NAME} by ID.` });
    }
});

// POST new
router.post('/', async (req, res) => {
    const newData = req.body;
    try {
        const insertId = await crudService.create(TABLE_NAME, newData);
        res.status(201).json({ message: `${TABLE_NAME} created successfully.`, id: insertId });
    } catch (error) {
        console.error(`Error creating ${TABLE_NAME}:`, error);
        res.status(500).json({ message: `Error creating ${TABLE_NAME}.` });
    }
});

// PUT update
router.put('/:id', async (req, res) => {
    const { id } = req.params;
    const updatedData = req.body;
    try {
        const success = await crudService.update(TABLE_NAME, id, updatedData);
        if (success) {
            res.status(200).json({ message: `${TABLE_NAME} with ID ${id} updated successfully.` });
        } else {
            res.status(404).json({ message: `${TABLE_NAME} with ID ${id} not found or no changes made.` });
        }
    } catch (error) {
        console.error(`Error updating ${TABLE_NAME} by ID:`, error);
        res.status(500).json({ message: `Error updating ${TABLE_NAME} by ID.` });
    }
});

// DELETE
router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const success = await crudService.delete(TABLE_NAME, id);
        if (success) {
            res.status(200).json({ message: `${TABLE_NAME} with ID ${id} deleted successfully.` });
        } else {
            res.status(404).json({ message: `${TABLE_NAME} with ID ${id} not found.` });
        }
    } catch (error) {
        console.error(`Error deleting ${TABLE_NAME} by ID:`, error);
        res.status(500).json({ message: `Error deleting ${TABLE_NAME} by ID.` });
    }
});

export default router;
