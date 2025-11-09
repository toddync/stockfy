import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface Usuario {
  id?: number; // ID is optional for new entries
  nome: string;
  senha_hash: string; // Stored as hash in DB, but for simplicity in form, we'll treat it as a string input
  ativo?: boolean;
  data_criacao?: string; // TIMESTAMP type
}

const Usuarios: React.FC = () => {
  const [usuarios, setUsuarios] = useState<Usuario[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [usuarioEditando, setUsuarioEditando] = useState<Usuario | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarUsuarios();
  }, []);

  const carregarUsuarios = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await fetch('http://localhost:3000/api/usuarios');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Usuario[] = await response.json();
      setUsuarios(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar usuários: ${message}`);
      console.error("Erro ao carregar usuários:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarUsuario = async (usuario: Usuario) => {
    setError(null);
    try {
      let response;
      if (usuario.id) {
        // Update existing usuario
        response = await fetch(`http://localhost:3000/api/usuarios/${usuario.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(usuario),
        });
      } else {
        // Create new usuario
        response = await fetch('http://localhost:3000/api/usuarios', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(usuario),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarUsuarios(); // Reload usuarios after save
      setMostrarForm(false);
      setUsuarioEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar usuário: ${message}`);
      console.error("Erro ao salvar usuário:", e);
    }
  };

  const deletarUsuario = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/usuarios/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarUsuarios(); // Reload usuarios after delete
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar usuário: ${message}`);
      console.error("Erro ao deletar usuário:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando usuários...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Usuários</h1>
        <button 
          onClick={() => { setUsuarioEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Usuário
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setUsuarioEditando(null); }}>
        <UsuarioForm
          usuario={usuarioEditando}
          onSave={salvarUsuario}
          onCancel={() => { setMostrarForm(false); setUsuarioEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nome</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ativo</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Data Criação</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {usuarios.map(usuario => (
              <tr key={usuario.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{usuario.nome}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{usuario.ativo ? 'Sim' : 'Não'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(usuario.data_criacao!).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setUsuarioEditando(usuario); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarUsuario(usuario.id!)}
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
const UsuarioForm: React.FC<{ 
  usuario: Usuario | null; 
  onSave: (usuario: Usuario) => void; 
  onCancel: () => void 
}> = ({ usuario, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Usuario>(usuario || {
    nome: '', senha_hash: '', ativo: true
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{usuario ? 'Editar' : 'Novo'} Usuário</h2>
      
      <div className="mb-4">
        <label htmlFor="nome" className="block text-gray-700 text-sm font-bold mb-2">Nome:</label>
        <input
          type="text"
          id="nome"
          placeholder="Nome de Usuário"
          value={formData.nome}
          onChange={e => setFormData({...formData, nome: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="senha_hash" className="block text-gray-700 text-sm font-bold mb-2">Senha:</label>
        <input
          type="password"
          id="senha_hash"
          placeholder="Senha"
          value={formData.senha_hash}
          onChange={e => setFormData({...formData, senha_hash: e.target.value})}
          required={!usuario} // Password is required for new users
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-6 flex items-center">
        <input
          type="checkbox"
          id="ativo"
          checked={formData.ativo}
          onChange={e => setFormData({...formData, ativo: e.target.checked})}
          className="mr-2 leading-tight"
        />
        <label htmlFor="ativo" className="text-gray-700 text-sm font-bold">Ativo</label>
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

export default Usuarios;