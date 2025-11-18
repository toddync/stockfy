import { Router } from 'express';
import produtosRouter from './produtos.js';
import tagsRouter from './tags.js';
import clientesRouter from './clientes.js';
import vendedoresRouter from './vendedores.js';
import produtoGruposRouter from './produtoGrupos.js';
import fornecedoresRouter from './fornecedores.js';
import pedidosRouter from './pedidos.js';
import movimentacoesEstoqueRouter from './movimentacoesEstoque.js';
import comprasRouter from './compras.js';
import compraItensRouter from './compraItens.js';
import movimentacaoItensRouter from './movimentacaoItens.js';
import rotasRouter from './rotas.js';
import solicitacoesRouter from './solicitacoes.js';
import contasFinanceirasRouter from './contasFinanceiras.js';
import residuosRouter from './residuos.js';
import etiquetasRouter from './etiquetas.js';
import usuariosRouter from './usuarios.js';
import permissoesRouter from './permissoes.js';
import usuarioPermissoesRouter from './usuarioPermissoes.js';


const router = Router();

router.use('/produtos', produtosRouter);
router.use('/tags', tagsRouter);
router.use('/clientes', clientesRouter);
router.use('/vendedores', vendedoresRouter);
router.use('/produto-grupos', produtoGruposRouter);
router.use('/fornecedores', fornecedoresRouter);
router.use('/pedidos', pedidosRouter);
router.use('/movimentacoes-estoque', movimentacoesEstoqueRouter);
router.use('/compras', comprasRouter);
router.use('/compra-itens', compraItensRouter);
router.use('/movimentacao-itens', movimentacaoItensRouter);
router.use('/rotas', rotasRouter);
router.use('/solicitacoes', solicitacoesRouter);
router.use('/contas-financeiras', contasFinanceirasRouter);
router.use('/residuos', residuosRouter);
router.use('/etiquetas', etiquetasRouter);
router.use('/usuarios', usuariosRouter);
router.use('/permissoes', permissoesRouter);
router.use('/usuario-permissoes', usuarioPermissoesRouter);


export default router;
