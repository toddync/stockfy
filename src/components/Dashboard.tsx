import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import ResumoFinanceiro from './ResumoFinanceiro';
import RankingProdutos from './RankingProdutos';
import HeatmapVendasGrupos from './HeatmapVendasGrupos';
import SistemaAlertas from './SistemaAlertas';
import GraficoTendencias from './GraficoTendencias';
import PerformanceVendedores from './PerformanceVendedores';
import IndicadoresGiro from './IndicadoresGiro';
import QuickActions from './QuickActions';

const Dashboard: React.FC = () => {
  const [showAdvanced, setShowAdvanced] = useState(false);

  // Simplified list of modules for the target user
  const modules = [
    { name: 'Clientes', path: '/clientes', icon: '👥', color: 'blue' },
    { name: 'Vendedores', path: '/vendedores', icon: '👨‍💼', color: 'green' },
    { name: 'Produtos', path: '/produtos', icon: '📦', color: 'purple' },
    { name: 'Fornecedores', path: '/fornecedores', icon: '🏢', color: 'orange' },
    { name: 'Pedidos', path: '/pedidos', icon: '📋', color: 'red' },
    { name: 'Compras', path: '/compras', icon: '🛒', color: 'teal' },
    { name: 'Devoluções', path: '/devolucoes', icon: '↩️', color: 'yellow' },
    { name: 'Contas', path: '/contas-financeiras', icon: '💰', color: 'indigo' },
  ];

  return (
    <div className="p-5 bg-gray-100 min-h-screen">
      <h1 className="text-4xl font-bold text-center text-gray-800 mb-10">Painel Principal</h1>
      
      {/* Always visible components */}
      <div className="mb-10 max-w-7xl mx-auto">
        <QuickActions />
      </div>
      <div className="mb-10 max-w-7xl mx-auto">
        <SistemaAlertas />
      </div>

      {/* Toggle button for advanced analytics */}
      <div className="text-center mb-10">
        <button
          onClick={() => setShowAdvanced(!showAdvanced)}
          className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-6 rounded-lg transition-colors"
        >
          {showAdvanced ? 'Ocultar Análises Avançadas' : 'Mostrar Análises Avançadas'}
        </button>
      </div>

      {/* Conditionally rendered advanced components */}
      {showAdvanced && (
        <div className="space-y-10 max-w-7xl mx-auto mb-10">
          <ResumoFinanceiro />
          <RankingProdutos />
          <HeatmapVendasGrupos />
          <GraficoTendencias />
          <PerformanceVendedores />
          <IndicadoresGiro />
        </div>
      )}

      {/* Main navigation modules */}
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 max-w-7xl mx-auto">
        {modules.map(module => (
          <Link key={module.path} to={module.path} className="block group">
            <div className={`bg-white border-t-8 border-${module.color}-500 rounded-xl shadow-lg hover:shadow-2xl transition-all duration-300 p-6 flex flex-col items-center justify-center text-center h-48 transform hover:-translate-y-2`}>
              <div className={`text-6xl mb-3 text-gray-700 group-hover:text-${module.color}-600 transition-colors`}>{module.icon}</div>
              <h3 className="text-2xl font-semibold text-gray-800">{module.name}</h3>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;