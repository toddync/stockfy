import React from 'react';

// Import all your new consolidated CRUD page components
import Clientes from './Clientes';
import Vendedores from './Vendedores';
import ProdutoGrupos from './ProdutoGrupos';
import Produtos from './Produtos';
import Fornecedores from './Fornecedores';
import Pedidos from './Pedidos';
// import PedidoItens from './PedidoItens'; // Removed as it's integrated into DetalhesPedido
import Compras from './Compras';
import CompraItens from './CompraItens';
import MovimentacoesEstoque from './MovimentacoesEstoque';
import MovimentacaoItens from './MovimentacaoItens';
import Rotas from './Rotas';
import Solicitacoes from './Solicitacoes';
import ContasFinanceiras from './ContasFinanceiras';
import Residuos from './Residuos';
import Etiquetas from './Etiquetas';
import Usuarios from './Usuarios';
import Permissoes from './Permissoes';
import UsuarioPermissoes from './UsuarioPermissoes';
import DetalhesPedido from './DetalhesPedido'; // Add DetalhesPedido
import NovoPedido from './NovoPedido'; // Add NovoPedido

// Keep LoginPage explicitly if it's the initial entry
import LoginPage from './LoginPage';

interface PageConfig {
    path: string;
    component: React.ComponentType;
    name: string;
}

const pageConfigs: PageConfig[] = [
    { path: '/login', component: LoginPage, name: 'Login' },
    { path: '/clientes', component: Clientes, name: 'Clientes' },
    { path: '/vendedores', component: Vendedores, name: 'Vendedores' },
    { path: '/produto-grupos', component: ProdutoGrupos, name: 'Grupos de Produtos' },
    { path: '/produtos', component: Produtos, name: 'Produtos' },
    { path: '/fornecedores', component: Fornecedores, name: 'Fornecedores' },
    { path: '/pedidos', component: Pedidos, name: 'Pedidos' },
    // { path: '/pedido-itens', component: PedidoItens, name: 'Itens do Pedido' }, // Removed
    { path: '/compras', component: Compras, name: 'Compras' },
    { path: '/compra-itens', component: CompraItens, name: 'Itens da Compra' },
    { path: '/movimentacoes-estoque', component: MovimentacoesEstoque, name: 'Movimentações de Estoque' },
    { path: '/movimentacao-itens', component: MovimentacaoItens, name: 'Itens de Movimentação' },
    { path: '/rotas', component: Rotas, name: 'Rotas' },
    { path: '/solicitacoes', component: Solicitacoes, name: 'Solicitações' },
    { path: '/contas-financeiras', component: ContasFinanceiras, name: 'Contas Financeiras' },
    { path: '/residuos', component: Residuos, name: 'Resíduos' },
    { path: '/etiquetas', component: Etiquetas, name: 'Etiquetas' },
    { path: '/usuarios', component: Usuarios, name: 'Usuários' },
    { path: '/permissoes', component: Permissoes, name: 'Permissões' },
    { path: '/usuario-permissoes', component: UsuarioPermissoes, name: 'Permissões de Usuário' },
    { path: '/pedidos/novo', component: NovoPedido, name: 'Novo Pedido' },
    { path: '/pedidos/:id', component: DetalhesPedido, name: 'Detalhes do Pedido' }, // Add DetalhesPedido
];

export default pageConfigs;
