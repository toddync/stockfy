import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import TagInput from '../components/TagInput'; // Import the new component
import Alerta from '../components/Alerta';

interface Vendedor {
  id?: number; // ID is optional for new entries
  codigo: string;
  nome: string;
  cpf?: string;
  rg?: string;
  endereco?: string;
  bairro?: string;
  cidade?: string;
  estado?: string;
  cep?: string;
  telefone?: string;
  email?: string;
  pracas_atendimento?: string; // JSON type in DB, handle as string here
  data_cadastro?: string; // TIMESTAMP type
}

const Vendedores: React.FC = () => {
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [vendedorEditando, setVendedorEditando] = useState<Vendedor | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    carregarVendedores();
  }, []);

  const carregarVendedores = async () => {
    setLoading(true);
    // Do not reset success/error here
    try {
      const response = await fetch('http://localhost:3000/api/vendedores');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Vendedor[] = await response.json();
      setVendedores(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar vendedores: ${message}`);
      console.error("Erro ao carregar vendedores:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarVendedor = async (vendedor: Vendedor) => {
    setError(null);
    setSuccess(null);
    try {
      let response;
      if (vendedor.id) {
        // Update existing vendedor
        response = await fetch(`http://localhost:3000/api/vendedores/${vendedor.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(vendedor),
        });
      } else {
        // Create new vendedor
        response = await fetch('http://localhost:3000/api/vendedores', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(vendedor),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarVendedores(); // Reload vendedores after save
      setMostrarForm(false);
      setVendedorEditando(null);
      setSuccess(`Vendedor ${vendedor.id ? 'atualizado' : 'criado'} com sucesso!`);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar vendedor: ${message}`);
      console.error("Erro ao salvar vendedor:", e);
    }
  };

  const deletarVendedor = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/vendedores/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarVendedores(); // Reload vendedores after delete
      setSuccess("Vendedor excluído com sucesso!");
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar vendedor: ${message}`);
      console.error("Erro ao deletar vendedor:", e);
    }
  };

  if (loading && vendedores.length === 0) {
    return <div className="text-center p-6">Carregando vendedores...</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Vendedores</h1>
        <button 
          onClick={() => { setVendedorEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Vendedor
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setVendedorEditando(null); }}>
        <VendedorForm
          vendedor={vendedorEditando}
          onSave={salvarVendedor}
          onCancel={() => { setMostrarForm(false); setVendedorEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Código</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nome</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">CPF</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Email</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Telefone</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {vendedores.map(vendedor => (
              <tr key={vendedor.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{vendedor.codigo}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedor.nome}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedor.cpf}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedor.email}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{vendedor.telefone}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setVendedorEditando(vendedor); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarVendedor(vendedor.id!)}
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

const VendedorForm: React.FC<{
  vendedor: Vendedor | null;
  onSave: (vendedor: Vendedor) => void;
  onCancel: () => void;
}> = ({ vendedor, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Vendedor>(
    vendedor || {
      codigo: '',
      nome: '',
      cpf: '',
      rg: '',
      endereco: '',
      bairro: '',
      cidade: '',
      estado: '',
      cep: '',
      telefone: '',
      email: '',
      pracas_atendimento: '[]',
    }
  );

  // Safely parse the pracas_atendimento JSON string
  const getPracasAsArray = () => {
    try {
      const pracas = JSON.parse(formData.pracas_atendimento || '[]');
      return Array.isArray(pracas) ? pracas : [];
    } catch (e) {
      return []; // Return empty array if JSON is invalid
    }
  };

  const handlePracasChange = (newPracas: string[]) => {
    setFormData({ ...formData, pracas_atendimento: JSON.stringify(newPracas) });
  };

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            {vendedor ? 'Editar' : 'Novo'} Vendedor
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {vendedor ? 'atualizar o' : 'cadastrar um novo'} vendedor.
        </p>
        <form onSubmit={handleSubmit} className="space-y-8">
            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    1. Informações Pessoais
                </label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input
                        type="text"
                        placeholder="Código"
                        value={formData.codigo}
                        onChange={e => setFormData({ ...formData, codigo: e.target.value })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <input
                        type="text"
                        placeholder="Nome"
                        value={formData.nome}
                        onChange={e => setFormData({ ...formData, nome: e.target.value })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <input
                        type="text"
                        placeholder="CPF"
                        value={formData.cpf || ''}
                        onChange={e => setFormData({ ...formData, cpf: e.target.value })}
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <input
                        type="text"
                        placeholder="RG"
                        value={formData.rg || ''}
                        onChange={e => setFormData({ ...formData, rg: e.target.value })}
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                </div>
            </div>

            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    2. Contato
                </label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input
                        type="text"
                        placeholder="Telefone"
                        value={formData.telefone || ''}
                        onChange={e => setFormData({ ...formData, telefone: e.target.value })}
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <input
                        type="email"
                        placeholder="Email"
                        value={formData.email || ''}
                        onChange={e => setFormData({ ...formData, email: e.target.value })}
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                </div>
            </div>

            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    3. Praças de Atendimento
                </label>
                <TagInput
                    tags={getPracasAsArray()}
                    onTagsChange={handlePracasChange}
                    placeholder="Adicione uma praça e pressione Enter"
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

export default Vendedores;