import { Router } from 'express';
import CrudService from '../crudService.js';

const router = Router();
const crudService = new CrudService();

router.get('/', async (_req, res) => {
    try {
        const data = await crudService.getAll('tags');
        res.status(200).json(data);
    } catch (error) {
        console.error('Error fetching tags:', error);
        res.status(500).json({ message: 'Error fetching tags.' });
    }
});

router.post('/', async (req, res) => {
    const { nome } = req.body;
    if (!nome) {
        return res.status(400).json({ message: 'Tag name is required.' });
    }
    try {
        const insertId = await crudService.create('tags', { nome });
        res.status(201).json({ id: insertId, nome });
    } catch (error) {
        console.error('Error creating tag:', error);
        res.status(500).json({ message: 'Error creating tag.' });
    }
});

export default router;
