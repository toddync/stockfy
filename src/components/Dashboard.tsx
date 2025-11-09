import React from 'react';
import { Link } from 'react-router-dom';
import ResumoFinanceiro from './ResumoFinanceiro';
import RankingProdutos from './RankingProdutos';
import HeatmapVendasGrupos from './HeatmapVendasGrupos'; // New import
import SistemaAlertas from './SistemaAlertas'; // New import
import GraficoTendencias from './GraficoTendencias'; // New import
import PerformanceVendedores from './PerformanceVendedores'; // New import
import IndicadoresGiro from './IndicadoresGiro'; // New import
import QuickActions from './QuickActions'; // New import

const Dashboard: React.FC = () => {
  const modules = [
    { name: 'Clientes', path: '/clientes', icon: '👥', color: 'blue' },
    { name: 'Vendedores', path: '/vendedores', icon: '👨‍💼', color: 'green' },
    { name: 'Produtos', path: '/produtos', icon: '📦', color: 'purple' },
    { name: 'Fornecedores', path: '/fornecedores', icon: '🏢', color: 'orange' },
    { name: 'Pedidos', path: '/pedidos', icon: '📋', color: 'red' },
    { name: 'Compras', path: '/compras', icon: '🛒', color: 'teal' },
    { name: 'Movimentações Estoque', path: '/movimentacoes-estoque', icon: '📊', color: 'indigo' },
    { name: 'Contas Financeiras', path: '/contas-financeiras', icon: '💰', color: 'yellow' },
    { name: 'Rotas', path: '/rotas', icon: '🗺️', color: 'pink' },
    { name: 'Solicitações', path: '/solicitacoes', icon: '📝', color: 'cyan' },
    { name: 'Resíduos', path: '/residuos', icon: '🗑️', color: 'brown' },
    { name: 'Etiquetas', path: '/etiquetas', icon: '🏷️', color: 'lime' },
    { name: 'Usuários', path: '/usuarios', icon: '👤', color: 'gray' },
    { name: 'Permissões', path: '/permissoes', icon: '🔑', color: 'amber' },
    { name: 'Usuário Permissões', path: '/usuario-permissoes', icon: '🔗', color: 'deep-purple' },
  ];

  return (
    <div className="p-5 bg-gray-100 min-h-screen">
      <h1 className="text-4xl font-bold text-center text-gray-800 mb-10">Dashboard Principal</h1>
      
      <div className="mb-10 max-w-6xl mx-auto">
        <ResumoFinanceiro />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <RankingProdutos />
      </div>

      {/* New Dashboard Components */}
      <div className="mb-10 max-w-6xl mx-auto">
        <HeatmapVendasGrupos />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <SistemaAlertas />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <GraficoTendencias />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <PerformanceVendedores />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <IndicadoresGiro />
      </div>

      <div className="mb-10 max-w-6xl mx-auto">
        <QuickActions />
      </div>
      {/* End New Dashboard Components */}

      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
        {modules.map(module => (
          <Link key={module.path} to={module.path} className="block">
            <div className={`bg-white border-t-4 border-${module.color}-500 rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 p-6 flex flex-col items-center justify-center text-center h-40`}>
              <div className={`text-5xl mb-3 text-${module.color}-600`}>{module.icon}</div>
              <h3 className="text-xl font-semibold text-gray-700">{module.name}</h3>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;