import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

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

  useEffect(() => {
    carregarVendedores();
  }, []);

  const carregarVendedores = async () => {
    setLoading(true);
    setError(null);
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
    try {
      const response = await fetch(`http://localhost:3000/api/vendedores/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarVendedores(); // Reload vendedores after delete
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar vendedor: ${message}`);
      console.error("Erro ao deletar vendedor:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando vendedores...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
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

// Componente de formulário reutilizável
const VendedorForm: React.FC<{ 
  vendedor: Vendedor | null; 
  onSave: (vendedor: Vendedor) => void; 
  onCancel: () => void 
}> = ({ vendedor, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Vendedor>(vendedor || {
    codigo: '', nome: '', cpf: '', rg: '', endereco: '', bairro: '', cidade: '', estado: '', cep: '', telefone: '', email: '', pracas_atendimento: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{vendedor ? 'Editar' : 'Novo'} Vendedor</h2>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="mb-4">
          <label htmlFor="codigo" className="block text-gray-700 text-sm font-bold mb-2">Código:</label>
          <input
            type="text"
            id="codigo"
            placeholder="Código"
            value={formData.codigo}
            onChange={e => setFormData({...formData, codigo: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="nome" className="block text-gray-700 text-sm font-bold mb-2">Nome:</label>
          <input
            type="text"
            id="nome"
            placeholder="Nome"
            value={formData.nome}
            onChange={e => setFormData({...formData, nome: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>
        
        <div className="mb-4">
          <label htmlFor="cpf" className="block text-gray-700 text-sm font-bold mb-2">CPF:</label>
          <input
            type="text"
            id="cpf"
            placeholder="CPF"
            value={formData.cpf || ''}
            onChange={e => setFormData({...formData, cpf: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="rg" className="block text-gray-700 text-sm font-bold mb-2">RG:</label>
          <input
            type="text"
            id="rg"
            placeholder="RG"
            value={formData.rg || ''}
            onChange={e => setFormData({...formData, rg: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="endereco" className="block text-gray-700 text-sm font-bold mb-2">Endereço:</label>
          <input
            type="text"
            id="endereco"
            placeholder="Endereço"
            value={formData.endereco || ''}
            onChange={e => setFormData({...formData, endereco: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="bairro" className="block text-gray-700 text-sm font-bold mb-2">Bairro:</label>
          <input
            type="text"
            id="bairro"
            placeholder="Bairro"
            value={formData.bairro || ''}
            onChange={e => setFormData({...formData, bairro: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="cidade" className="block text-gray-700 text-sm font-bold mb-2">Cidade:</label>
          <input
            type="text"
            id="cidade"
            placeholder="Cidade"
            value={formData.cidade || ''}
            onChange={e => setFormData({...formData, cidade: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="estado" className="block text-gray-700 text-sm font-bold mb-2">Estado:</label>
          <input
            type="text"
            id="estado"
            placeholder="Estado"
            value={formData.estado || ''}
            onChange={e => setFormData({...formData, estado: e.target.value})}
            maxLength={2}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="cep" className="block text-gray-700 text-sm font-bold mb-2">CEP:</label>
          <input
            type="text"
            id="cep"
            placeholder="CEP"
            value={formData.cep || ''}
            onChange={e => setFormData({...formData, cep: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="telefone" className="block text-gray-700 text-sm font-bold mb-2">Telefone:</label>
          <input
            type="text"
            id="telefone"
            placeholder="Telefone"
            value={formData.telefone || ''}
            onChange={e => setFormData({...formData, telefone: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="email" className="block text-gray-700 text-sm font-bold mb-2">Email:</label>
          <input
            type="email"
            id="email"
            placeholder="Email"
            value={formData.email || ''}
            onChange={e => setFormData({...formData, email: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="pracas_atendimento" className="block text-gray-700 text-sm font-bold mb-2">Praças de Atendimento (JSON):</label>
          <textarea
            id="pracas_atendimento"
            placeholder="Ex: [\&quot;Centro\&quot;, \&quot;Zona Sul\&quot;]"
            value={formData.pracas_atendimento || ''}
            onChange={e => setFormData({...formData, pracas_atendimento: e.target.value})}
            rows={3}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
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

export default Vendedores;