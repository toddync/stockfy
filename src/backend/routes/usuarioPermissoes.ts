import { Router } from 'express';
import CrudService from '../crudService.js';

const router = Router();
const crudService = new CrudService();
const TABLE_NAME = 'usuario_permissoes';

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

// POST new
router.post('/', async (req, res) => {
    const newData = req.body;
    try {
        // This table has a composite key, so insertId might not be relevant.
        await crudService.create(TABLE_NAME, newData);
        res.status(201).json({ message: `${TABLE_NAME} created successfully.` });
    } catch (error) {
        console.error(`Error creating ${TABLE_NAME}:`, error);
        res.status(500).json({ message: `Error creating ${TABLE_NAME}.` });
    }
});

// DELETE
// TODO: This requires a custom implementation because of the composite primary key.
// The generic CrudService.delete expects a single 'id' column.
router.delete('/', async (req, res) => {
    const { usuario_id, permissao_id } = req.body;
    if (!usuario_id || !permissao_id) {
        return res.status(400).json({ message: 'Both usuario_id and permissao_id are required.' });
    }
    
    // This will fail if not implemented correctly in a custom service or here.
    res.status(501).json({ message: 'Delete for composite key not implemented yet.' });
});

export default router;
