import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

interface Fornecedor {
  id?: number; // ID is optional for new entries
  marca?: string;
  razao_social: string;
  tipo_pessoa?: 'F' | 'J';
  cpf?: string;
  cnpj?: string;
  inscricao_estadual?: string;
  endereco?: string;
  bairro?: string;
  cidade?: string;
  estado?: string;
  cep?: string;
  telefone?: string;
  responsavel?: string;
  telefone_responsavel?: string;
  ativo?: boolean;
}

const Fornecedores: React.FC = () => {
  const [fornecedores, setFornecedores] = useState<Fornecedor[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [fornecedorEditando, setFornecedorEditando] = useState<Fornecedor | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    carregarFornecedores();
  }, []);

  const carregarFornecedores = async () => {
    setLoading(true);
    // Do not reset error/success
    try {
      const response = await fetch('http://localhost:3000/api/fornecedores');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Fornecedor[] = await response.json();
      setFornecedores(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar fornecedores: ${message}`);
      console.error("Erro ao carregar fornecedores:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarFornecedor = async (fornecedor: Fornecedor) => {
    setError(null);
    setSuccess(null);
    try {
      let response;
      if (fornecedor.id) {
        // Update existing fornecedor
        response = await fetch(`http://localhost:3000/api/fornecedores/${fornecedor.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(fornecedor),
        });
      } else {
        // Create new fornecedor
        response = await fetch('http://localhost:3000/api/fornecedores', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(fornecedor),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarFornecedores(); // Reload fornecedores after save
      setMostrarForm(false);
      setFornecedorEditando(null);
      setSuccess(`Fornecedor ${fornecedor.id ? 'atualizado' : 'criado'} com sucesso!`);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar fornecedor: ${message}`);
      console.error("Erro ao salvar fornecedor:", e);
    }
  };

  const deletarFornecedor = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/fornecedores/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarFornecedores(); // Reload fornecedores after delete
      setSuccess("Fornecedor excluído com sucesso!");
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar fornecedor: ${message}`);
      console.error("Erro ao deletar fornecedor:", e);
    }
  };

  if (loading && fornecedores.length === 0) {
    return <div className="text-center p-6">Carregando fornecedores...</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Fornecedores</h1>
        <button 
          onClick={() => { setFornecedorEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Fornecedor
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setFornecedorEditando(null); }}>
        <FornecedorForm
          fornecedor={fornecedorEditando}
          onSave={salvarFornecedor}
          onCancel={() => { setMostrarForm(false); setFornecedorEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Marca</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Razão Social</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">CPF/CNPJ</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cidade</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Telefone</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ativo</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {fornecedores.map(fornecedor => (
              <tr key={fornecedor.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.marca}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.razao_social}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.tipo_pessoa === 'F' ? fornecedor.cpf : fornecedor.cnpj}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.cidade}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.telefone}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedor.ativo ? 'Sim' : 'Não'}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setFornecedorEditando(fornecedor); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarFornecedor(fornecedor.id!)}
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

const FornecedorForm: React.FC<{
  fornecedor: Fornecedor | null;
  onSave: (fornecedor: Fornecedor) => void;
  onCancel: () => void;
}> = ({ fornecedor, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Fornecedor>(
    fornecedor || {
      marca: '',
      razao_social: '',
      tipo_pessoa: 'J',
      cpf: '',
      cnpj: '',
      inscricao_estadual: '',
      endereco: '',
      bairro: '',
      cidade: '',
      estado: '',
      cep: '',
      telefone: '',
      responsavel: '',
      telefone_responsavel: '',
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
        {fornecedor ? 'Editar' : 'Novo'} Fornecedor
      </h2>
      <p className="text-center text-gray-600 mb-8 text-lg">
        Preencha os dados para {fornecedor ? 'atualizar o' : 'cadastrar um novo'} fornecedor.
      </p>

      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
          <label className="block text-xl font-semibold text-gray-700 mb-2">
            1. Informações Principais
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input
              type="text"
              placeholder="Marca"
              value={formData.marca || ''}
              onChange={e => setFormData({ ...formData, marca: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="text"
              placeholder="Razão Social"
              value={formData.razao_social}
              onChange={e => setFormData({ ...formData, razao_social: e.target.value })}
              required
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
        </div>

        <div>
          <label className="block text-xl font-semibold text-gray-700 mb-2">
            2. Documentos
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <select
              value={formData.tipo_pessoa}
              onChange={e => setFormData({ ...formData, tipo_pessoa: e.target.value as 'F' | 'J' })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="J">Pessoa Jurídica</option>
              <option value="F">Pessoa Física</option>
            </select>
            {formData.tipo_pessoa === 'F' ? (
              <input
                type="text"
                placeholder="CPF"
                value={formData.cpf || ''}
                onChange={e => setFormData({ ...formData, cpf: e.target.value })}
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            ) : (
              <input
                type="text"
                placeholder="CNPJ"
                value={formData.cnpj || ''}
                onChange={e => setFormData({ ...formData, cnpj: e.target.value })}
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
            )}
          </div>
        </div>

        <div>
          <label className="block text-xl font-semibold text-gray-700 mb-2">
            3. Endereço
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input
              type="text"
              placeholder="Endereço"
              value={formData.endereco || ''}
              onChange={e => setFormData({ ...formData, endereco: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="text"
              placeholder="Bairro"
              value={formData.bairro || ''}
              onChange={e => setFormData({ ...formData, bairro: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="text"
              placeholder="Cidade"
              value={formData.cidade || ''}
              onChange={e => setFormData({ ...formData, cidade: e.target.value })}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="text"
              placeholder="Estado"
              value={formData.estado || ''}
              onChange={e => setFormData({ ...formData, estado: e.target.value })}
              maxLength={2}
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
        </div>

        <div className="flex items-center">
            <input
              type="checkbox"
              id="ativo"
              checked={!!formData.ativo}
              onChange={e => setFormData({ ...formData, ativo: e.target.checked })}
              className="h-6 w-6 rounded border-gray-300 text-blue-600 focus:ring-blue-500"
            />
            <label htmlFor="ativo" className="ml-3 block text-xl font-semibold text-gray-700">
              4. Fornecedor Ativo
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

export default Fornecedores;