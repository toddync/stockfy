import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

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

  useEffect(() => {
    carregarFornecedores();
  }, []);

  const carregarFornecedores = async () => {
    setLoading(true);
    setError(null);
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
    try {
      const response = await fetch(`http://localhost:3000/api/fornecedores/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarFornecedores(); // Reload fornecedores after delete
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar fornecedor: ${message}`);
      console.error("Erro ao deletar fornecedor:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando fornecedores...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
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

// Componente de formulário reutilizável
const FornecedorForm: React.FC<{ 
  fornecedor: Fornecedor | null; 
  onSave: (fornecedor: Fornecedor) => void; 
  onCancel: () => void 
}> = ({ fornecedor, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Fornecedor>(fornecedor || {
    marca: '', razao_social: '', tipo_pessoa: 'J', cpf: '', cnpj: '', inscricao_estadual: '', endereco: '', bairro: '', cidade: '', estado: '', cep: '', telefone: '', responsavel: '', telefone_responsavel: '', ativo: true
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{fornecedor ? 'Editar' : 'Novo'} Fornecedor</h2>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="mb-4">
          <label htmlFor="marca" className="block text-gray-700 text-sm font-bold mb-2">Marca:</label>
          <input
            type="text"
            id="marca"
            placeholder="Marca"
            value={formData.marca || ''}
            onChange={e => setFormData({...formData, marca: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>
        
        <div className="mb-4">
          <label htmlFor="razao_social" className="block text-gray-700 text-sm font-bold mb-2">Razão Social:</label>
          <input
            type="text"
            id="razao_social"
            placeholder="Razão Social"
            value={formData.razao_social}
            onChange={e => setFormData({...formData, razao_social: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="tipo_pessoa" className="block text-gray-700 text-sm font-bold mb-2">Tipo Pessoa:</label>
          <select
            id="tipo_pessoa"
            value={formData.tipo_pessoa}
            onChange={e => setFormData({...formData, tipo_pessoa: e.target.value as 'F' | 'J'})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="J">Jurídica</option>
            <option value="F">Física</option>
          </select>
        </div>

        {formData.tipo_pessoa === 'F' ? (
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
        ) : (
          <div className="mb-4">
            <label htmlFor="cnpj" className="block text-gray-700 text-sm font-bold mb-2">CNPJ:</label>
            <input
              type="text"
              id="cnpj"
              placeholder="CNPJ"
              value={formData.cnpj || ''}
              onChange={e => setFormData({...formData, cnpj: e.target.value})}
              className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
        )}

        <div className="mb-4">
          <label htmlFor="inscricao_estadual" className="block text-gray-700 text-sm font-bold mb-2">Inscrição Estadual:</label>
          <input
            type="text"
            id="inscricao_estadual"
            placeholder="Inscrição Estadual"
            value={formData.inscricao_estadual || ''}
            onChange={e => setFormData({...formData, inscricao_estadual: e.target.value})}
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
          <label htmlFor="responsavel" className="block text-gray-700 text-sm font-bold mb-2">Responsável:</label>
          <input
            type="text"
            id="responsavel"
            placeholder="Responsável"
            value={formData.responsavel || ''}
            onChange={e => setFormData({...formData, responsavel: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="telefone_responsavel" className="block text-gray-700 text-sm font-bold mb-2">Telefone Responsável:</label>
          <input
            type="text"
            id="telefone_responsavel"
            placeholder="Telefone Responsável"
            value={formData.telefone_responsavel || ''}
            onChange={e => setFormData({...formData, telefone_responsavel: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-6 flex items-center col-span-full">
          <input
            type="checkbox"
            id="ativo"
            checked={formData.ativo}
            onChange={e => setFormData({...formData, ativo: e.target.checked})}
            className="mr-2 leading-tight"
          />
          <label htmlFor="ativo" className="text-gray-700 text-sm font-bold">Ativo</label>
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

export default Fornecedores;