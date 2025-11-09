import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface MovimentacaoEstoque {
  id?: number; // ID is optional for new entries
  tipo_movimentacao: 'devolucao' | 'defeito' | 'ajuste';
  numero_documento: string;
  data_documento: string; // DATE type
  data_base?: string; // DATE type
  cliente_id?: number;
  vendedor_id?: number;
  valor_total?: number;
  romaneio?: string;
}

interface Cliente {
  id: number;
  nome: string;
}

interface Vendedor {
  id: number;
  nome: string;
}

const MovimentacoesEstoque: React.FC = () => {
  const [movimentacoes, setMovimentacoes] = useState<MovimentacaoEstoque[]>([]);
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [movimentacaoEditando, setMovimentacaoEditando] = useState<MovimentacaoEstoque | null>(null);
  const [tipoFiltro, setTipoFiltro] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [movimentacoesResponse, clientesResponse, vendedoresResponse] = await Promise.all([
        fetch('http://localhost:3000/api/movimentacoes_estoque'),
        fetch('http://localhost:3000/api/clientes'),
        fetch('http://localhost:3000/api/vendedores')
      ]);

      if (!movimentacoesResponse.ok) {
        throw new Error(`HTTP error! status: ${movimentacoesResponse.status} for movimentacoes_estoque`);
      }
      if (!clientesResponse.ok) {
        throw new Error(`HTTP error! status: ${clientesResponse.status} for clientes`);
      }
      if (!vendedoresResponse.ok) {
        throw new Error(`HTTP error! status: ${vendedoresResponse.status} for vendedores`);
      }

      const movimentacoesData: MovimentacaoEstoque[] = await movimentacoesResponse.json();
      const clientesData: Cliente[] = await clientesResponse.json();
      const vendedoresData: Vendedor[] = await vendedoresResponse.json();

      setMovimentacoes(movimentacoesData);
      setClientes(clientesData);
      setVendedores(vendedoresData);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar dados: ${message}`);
      console.error("Erro ao carregar dados:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarMovimentacao = async (movimentacao: MovimentacaoEstoque) => {
    setError(null);
    try {
      let response;
      if (movimentacao.id) {
        // Update existing movimentacao
        response = await fetch(`http://localhost:3000/api/movimentacoes_estoque/${movimentacao.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(movimentacao),
        });
      } else {
        // Create new movimentacao
        response = await fetch('http://localhost:3000/api/movimentacoes_estoque', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(movimentacao),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setMovimentacaoEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar movimentação: ${message}`);
      console.error("Erro ao salvar movimentação:", e);
    }
  };

  const deletarMovimentacao = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/movimentacoes_estoque/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after delete
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar movimentação: ${message}`);
      console.error("Erro ao deletar movimentação:", e);
    }
  };

  const movimentacoesFiltradas = tipoFiltro 
    ? movimentacoes.filter(m => m.tipo_movimentacao === tipoFiltro)
    : movimentacoes;

  if (loading) {
    return <div className="text-center p-6">Carregando movimentações de estoque...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Movimentações de Estoque</h1>
        <div className="header-actions flex items-center space-x-4">
          <select 
            value={tipoFiltro} 
            onChange={e => setTipoFiltro(e.target.value)}
            className="shadow appearance-none border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Todos os Tipos</option>
            <option value="devolucao">Devolução</option>
            <option value="defeito">Defeito</option>
            <option value="ajuste">Ajuste</option>
          </select>
          <button 
            onClick={() => { setMovimentacaoEditando(null); setMostrarForm(true); }}
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            + Nova Movimentação
          </button>
        </div>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setMovimentacaoEditando(null); }}>
        <MovimentacaoEstoqueForm
          movimentacao={movimentacaoEditando}
          clientes={clientes}
          vendedores={vendedores}
          onSave={salvarMovimentacao}
          onCancel={() => { setMostrarForm(false); setMovimentacaoEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Tipo</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nº Documento</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Data</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cliente</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Vendedor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Valor Total</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {movimentacoesFiltradas.map(mov => (
              <tr key={mov.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{mov.tipo_movimentacao}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{mov.numero_documento}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(mov.data_documento).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{clientes.find(c => c.id === mov.cliente_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedores.find(v => v.id === mov.vendedor_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{mov.valor_total?.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setMovimentacaoEditando(mov); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarMovimentacao(mov.id!)}
                    className="bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded-md transition-colors"
                  >
                    Excluir
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

// Componente de formulário reutilizável
const MovimentacaoEstoqueForm: React.FC<{ 
  movimentacao: MovimentacaoEstoque | null; 
  clientes: Cliente[];
  vendedores: Vendedor[];
  onSave: (movimentacao: MovimentacaoEstoque) => void; 
  onCancel: () => void 
}> = ({ movimentacao, clientes, vendedores, onSave, onCancel }) => {
  const [formData, setFormData] = useState<MovimentacaoEstoque>(movimentacao || {
    tipo_movimentacao: 'ajuste', numero_documento: '', data_documento: new Date().toISOString().split('T')[0], cliente_id: 0, vendedor_id: 0, valor_total: 0, romaneio: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{movimentacao ? 'Editar' : 'Nova'} Movimentação de Estoque</h2>
      
      <div className="mb-4">
        <label htmlFor="tipo_movimentacao" className="block text-gray-700 text-sm font-bold mb-2">Tipo de Movimentação:</label>
        <select
          id="tipo_movimentacao"
          value={formData.tipo_movimentacao}
          onChange={e => setFormData({...formData, tipo_movimentacao: e.target.value as 'devolucao' | 'defeito' | 'ajuste'})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="ajuste">Ajuste</option>
          <option value="devolucao">Devolução</option>
          <option value="defeito">Defeito</option>
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="numero_documento" className="block text-gray-700 text-sm font-bold mb-2">Número do Documento:</label>
        <input
          type="text"
          id="numero_documento"
          placeholder="Número do Documento"
          value={formData.numero_documento}
          onChange={e => setFormData({...formData, numero_documento: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="data_documento" className="block text-gray-700 text-sm font-bold mb-2">Data do Documento:</label>
        <input
          type="date"
          id="data_documento"
          value={formData.data_documento}
          onChange={e => setFormData({...formData, data_documento: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="data_base" className="block text-gray-700 text-sm font-bold mb-2">Data Base:</label>
        <input
          type="date"
          id="data_base"
          value={formData.data_base || ''}
          onChange={e => setFormData({...formData, data_base: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="cliente_id" className="block text-gray-700 text-sm font-bold mb-2">Cliente:</label>
        <select
          id="cliente_id"
          value={formData.cliente_id}
          onChange={e => setFormData({...formData, cliente_id: parseInt(e.target.value)})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="0">Nenhum</option>
          {clientes.map(cliente => (
            <option key={cliente.id} value={cliente.id}>{cliente.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="vendedor_id" className="block text-gray-700 text-sm font-bold mb-2">Vendedor:</label>
        <select
          id="vendedor_id"
          value={formData.vendedor_id}
          onChange={e => setFormData({...formData, vendedor_id: parseInt(e.target.value)})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="0">Nenhum</option>
          {vendedores.map(vendedor => (
            <option key={vendedor.id} value={vendedor.id}>{vendedor.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="valor_total" className="block text-gray-700 text-sm font-bold mb-2">Valor Total:</label>
        <input
          type="number"
          id="valor_total"
          placeholder="Valor Total"
          value={formData.valor_total}
          onChange={e => setFormData({...formData, valor_total: parseFloat(e.target.value)})}
          step="0.01"
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="romaneio" className="block text-gray-700 text-sm font-bold mb-2">Romaneio:</label>
        <input
          type="text"
          id="romaneio"
          placeholder="Romaneio"
          value={formData.romaneio || ''}
          onChange={e => setFormData({...formData, romaneio: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>
      
      <div className="form-actions flex justify-end gap-4">
        <button 
          type="submit"
          className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          Salvar
        </button>
        <button 
          type="button" 
          onClick={onCancel}
          className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          Cancelar
        </button>
      </div>
    </form>
  );
};

export default MovimentacoesEstoque;