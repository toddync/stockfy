import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface Permissao {
  id?: number; // ID is optional for new entries
  chave: string;
  descricao?: string;
}

const Permissoes: React.FC = () => {
  const [permissoes, setPermissoes] = useState<Permissao[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [permissaoEditando, setPermissaoEditando] = useState<Permissao | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null); // Add success state

  useEffect(() => {
    carregarPermissoes();
  }, []);

  const carregarPermissoes = async () => {
    setLoading(true);
    setError(null);
    // Do not reset success here so message can persist after reload
    try {
      const response = await fetch('http://localhost:3000/api/permissoes');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Permissao[] = await response.json();
      setPermissoes(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar permissões: ${message}`);
      console.error("Erro ao carregar permissões:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarPermissao = async (permissao: Permissao) => {
    setError(null);
    setSuccess(null); // Reset success message
    try {
      let response;
      if (permissao.id) {
        // Update existing permissao
        response = await fetch(`http://localhost:3000/api/permissoes/${permissao.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(permissao),
        });
      } else {
        // Create new permissao
        response = await fetch('http://localhost:3000/api/permissoes', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(permissao),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarPermissoes(); // Reload permissions after save
      setMostrarForm(false);
      setPermissaoEditando(null);
      setSuccess(`Permissão ${permissao.id ? 'atualizada' : 'criada'} com sucesso!`); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar permissão: ${message}`);
      console.error("Erro ao salvar permissão:", e);
    }
  };

  const deletarPermissao = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null); // Reset success message
    try {
      const response = await fetch(`http://localhost:3000/api/permissoes/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarPermissoes(); // Reload permissions after delete
      setSuccess("Permissão excluída com sucesso!"); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar permissão: ${message}`);
      console.error("Erro ao deletar permissão:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando permissões...</div>;
  }

  // Error display from the initial load should still show.
  // The Alerta component will handle subsequent errors from save/delete.

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {/* Display Alerta for success and error messages */}
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Permissões</h1>
        <button 
          onClick={() => { setPermissaoEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Permissão
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setPermissaoEditando(null); }}>
        <PermissaoForm
          permissao={permissaoEditando}
          onSave={salvarPermissao}
          onCancel={() => { setMostrarForm(false); setPermissaoEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Chave</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Descrição</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {permissoes.map(permissao => (
              <tr key={permissao.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{permissao.chave}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{permissao.descricao}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setPermissaoEditando(permissao); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarPermissao(permissao.id!)}
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
const PermissaoForm: React.FC<{ 
  permissao: Permissao | null; 
  onSave: (permissao: Permissao) => void; 
  onCancel: () => void 
}> = ({ permissao, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Permissao>(permissao || {
    chave: '', descricao: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{permissao ? 'Editar' : 'Nova'} Permissão</h2>
      
      <div className="mb-4">
        <label htmlFor="chave" className="block text-gray-700 text-sm font-bold mb-2">Chave:</label>
        <input
          type="text"
          id="chave"
          placeholder="Chave da Permissão"
          value={formData.chave}
          onChange={e => setFormData({...formData, chave: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="descricao" className="block text-gray-700 text-sm font-bold mb-2">Descrição:</label>
        <input
          type="text"
          id="descricao"
          placeholder="Descrição da Permissão"
          value={formData.descricao || ''}
          onChange={e => setFormData({...formData, descricao: e.target.value})}
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

export default Permissoes;