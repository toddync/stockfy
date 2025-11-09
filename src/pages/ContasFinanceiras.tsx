import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface ContaFinanceira {
  id?: number; // ID is optional for new entries
  data_emissao: string; // DATE type
  tipo_documento: string;
  numero_documento: string;
  parcela?: string;
  historico?: string;
  observacoes?: string;
  valor: number;
  tipo_cobranca?: string;
  numero_cobranca?: string;
  origem_cobranca?: string;
  data_vencimento: string; // DATE type
  sinal?: string;
  sigla?: string;
  situacao?: string;
  data_pagamento?: string; // DATE type
  vendedor_id?: number;
  acrescimo?: number;
  comissao?: number;
  data_baixa?: string; // DATE type
  operacao?: string;
  cliente_id?: number;
}

interface Vendedor {
  id: number;
  nome: string;
}

interface Cliente {
  id: number;
  nome: string;
}

const ContasFinanceiras: React.FC = () => {
  const [contas, setContas] = useState<ContaFinanceira[]>([]);
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [contaEditando, setContaEditando] = useState<ContaFinanceira | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [contasResponse, vendedoresResponse, clientesResponse] = await Promise.all([
        fetch('http://localhost:3000/api/contas_financeiras'),
        fetch('http://localhost:3000/api/vendedores'),
        fetch('http://localhost:3000/api/clientes')
      ]);

      if (!contasResponse.ok) {
        throw new Error(`HTTP error! status: ${contasResponse.status} for contas_financeiras`);
      }
      if (!vendedoresResponse.ok) {
        throw new Error(`HTTP error! status: ${vendedoresResponse.status} for vendedores`);
      }
      if (!clientesResponse.ok) {
        throw new Error(`HTTP error! status: ${clientesResponse.status} for clientes`);
      }

      const contasData: ContaFinanceira[] = await contasResponse.json();
      const vendedoresData: Vendedor[] = await vendedoresResponse.json();
      const clientesData: Cliente[] = await clientesResponse.json();

      setContas(contasData);
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

  const salvarConta = async (conta: ContaFinanceira) => {
    setError(null);
    try {
      let response;
      if (conta.id) {
        // Update existing conta
        response = await fetch(`http://localhost:3000/api/contas_financeiras/${conta.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(conta),
        });
      } else {
        // Create new conta
        response = await fetch('http://localhost:3000/api/contas_financeiras', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(conta),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setContaEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar conta financeira: ${message}`);
      console.error("Erro ao salvar conta financeira:", e);
    }
  };

  const deletarConta = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/contas_financeiras/${id}`, {
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
      setError(`Falha ao deletar conta financeira: ${message}`);
      console.error("Erro ao deletar conta financeira:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando contas financeiras...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Contas Financeiras</h1>
        <button 
          onClick={() => { setContaEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Conta
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setContaEditando(null); }}>
        <ContaFinanceiraForm
          conta={contaEditando}
          vendedores={vendedores}
          clientes={clientes}
          onSave={salvarConta}
          onCancel={() => { setMostrarForm(false); setContaEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Emissão</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Tipo Doc.</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nº Doc.</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Valor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Vencimento</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Situação</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {contas.map(conta => (
              <tr key={conta.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(conta.data_emissao).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{conta.tipo_documento}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{conta.numero_documento}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{conta.valor.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(conta.data_vencimento).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm text-gray-700">
                  <span className={`px-2 py-1 rounded-full text-xs font-semibold ${
                    conta.situacao === 'Pago' ? 'bg-green-100 text-green-800' :
                    conta.situacao === 'Pendente' ? 'bg-yellow-100 text-yellow-800' :
                    'bg-gray-100 text-gray-800'
                  }`}>
                    {conta.situacao}
                  </span>
                </td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setContaEditando(conta); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarConta(conta.id!)}
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
const ContaFinanceiraForm: React.FC<{ 
  conta: ContaFinanceira | null; 
  vendedores: Vendedor[];
  clientes: Cliente[];
  onSave: (conta: ContaFinanceira) => void; 
  onCancel: () => void 
}> = ({ conta, vendedores, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<ContaFinanceira>(conta || {
    data_emissao: new Date().toISOString().split('T')[0], tipo_documento: '', numero_documento: '', valor: 0, data_vencimento: new Date().toISOString().split('T')[0], situacao: 'Pendente'
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{conta ? 'Editar' : 'Nova'} Conta Financeira</h2>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="mb-4">
          <label htmlFor="data_emissao" className="block text-gray-700 text-sm font-bold mb-2">Data de Emissão:</label>
          <input
            type="date"
            id="data_emissao"
            value={formData.data_emissao}
            onChange={e => setFormData({...formData, data_emissao: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="tipo_documento" className="block text-gray-700 text-sm font-bold mb-2">Tipo de Documento:</label>
          <input
            type="text"
            id="tipo_documento"
            placeholder="Tipo de Documento"
            value={formData.tipo_documento}
            onChange={e => setFormData({...formData, tipo_documento: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
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
          <label htmlFor="parcela" className="block text-gray-700 text-sm font-bold mb-2">Parcela:</label>
          <input
            type="text"
            id="parcela"
            placeholder="Parcela"
            value={formData.parcela || ''}
            onChange={e => setFormData({...formData, parcela: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="historico" className="block text-gray-700 text-sm font-bold mb-2">Histórico:</label>
          <input
            type="text"
            id="historico"
            placeholder="Histórico"
            value={formData.historico || ''}
            onChange={e => setFormData({...formData, historico: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="observacoes" className="block text-gray-700 text-sm font-bold mb-2">Observações:</label>
          <textarea
            id="observacoes"
            placeholder="Observações"
            value={formData.observacoes || ''}
            onChange={e => setFormData({...formData, observacoes: e.target.value})}
            rows={3}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="valor" className="block text-gray-700 text-sm font-bold mb-2">Valor:</label>
          <input
            type="number"
            id="valor"
            placeholder="Valor"
            value={formData.valor}
            onChange={e => setFormData({...formData, valor: parseFloat(e.target.value)})}
            step="0.01"
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="tipo_cobranca" className="block text-gray-700 text-sm font-bold mb-2">Tipo Cobrança:</label>
          <input
            type="text"
            id="tipo_cobranca"
            placeholder="Tipo Cobrança"
            value={formData.tipo_cobranca || ''}
            onChange={e => setFormData({...formData, tipo_cobranca: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="numero_cobranca" className="block text-gray-700 text-sm font-bold mb-2">Número Cobrança:</label>
          <input
            type="text"
            id="numero_cobranca"
            placeholder="Número Cobrança"
            value={formData.numero_cobranca || ''}
            onChange={e => setFormData({...formData, numero_cobranca: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="origem_cobranca" className="block text-gray-700 text-sm font-bold mb-2">Origem Cobrança:</label>
          <input
            type="text"
            id="origem_cobranca"
            placeholder="Origem Cobrança"
            value={formData.origem_cobranca || ''}
            onChange={e => setFormData({...formData, origem_cobranca: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="data_vencimento" className="block text-gray-700 text-sm font-bold mb-2">Data de Vencimento:</label>
          <input
            type="date"
            id="data_vencimento"
            value={formData.data_vencimento}
            onChange={e => setFormData({...formData, data_vencimento: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="sinal" className="block text-gray-700 text-sm font-bold mb-2">Sinal:</label>
          <input
            type="text"
            id="sinal"
            placeholder="Sinal"
            value={formData.sinal || ''}
            onChange={e => setFormData({...formData, sinal: e.target.value})}
            maxLength={1}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="sigla" className="block text-gray-700 text-sm font-bold mb-2">Sigla:</label>
          <input
            type="text"
            id="sigla"
            placeholder="Sigla"
            value={formData.sigla || ''}
            onChange={e => setFormData({...formData, sigla: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="situacao" className="block text-gray-700 text-sm font-bold mb-2">Situação:</label>
          <input
            type="text"
            id="situacao"
            placeholder="Situacao"
            value={formData.situacao || ''}
            onChange={e => setFormData({...formData, situacao: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="data_pagamento" className="block text-gray-700 text-sm font-bold mb-2">Data Pagamento:</label>
          <input
            type="date"
            id="data_pagamento"
            value={formData.data_pagamento || ''}
            onChange={e => setFormData({...formData, data_pagamento: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
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
          <label htmlFor="acrescimo" className="block text-gray-700 text-sm font-bold mb-2">Acréscimo:</label>
          <input
            type="number"
            id="acrescimo"
            placeholder="Acréscimo"
            value={formData.acrescimo}
            onChange={e => setFormData({...formData, acrescimo: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="comissao" className="block text-gray-700 text-sm font-bold mb-2">Comissão:</label>
          <input
            type="number"
            id="comissao"
            placeholder="Comissão"
            value={formData.comissao}
            onChange={e => setFormData({...formData, comissao: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="data_baixa" className="block text-gray-700 text-sm font-bold mb-2">Data Baixa:</label>
          <input
            type="date"
            id="data_baixa"
            value={formData.data_baixa || ''}
            onChange={e => setFormData({...formData, data_baixa: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="operacao" className="block text-gray-700 text-sm font-bold mb-2">Operação:</label>
          <input
            type="text"
            id="operacao"
            placeholder="Operação"
            value={formData.operacao || ''}
            onChange={e => setFormData({...formData, operacao: e.target.value})}
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
      </div>
      
      <div className="form-actions flex justify-end gap-4 mt-6">
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

export default ContasFinanceiras;