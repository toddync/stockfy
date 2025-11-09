import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface Solicitacao {
  id?: number; // ID is optional for new entries
  numero: string;
  vendedor_id: number;
  cliente_id: number;
  data_solicitacao: string; // DATE type
  situacao?: string;
}

interface Vendedor {
  id: number;
  nome: string;
}

interface Cliente {
  id: number;
  nome: string;
}

const Solicitacoes: React.FC = () => {
  const [solicitacoes, setSolicitacoes] = useState<Solicitacao[]>([]);
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [solicitacaoEditando, setSolicitacaoEditando] = useState<Solicitacao | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [solicitacoesResponse, vendedoresResponse, clientesResponse] = await Promise.all([
        fetch('http://localhost:3000/api/solicitacoes'),
        fetch('http://localhost:3000/api/vendedores'),
        fetch('http://localhost:3000/api/clientes')
      ]);

      if (!solicitacoesResponse.ok) {
        throw new Error(`HTTP error! status: ${solicitacoesResponse.status} for solicitacoes`);
      }
      if (!vendedoresResponse.ok) {
        throw new Error(`HTTP error! status: ${vendedoresResponse.status} for vendedores`);
      }
      if (!clientesResponse.ok) {
        throw new Error(`HTTP error! status: ${clientesResponse.status} for clientes`);
      }

      const solicitacoesData: Solicitacao[] = await solicitacoesResponse.json();
      const vendedoresData: Vendedor[] = await vendedoresResponse.json();
      const clientesData: Cliente[] = await clientesResponse.json();

      setSolicitacoes(solicitacoesData);
      setVendedores(vendedoresData);
      setClientes(clientesData);
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

  const salvarSolicitacao = async (solicitacao: Solicitacao) => {
    setError(null);
    try {
      let response;
      if (solicitacao.id) {
        // Update existing solicitacao
        response = await fetch(`http://localhost:3000/api/solicitacoes/${solicitacao.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(solicitacao),
        });
      } else {
        // Create new solicitacao
        response = await fetch('http://localhost:3000/api/solicitacoes', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(solicitacao),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setSolicitacaoEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar solicitação: ${message}`);
      console.error("Erro ao salvar solicitação:", e);
    }
  };

  const deletarSolicitacao = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/solicitacoes/${id}`, {
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
      setError(`Falha ao deletar solicitação: ${message}`);
      console.error("Erro ao deletar solicitação:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando solicitações...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Solicitações</h1>
        <button 
          onClick={() => { setSolicitacaoEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Solicitação
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setSolicitacaoEditando(null); }}>
        <SolicitacaoForm
          solicitacao={solicitacaoEditando}
          vendedores={vendedores}
          clientes={clientes}
          onSave={salvarSolicitacao}
          onCancel={() => { setMostrarForm(false); setSolicitacaoEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Número</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Vendedor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cliente</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Data</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Situação</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {solicitacoes.map(solicitacao => (
              <tr key={solicitacao.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{solicitacao.numero}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedores.find(v => v.id === solicitacao.vendedor_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{clientes.find(c => c.id === solicitacao.cliente_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(solicitacao.data_solicitacao).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{solicitacao.situacao}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setSolicitacaoEditando(solicitacao); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarSolicitacao(solicitacao.id!)}
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
const SolicitacaoForm: React.FC<{ 
  solicitacao: Solicitacao | null; 
  vendedores: Vendedor[];
  clientes: Cliente[];
  onSave: (solicitacao: Solicitacao) => void; 
  onCancel: () => void 
}> = ({ solicitacao, vendedores, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Solicitacao>(solicitacao || {
    numero: '', vendedor_id: 0, cliente_id: 0, data_solicitacao: new Date().toISOString().split('T')[0], situacao: 'Pendente'
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{solicitacao ? 'Editar' : 'Nova'} Solicitação</h2>
      
      <div className="mb-4">
        <label htmlFor="numero" className="block text-gray-700 text-sm font-bold mb-2">Número:</label>
        <input
          type="text"
          id="numero"
          placeholder="Número da Solicitação"
          value={formData.numero}
          onChange={e => setFormData({...formData, numero: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="vendedor_id" className="block text-gray-700 text-sm font-bold mb-2">Vendedor:</label>
        <select
          id="vendedor_id"
          value={formData.vendedor_id}
          onChange={e => setFormData({...formData, vendedor_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Vendedor</option>
          {vendedores.map(vendedor => (
            <option key={vendedor.id} value={vendedor.id}>{vendedor.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="cliente_id" className="block text-gray-700 text-sm font-bold mb-2">Cliente:</label>
        <select
          id="cliente_id"
          value={formData.cliente_id}
          onChange={e => setFormData({...formData, cliente_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Cliente</option>
          {clientes.map(cliente => (
            <option key={cliente.id} value={cliente.id}>{cliente.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="data_solicitacao" className="block text-gray-700 text-sm font-bold mb-2">Data da Solicitação:</label>
        <input
          type="date"
          id="data_solicitacao"
          value={formData.data_solicitacao}
          onChange={e => setFormData({...formData, data_solicitacao: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="situacao" className="block text-gray-700 text-sm font-bold mb-2">Situação:</label>
        <input
          type="text"
          id="situacao"
          placeholder="Situação"
          value={formData.situacao || ''}
          onChange={e => setFormData({...formData, situacao: e.target.value})}
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

export default Solicitacoes;