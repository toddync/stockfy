import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

interface Cliente {
  id?: number; // ID is optional for new clients
  nome: string;
  cpf_cnpj: string;
  ie_rg?: string; // Optional based on schema
  endereco?: string;
  bairro?: string;
  cidade: string;
  estado?: string;
  cep?: string;
  telefone: string;
  email?: string;
  limite_credito?: number;
  data_nascimento?: string; // DATE type
  nome_mae?: string;
  nome_pai?: string;
  naturalidade?: string;
  rota_id?: number;
  praça?: string;
  referencia?: string;
  ativo: boolean;
  data_cadastro?: string; // TIMESTAMP type
  hora_visita_inicio?: string; // TIME type
  hora_visita_fim?: string; // TIME type
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

  useEffect(() => {
    carregarClientes();
  }, []);

  const carregarClientes = async () => {
    setLoading(true);
    // Do not reset success/error here so the message can persist after reload
    try {
      const response = await fetch('http://localhost:3000/api/clientes');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Cliente[] = await response.json();
      setClientes(data);
    } catch (e: unknown) { // Changed from any to unknown
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
        // Update existing client
        response = await fetch(`http://localhost:3000/api/clientes/${cliente.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(cliente),
        });
      } else {
        // Create new client
        response = await fetch('http://localhost:3000/api/clientes', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(cliente),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarClientes(); // Reload clients after save
      setMostrarForm(false);
      setClienteEditando(null);
      setSuccess(`Cliente ${cliente.id ? 'atualizado' : 'criado'} com sucesso!`);
    } catch (e: unknown) { // Changed from any to unknown
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
      await carregarClientes(); // Reload clients after delete
      setSuccess("Cliente excluído com sucesso!");
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar cliente: ${message}`);
      console.error("Erro ao deletar cliente:", e);
    }
  };

  if (loading && clientes.length === 0) {
    return <div className="text-center p-6">Carregando clientes...</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Clientes</h1>
        <button 
          onClick={() => { setClienteEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Cliente
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setClienteEditando(null); }}>
        <ClienteForm
          cliente={clienteEditando}
          onSave={salvarCliente}
          onCancel={() => { setMostrarForm(false); setClienteEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nome</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">CPF/CNPJ</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Telefone</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cidade</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Status</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {clientes.map(cliente => (
              <tr key={cliente.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{cliente.nome}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{cliente.cpf_cnpj}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{cliente.telefone}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{cliente.cidade}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{cliente.ativo ? 'Ativo' : 'Inativo'}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setClienteEditando(cliente); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarCliente(cliente.id!)} // ID is guaranteed to exist for existing clients
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

const ClienteForm: React.FC<{
  cliente: Cliente | null;
  onSave: (cliente: Cliente) => void;
  onCancel: () => void;
}> = ({ cliente, onSave, onCancel }) => {
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
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
      <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
        {cliente ? 'Editar Cliente' : 'Novo Cliente'}
      </h2>
      <p className="text-center text-gray-600 mb-8 text-lg">
        Preencha os dados para {cliente ? 'atualizar o' : 'cadastrar um novo'} cliente.
      </p>

      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
          <label htmlFor="nome" className="block text-xl font-semibold text-gray-700 mb-2">
            1. Nome Completo
          </label>
          <input
            type="text"
            id="nome"
            placeholder="Nome completo do cliente"
            value={formData.nome}
            onChange={e => setFormData({ ...formData, nome: e.target.value })}
            required
            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
        </div>

        <div>
          <label htmlFor="cpf_cnpj" className="block text-xl font-semibold text-gray-700 mb-2">
            2. CPF ou CNPJ
          </label>
          <input
            type="text"
            id="cpf_cnpj"
            placeholder="Documento (CPF ou CNPJ)"
            value={formData.cpf_cnpj}
            onChange={e => setFormData({ ...formData, cpf_cnpj: e.target.value })}
            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
        </div>

        <div>
          <label htmlFor="telefone" className="block text-xl font-semibold text-gray-700 mb-2">
            3. Contato
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input
              type="text"
              id="telefone"
              placeholder="Telefone"
              value={formData.telefone}
              onChange={e => setFormData({ ...formData, telefone: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="email"
              id="email"
              placeholder="Email (opcional)"
              value={formData.email || ''}
              onChange={e => setFormData({ ...formData, email: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
        </div>

        <div>
          <label htmlFor="cidade" className="block text-xl font-semibold text-gray-700 mb-2">
            4. Localização
          </label>
          <input
            type="text"
            id="cidade"
            placeholder="Cidade"
            value={formData.cidade}
            onChange={e => setFormData({ ...formData, cidade: e.target.value })}
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
              5. Cliente Ativo
            </label>
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

export default Clientes;