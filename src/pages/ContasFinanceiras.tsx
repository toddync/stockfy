import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

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
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    try {
      const [contasResponse, vendedoresResponse, clientesResponse] = await Promise.all([
        fetch('http://localhost:3000/api/contas-financeiras'),
        fetch('http://localhost:3000/api/vendedores'),
        fetch('http://localhost:3000/api/clientes')
      ]);

      if (!contasResponse.ok || !vendedoresResponse.ok || !clientesResponse.ok) {
        throw new Error(`Falha ao carregar dados do servidor.`);
      }

      const contasData: ContaFinanceira[] = await contasResponse.json();
      const vendedoresData: Vendedor[] = await vendedoresResponse.json();
      const clientesData: Cliente[] = await clientesResponse.json();

      setContas(contasData);
      setVendedores(vendedoresData);
      setClientes(clientesData);
    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(`Falha ao carregar dados: ${message}`);
      console.error("Erro ao carregar dados:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarConta = async (conta: ContaFinanceira) => {
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(
        conta.id ? `http://localhost:3000/api/contas-financeiras/${conta.id}` : 'http://localhost:3000/api/contas-financeiras',
        {
          method: conta.id ? 'PUT' : 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(conta),
        }
      );

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados();
      setMostrarForm(false);
      setContaEditando(null);
      setSuccess(`Conta ${conta.id ? 'atualizada' : 'criada'} com sucesso!`);
    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(`Falha ao salvar conta financeira: ${message}`);
      console.error("Erro ao salvar conta financeira:", e);
    }
  };

  const deletarConta = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/contas-financeiras/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados();
      setSuccess("Conta excluída com sucesso!");
    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(`Falha ao deletar conta financeira: ${message}`);
      console.error("Erro ao deletar conta financeira:", e);
    }
  };

  if (loading && contas.length === 0) {
    return <div className="text-center p-6">Carregando contas financeiras...</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

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
                <td className="py-3 px-4 text-sm text-gray-700">{conta.numero_documento}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{conta.valor.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(conta.data_vencimento).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm">
                  <span className={`px-2 py-1 rounded-full text-xs font-semibold ${
                    conta.situacao === 'Pago' ? 'bg-green-100 text-green-800' :
                    'bg-yellow-100 text-yellow-800'
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

const ContaFinanceiraForm: React.FC<{
  conta: ContaFinanceira | null;
  vendedores: Vendedor[];
  clientes: Cliente[];
  onSave: (conta: ContaFinanceira) => void;
  onCancel: () => void;
}> = ({ conta, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<ContaFinanceira>(
    conta || {
      data_emissao: new Date().toISOString().split('T')[0],
      tipo_documento: '',
      numero_documento: '',
      valor: 0,
      data_vencimento: new Date().toISOString().split('T')[0],
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
            {conta ? 'Editar' : 'Nova'} Conta Financeira
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {conta ? 'atualizar a' : 'cadastrar uma nova'} conta.
        </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Informações do Documento
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input
                    type="text"
                    placeholder="Tipo de Documento (NF, Boleto...)"
                    value={formData.tipo_documento}
                    onChange={e => setFormData({ ...formData, tipo_documento: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="text"
                    placeholder="Número do Documento"
                    value={formData.numero_documento}
                    onChange={e => setFormData({ ...formData, numero_documento: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>

        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Datas e Valores
            </label>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <input
                    type="date"
                    title='Data de emissão'
                    value={formData.data_emissao}
                    onChange={e => setFormData({ ...formData, data_emissao: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="date"
                    title='Data de vencimento'
                    value={formData.data_vencimento}
                    onChange={e => setFormData({ ...formData, data_vencimento: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="number"
                    placeholder="Valor"
                    value={formData.valor}
                    onChange={e => setFormData({ ...formData, valor: parseFloat(e.target.value) })}
                    step="0.01"
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>
        
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                3. Cliente e Observações
            </label>
            <div className="grid grid-cols-1 gap-4">
                <select
                    id="cliente_id"
                    value={formData.cliente_id}
                    onChange={e => setFormData({ ...formData, cliente_id: parseInt(e.target.value) })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                    <option value="0">Selecione um Cliente</option>
                    {clientes.map(cliente => (
                    <option key={cliente.id} value={cliente.id}>
                        {cliente.nome}
                    </option>
                    ))}
                </select>
                <textarea
                    placeholder="Observações (opcional)"
                    value={formData.observacoes || ''}
                    onChange={e => setFormData({ ...formData, observacoes: e.target.value })}
                    rows={3}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
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

export default ContasFinanceiras;