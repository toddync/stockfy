import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import PageLayout from '../components/PageLayout';
import { useSeniorMode } from '../contexts/SeniorModeContext';

interface Cliente {
  id?: number;
  nome: string;
  cpf_cnpj: string;
  ie_rg?: string;
  endereco?: string;
  bairro?: string;
  cidade: string;
  estado?: string;
  cep?: string;
  telefone: string;
  email?: string;
  limite_credito?: number;
  data_nascimento?: string;
  nome_mae?: string;
  nome_pai?: string;
  naturalidade?: string;
  rota_id?: number;
  praça?: string;
  referencia?: string;
  ativo: boolean;
  data_cadastro?: string;
  hora_visita_inicio?: string;
  hora_visita_fim?: string;
  dias_visita?: string;
  observacoes?: string;
}

const Clientes: React.FC = () => {
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [clienteEditando, setClienteEditando] = useState<Cliente | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const { isSeniorMode } = useSeniorMode();

  useEffect(() => {
    carregarClientes();
  }, []);

  const carregarClientes = async () => {
    setLoading(true);
    try {
      const response = await fetch('http://localhost:3000/api/clientes');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Cliente[] = await response.json();
      setClientes(data);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar clientes: ${message}`);
      console.error("Erro ao carregar clientes:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarCliente = async (cliente: Cliente) => {
    setError(null);
    setSuccess(null);
    try {
      let response;
      if (cliente.id) {
        response = await fetch(`http://localhost:3000/api/clientes/${cliente.id}`, {
          method: 'PUT',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(cliente),
        });
      } else {
        response = await fetch('http://localhost:3000/api/clientes', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(cliente),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarClientes();
      setMostrarForm(false);
      setClienteEditando(null);
      setSuccess(`Cliente ${cliente.id ? 'atualizado' : 'criado'} com sucesso!`);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar cliente: ${message}`);
      console.error("Erro ao salvar cliente:", e);
    }
  };

  const deletarCliente = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/clientes/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarClientes();
      setSuccess("Cliente excluído com sucesso!");
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar cliente: ${message}`);
      console.error("Erro ao deletar cliente:", e);
    }
  };

  const actions = (
    <button
      onClick={() => { setClienteEditando(null); setMostrarForm(true); }}
      className={`${isSeniorMode ? 'bg-blue-600 hover:bg-blue-700 py-3 px-6 text-xl' : 'bg-blue-500 hover:bg-blue-600 py-2 px-4'} text-white font-bold rounded-md transition-colors`}
    >
      {isSeniorMode ? '+ Adicionar Novo Cliente' : '+ Novo Cliente'}
    </button>
  );

  return (
    <PageLayout
      title="Gerenciar Clientes"
      actions={actions}
      isLoading={loading}
      error={error}
      success={success}
      onErrorClose={() => setError(null)}
      onSuccessClose={() => setSuccess(null)}
    >
      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setClienteEditando(null); }} size="4xl">
        <ClienteForm
          cliente={clienteEditando}
          onSave={salvarCliente}
          onCancel={() => { setMostrarForm(false); setClienteEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className={`min-w-full bg-white border border-gray-200 ${isSeniorMode ? 'text-lg' : 'text-sm'}`}>
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left font-semibold text-gray-600">Nome</th>
              <th className="py-3 px-4 text-left font-semibold text-gray-600">Telefone</th>
              <th className="py-3 px-4 text-left font-semibold text-gray-600">Cidade</th>
              {!isSeniorMode && <th className="py-3 px-4 text-left font-semibold text-gray-600">CPF/CNPJ</th>}
              {!isSeniorMode && <th className="py-3 px-4 text-left font-semibold text-gray-600">Status</th>}
              <th className="py-3 px-4 text-left font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map(cliente => (
              <tr key={cliente.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-gray-700">{cliente.nome}</td>
                <td className="py-3 px-4 text-gray-700">{cliente.telefone}</td>
                <td className="py-3 px-4 text-gray-700">{cliente.cidade}</td>
                {!isSeniorMode && <td className="py-3 px-4 text-gray-700">{cliente.cpf_cnpj}</td>}
                {!isSeniorMode && <td className="py-3 px-4 text-gray-700">{cliente.ativo ? 'Ativo' : 'Inativo'}</td>}
                <td className="py-3 px-4">
                  <button
                    onClick={() => { setClienteEditando(cliente); setMostrarForm(true); }}
                    className={`${isSeniorMode ? 'py-2 px-4 text-lg' : 'py-1 px-3'} bg-yellow-500 hover:bg-yellow-600 text-white font-bold rounded-md mr-2 transition-colors`}
                  >
                    Editar
                  </button>
                  <button
                    onClick={() => deletarCliente(cliente.id!)}
                    className={`${isSeniorMode ? 'py-2 px-4 text-lg' : 'py-1 px-3'} bg-red-500 hover:bg-red-600 text-white font-bold rounded-md transition-colors`}
                  >
                    Excluir
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </PageLayout>
  );
};

const ClienteForm: React.FC<{
  cliente: Cliente | null;
  onSave: (cliente: Cliente) => void;
  onCancel: () => void;
}> = ({ cliente, onSave, onCancel }) => {
  const { isSeniorMode } = useSeniorMode();
  const [formData, setFormData] = useState<Cliente>(
    cliente || {
      nome: '',
      cpf_cnpj: '',
      telefone: '',
      cidade: '',
      ativo: true,
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className={`w-full bg-white shadow-2xl rounded-2xl ${isSeniorMode ? 'p-8' : 'p-10'}`}>
      <h2 className={`${isSeniorMode ? 'text-5xl mb-8' : 'text-4xl mb-4'} font-bold text-gray-800 text-center`}>
        {cliente ? 'Editar Cliente' : 'Novo Cliente'}
      </h2>

      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
          <label htmlFor="nome" className={`block font-semibold text-gray-700 mb-2 ${isSeniorMode ? 'text-2xl' : 'text-xl'}`}>
            Nome Completo
          </label>
          <input
            type="text"
            id="nome"
            value={formData.nome}
            onChange={e => setFormData({ ...formData, nome: e.target.value })}
            required
            className={`shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent ${isSeniorMode ? 'py-4 px-6 text-2xl' : 'py-3 px-4 text-lg'}`}
          />
        </div>

        <div>
          <label htmlFor="telefone" className={`block font-semibold text-gray-700 mb-2 ${isSeniorMode ? 'text-2xl' : 'text-xl'}`}>
            Telefone
          </label>
          <input
            type="text"
            id="telefone"
            value={formData.telefone}
            onChange={e => setFormData({ ...formData, telefone: e.target.value })}
            className={`shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent ${isSeniorMode ? 'py-4 px-6 text-2xl' : 'py-3 px-4 text-lg'}`}
          />
        </div>

        <div>
          <label htmlFor="cidade" className={`block font-semibold text-gray-700 mb-2 ${isSeniorMode ? 'text-2xl' : 'text-xl'}`}>
            Cidade
          </label>
          <input
            type="text"
            id="cidade"
            value={formData.cidade}
            onChange={e => setFormData({ ...formData, cidade: e.target.value })}
            className={`shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent ${isSeniorMode ? 'py-4 px-6 text-2xl' : 'py-3 px-4 text-lg'}`}
          />
        </div>

        {!isSeniorMode && (
          <>
            <div>
              <label htmlFor="cpf_cnpj" className="block text-xl font-semibold text-gray-700 mb-2">
                CPF ou CNPJ
              </label>
              <input
                type="text"
                id="cpf_cnpj"
                value={formData.cpf_cnpj}
                onChange={e => setFormData({ ...formData, cpf_cnpj: e.target.value })}
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            </div>

            <div className="flex items-center">
              <input
                type="checkbox"
                id="ativo"
                checked={formData.ativo}
                onChange={e => setFormData({ ...formData, ativo: e.target.checked })}
                className="h-6 w-6 rounded border-gray-300 text-blue-600 focus:ring-blue-500"
              />
              <label htmlFor="ativo" className="ml-3 block text-xl font-semibold text-gray-700">
                Cliente Ativo
              </label>
            </div>
          </>
        )}

        <div className="form-actions flex justify-center gap-6 pt-4">
          <button
            type="button"
            onClick={onCancel}
            className={`w-1/3 bg-gray-500 hover:bg-gray-600 text-white font-bold rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300 ${isSeniorMode ? 'py-6 px-10 text-2xl' : 'py-4 px-8 text-xl'}`}
          >
            Cancelar
          </button>
          <button
            type="submit"
            className={`w-1/3 bg-green-600 hover:bg-green-700 text-white font-bold rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300 ${isSeniorMode ? 'py-6 px-10 text-2xl' : 'py-4 px-8 text-xl'}`}
          >
            {isSeniorMode ? 'Salvar Cliente' : 'Salvar'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default Clientes;