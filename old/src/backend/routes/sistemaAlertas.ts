import { Router } from 'express';

const router = Router();

// GET all alerts
router.get('/', async (_req, res) => {
    try {
        // Mock data - in a real implementation, this would come from a database
        // or a more sophisticated analysis service.
        const mockAlerts = [
            {
              id: 1,
              tipo: 'estoque_baixo',
              mensagem: 'Produto "Camisa Social Branca P" com apenas 3 unidades restantes.',
              data: new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString(), // Yesterday
              resolvido: false,
            },
            {
              id: 2,
              tipo: 'produto_parado',
              mensagem: 'Produto "Calça Jeans Reta 42" não tem vendas há mais de 60 dias.',
              data: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000).toISOString(), // 3 days ago
              resolvido: false,
            },
            {
              id: 3,
              tipo: 'estoque_baixo',
              mensagem: 'Produto "Vestido Floral M" está com estoque zerado.',
              data: new Date().toISOString(), // Today
              resolvido: false,
            },
          ];
        res.status(200).json(mockAlerts);
    } catch (error) {
        console.error(`Error fetching alerts:`, error);
        res.status(500).json({ message: `Error fetching alerts.` });
    }
});

export default router;
