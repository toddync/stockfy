import React, { useState } from 'react';
import Modal from '../components/Modal';
import KanbanPedidos from '../components/KanbanPedidos';
import CalculadoraComissoes from '../components/CalculadoraComissoes';
import AnaliseTicketMedio from '../components/AnaliseTicketMedio';
import SugestorCrossSelling from '../components/SugestorCrossSelling';
import TimelinePedido from '../components/TimelinePedido';
import SimuladorDescontos from '../components/SimuladorDescontos';
import NovoPedido from './NovoPedido';

const Pedidos: React.FC = () => {
  const [showKanban, setShowKanban] = useState(false);
  const [showCommissionCalculator, setShowCommissionCalculator] = useState(false);
  const [showTicketMedioAnalysis, setShowTicketMedioAnalysis] = useState(false);
  const [showCrossSellingSuggester, setShowCrossSellingSuggester] = useState(false);
  const [showTimeline, setShowTimeline] = useState(false);
  const [showDiscountSimulator, setShowDiscountSimulator] = useState(false);
  const [showNovoPedido, setShowNovoPedido] = useState(false);
  const [selectedPedidoIdForTimeline, setSelectedPedidoIdForTimeline] = useState<number | null>(null);

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Pedidos</h1>
        <div className="flex space-x-4">
          <button
            onClick={() => setShowNovoPedido(true)}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            Novo Pedido
          </button>
          <button 
            onClick={() => { setShowCommissionCalculator(false); setShowTicketMedioAnalysis(false); setShowCrossSellingSuggester(false); setShowTimeline(false); setShowDiscountSimulator(false); setShowKanban(!showKanban); }}
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showKanban ? 'Voltar para Pedidos' : 'Kanban de Pedidos'}
          </button>
          <button 
            onClick={() => { setShowKanban(false); setShowTicketMedioAnalysis(false); setShowCrossSellingSuggester(false); setShowTimeline(false); setShowDiscountSimulator(false); setShowCommissionCalculator(!showCommissionCalculator); }}
            className="bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showCommissionCalculator ? 'Voltar para Pedidos' : 'Calculadora de Comissões'}
          </button>
          <button 
            onClick={() => { setShowKanban(false); setShowCommissionCalculator(false); setShowCrossSellingSuggester(false); setShowTimeline(false); setShowDiscountSimulator(false); setShowTicketMedioAnalysis(!showTicketMedioAnalysis); }}
            className="bg-purple-500 hover:bg-purple-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showTicketMedioAnalysis ? 'Voltar para Pedidos' : 'Análise Ticket Médio'}
          </button>
          <button 
            onClick={() => { setShowKanban(false); setShowCommissionCalculator(false); setShowTicketMedioAnalysis(false); setShowTimeline(false); setShowDiscountSimulator(false); setShowCrossSellingSuggester(!showCrossSellingSuggester); }}
            className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showCrossSellingSuggester ? 'Voltar para Pedidos' : 'Sugestão Cross-selling'}
          </button>
          <button 
            onClick={() => { setShowKanban(false); setShowCommissionCalculator(false); setShowTicketMedioAnalysis(false); setShowCrossSellingSuggester(false); setShowDiscountSimulator(false); setShowTimeline(!showTimeline); }}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showTimeline ? 'Voltar para Pedidos' : 'Timeline do Pedido'}
          </button>
          <button 
            onClick={() => { setShowKanban(false); setShowCommissionCalculator(false); setShowTicketMedioAnalysis(false); setShowCrossSellingSuggester(false); setShowTimeline(false); setShowDiscountSimulator(!showDiscountSimulator); }}
            className="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showDiscountSimulator ? 'Voltar para Pedidos' : 'Simulador de Descontos'}
          </button>
          {/* Add other buttons here later */}
        </div>
      </div>

      <Modal isOpen={showNovoPedido} onClose={() => setShowNovoPedido(false)}>
        <NovoPedido />
      </Modal>

      {showKanban ? (
        <KanbanPedidos />
      ) : showCommissionCalculator ? (
        <CalculadoraComissoes />
      ) : showTicketMedioAnalysis ? (
        <AnaliseTicketMedio />
      ) : showCrossSellingSuggester ? (
        <SugestorCrossSelling />
      ) : showTimeline ? (
        <div>
          <div className="mb-4">
            <label htmlFor="pedidoIdInput" className="block text-gray-700 text-sm font-bold mb-2">ID do Pedido para Timeline:</label>
            <input
              type="number"
              id="pedidoIdInput"
              placeholder="Digite o ID do Pedido"
              value={selectedPedidoIdForTimeline || ''}
              onChange={e => setSelectedPedidoIdForTimeline(parseInt(e.target.value) || null)}
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
          {selectedPedidoIdForTimeline && <TimelinePedido pedidoId={selectedPedidoIdForTimeline} />}
        </div>
      ) : showDiscountSimulator ? (
        <SimuladorDescontos />
      ) : (
        <div className="text-center p-6 text-gray-600">
          Selecione uma funcionalidade ou visualize a lista de pedidos.
          {/* Placeholder for main pedidos list */}
        </div>
      )}
    </div>
  );
};

export default Pedidos;
