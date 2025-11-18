import { Router } from 'express';
import CrudService from '../crudService.js';
import movimentacaoService from '../services/movimentacaoService.js';

const router = Router();
const crudService = new CrudService();
const TABLE_NAME = 'movimentacoes_estoque';



// New endpoint for simplified returns
router.post('/devolucoes', async (req, res) => {
    const { produto_id, quantidade, tipo_movimentacao, observacoes } = req.body;

    if (!produto_id || !quantidade || !tipo_movimentacao) {
        return res.status(400).json({ message: 'Missing required fields: produto_id, quantidade, tipo_movimentacao.' });
    }

    if (tipo_movimentacao !== 'devolucao' && tipo_movimentacao !== 'defeito') {
        return res.status(400).json({ message: 'Invalid tipo_movimentacao. Must be "devolucao" or "defeito".' });
    }

    try {
        const movimentacaoId = await movimentacaoService.registrarDevolucao({
            produto_id,
            quantidade,
            tipo_movimentacao,
            observacoes
        });
        res.status(201).json({ message: 'Devolução registrada com sucesso!', movimentacaoId });
    } catch (error) {
        console.error('Error registering devolução:', error);
        res.status(500).json({ message: 'Falha ao registrar a devolução no servidor.' });
    }
});

// New endpoint for stock adjustments
router.post('/ajuste', async (req, res) => {
    const { produto_id, quantidade, tipo_ajuste, observacoes } = req.body;

    if (!produto_id || !quantidade || !tipo_ajuste) {
        return res.status(400).json({ message: 'Missing required fields: produto_id, quantidade, tipo_ajuste.' });
    }

    try {
        const movimentacaoId = await movimentacaoService.registrarAjuste({
            produto_id,
            quantidade,
            tipo_ajuste,
            observacoes
        });
        res.status(201).json({ message: 'Ajuste de estoque registrado com sucesso!', movimentacaoId });
    } catch (error) {
        console.error('Error registering ajuste de estoque:', error);
        res.status(500).json({ message: 'Falha ao registrar ajuste de estoque no servidor.' });
    }
});


// Get all movements
router.get('/', async (req, res) => {
    try {
        const page = parseInt(req.query.page as string) || 1;
        const limit = parseInt(req.query.limit as string) || 1000;
        const sortField = (req.query.sortField as string) || 'data_documento'; // Default sort by date
        const sortOrder = (req.query.sortOrder as string) === 'asc' ? 'asc' : 'desc'; // Default desc

        if (req.query.limit || req.query.page) {
            const result = await crudService.getPaginated(TABLE_NAME, page, limit, sortField, sortOrder);
            res.json(result);
        } else {
            const movimentacoes = await crudService.getAll(TABLE_NAME);
            res.json(movimentacoes);
        }
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch stock movements' });
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
