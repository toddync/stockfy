import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

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
  const [success, setSuccess] = useState<string | null>(null); // Add success state

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    // Do not reset success here so message can persist after reload
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
    setSuccess(null); // Reset success message
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
      setSuccess(`Solicitação ${solicitacao.id ? 'atualizada' : 'criada'} com sucesso!`); // Set success message
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
    setSuccess(null); // Reset success message
    try {
      const response = await fetch(`http://localhost:3000/api/solicitacoes/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after delete
      setSuccess("Solicitação excluída com sucesso!"); // Set success message
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

  // Error display from the initial load should still show.
  // The Alerta component will handle subsequent errors from save/delete.

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {/* Display Alerta for success and error messages */}
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

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

const SolicitacaoForm: React.FC<{
  solicitacao: Solicitacao | null;
  vendedores: Vendedor[];
  clientes: Cliente[];
  onSave: (solicitacao: Solicitacao) => void;
  onCancel: () => void;
}> = ({ solicitacao, vendedores, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Solicitacao>(
    solicitacao || {
      numero: '',
      vendedor_id: 0,
      cliente_id: 0,
      data_solicitacao: new Date().toISOString().split('T')[0],
      situacao: 'Pendente',
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            {solicitacao ? 'Editar' : 'Nova'} Solicitação
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {solicitacao ? 'atualizar a' : 'criar uma nova'} solicitação.
        </p>

      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Informações da Solicitação
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input
                    type="text"
                    placeholder="Número da Solicitação"
                    value={formData.numero}
                    onChange={e => setFormData({ ...formData, numero: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="date"
                    value={formData.data_solicitacao}
                    onChange={e => setFormData({ ...formData, data_solicitacao: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>

        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Cliente e Vendedor
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <select
                    id="vendedor_id"
                    value={formData.vendedor_id}
                    onChange={e => setFormData({ ...formData, vendedor_id: parseInt(e.target.value) })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                    <option value="">Selecione um Vendedor</option>
                    {vendedores.map(vendedor => (
                        <option key={vendedor.id} value={vendedor.id}>
                        {vendedor.nome}
                        </option>
                    ))}
                </select>
                <select
                    id="cliente_id"
                    value={formData.cliente_id}
                    onChange={e => setFormData({ ...formData, cliente_id: parseInt(e.target.value) })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                    <option value="">Selecione um Cliente</option>
                    {clientes.map(cliente => (
                        <option key={cliente.id} value={cliente.id}>
                        {cliente.nome}
                        </option>
                    ))}
                </select>
            </div>
        </div>

        <div>
            <label htmlFor="situacao" className="block text-xl font-semibold text-gray-700 mb-2">
                3. Situação
            </label>
            <input
                type="text"
                id="situacao"
                placeholder="Situação"
                value={formData.situacao || ''}
                onChange={e => setFormData({ ...formData, situacao: e.target.value })}
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
        </div>

        <div className="form-actions flex justify-center gap-6 pt-4">
            <button
                type="button"
                onClick={onCancel}
                className="w-1/3 bg-gray-500 hover:bg-gray-600 text-white font-bold text-xl py-4 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300"
            >
                Cancelar
            </button>
            <button
                type="submit"
                className="w-1/3 bg-green-600 hover:bg-green-700 text-white font-bold text-xl py-4 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300"
            >
                Salvar
            </button>
        </div>
      </form>
    </div>
  );
};

export default Solicitacoes;