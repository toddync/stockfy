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
import ActivityFeed from './ActivityFeed';
import { useSeniorMode } from '../contexts/SeniorModeContext';

const Dashboard: React.FC = () => {
  const [showAdvanced, setShowAdvanced] = useState(false);
  const { isSeniorMode, toggleSeniorMode } = useSeniorMode();

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
    <div className={`p-5 bg-gray-100 min-h-screen ${isSeniorMode ? 'p-8' : 'p-5'}`}>
      <div className="flex justify-between items-center mb-10">
        <h1 className={`font-bold text-gray-800 ${isSeniorMode ? 'text-5xl' : 'text-4xl'}`}>
          Painel Principal
        </h1>
        <button
          onClick={toggleSeniorMode}
          className={`font-bold rounded-full transition-all shadow-lg flex items-center ${isSeniorMode
              ? 'bg-blue-600 text-white py-4 px-8 text-xl hover:bg-blue-700'
              : 'bg-white text-gray-700 py-2 px-4 border hover:bg-gray-50'
            }`}
        >
          {isSeniorMode ? '♿ Modo Senior Ativo (Clique para desativar)' : 'Ativar Modo Senior'}
        </button>
      </div>

      {/* Activity Feed - Always visible but prominent in Senior Mode */}
      <div className="mb-10 max-w-7xl mx-auto">
        <ActivityFeed />
      </div>

      {/* Always visible components */}
      <div className="mb-10 max-w-7xl mx-auto">
        <QuickActions />
      </div>

      {!isSeniorMode && (
        <div className="mb-10 max-w-7xl mx-auto">
          <SistemaAlertas />
        </div>
      )}

      {/* Toggle button for advanced analytics - Hidden in Senior Mode */}
      {!isSeniorMode && (
        <div className="text-center mb-10">
          <button
            onClick={() => setShowAdvanced(!showAdvanced)}
            className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-6 rounded-lg transition-colors"
          >
            {showAdvanced ? 'Ocultar Análises Avançadas' : 'Mostrar Análises Avançadas'}
          </button>
        </div>
      )}

      {/* Conditionally rendered advanced components */}
      {showAdvanced && !isSeniorMode && (
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
      <div className={`grid gap-6 max-w-7xl mx-auto ${isSeniorMode ? 'grid-cols-1 sm:grid-cols-2' : 'grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4'}`}>
        {modules.map(module => (
          <Link key={module.path} to={module.path} className="block group">
            <div className={`bg-white border-t-8 border-${module.color}-500 rounded-xl shadow-lg hover:shadow-2xl transition-all duration-300 flex flex-col items-center justify-center text-center transform hover:-translate-y-2 ${isSeniorMode ? 'p-10 h-64' : 'p-6 h-48'}`}>
              <div className={`mb-3 text-gray-700 group-hover:text-${module.color}-600 transition-colors ${isSeniorMode ? 'text-8xl' : 'text-6xl'}`}>{module.icon}</div>
              <h3 className={`font-semibold text-gray-800 ${isSeniorMode ? 'text-4xl' : 'text-2xl'}`}>{module.name}</h3>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;