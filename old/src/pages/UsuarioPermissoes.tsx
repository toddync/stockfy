import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

interface UsuarioPermissao {
  usuario_id: number;
  permissao_id: number;
}

interface Usuario {
  id: number;
  nome: string;
}

interface Permissao {
  id: number;
  chave: string;
  descricao: string;
}

const UsuarioPermissoes: React.FC = () => {
  const [usuarioPermissoes, setUsuarioPermissoes] = useState<UsuarioPermissao[]>([]);
  const [usuarios, setUsuarios] = useState<Usuario[]>([]);
  const [permissoes, setPermissoes] = useState<Permissao[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [usuarioPermissaoEditando, setUsuarioPermissaoEditando] = useState<UsuarioPermissao | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null); // Add success state

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    // Do not reset success here so message can persist after reload
    try {
      const [usuarioPermissoesResponse, usuariosResponse, permissoesResponse] = await Promise.all([
        fetch('http://localhost:3000/api/usuario_permissoes'),
        fetch('http://localhost:3000/api/usuarios'),
        fetch('http://localhost:3000/api/permissoes')
      ]);

      if (!usuarioPermissoesResponse.ok) {
        throw new Error(`HTTP error! status: ${usuarioPermissoesResponse.status} for usuario_permissoes`);
      }
      if (!usuariosResponse.ok) {
        throw new Error(`HTTP error! status: ${usuariosResponse.status} for usuarios`);
      }
      if (!permissoesResponse.ok) {
        throw new Error(`HTTP error! status: ${permissoesResponse.status} for permissoes`);
      }

      const usuarioPermissoesData: UsuarioPermissao[] = await usuarioPermissoesResponse.json();
      const usuariosData: Usuario[] = await usuariosResponse.json();
      const permissoesData: Permissao[] = await permissoesResponse.json();

      setUsuarioPermissoes(usuarioPermissoesData);
      setUsuarios(usuariosData);
      setPermissoes(permissoesData);
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

  const salvarUsuarioPermissao = async (up: UsuarioPermissao) => {
    setError(null);
    setSuccess(null); // Reset success message
    try {
      // Check if the association already exists in the current state
      const existsLocally = usuarioPermissoes.some(
        (item) => item.usuario_id === up.usuario_id && item.permissao_id === up.permissao_id
      );

      if (existsLocally) {
        setSuccess('Esta associação de usuário e permissão já existe.'); // Use success for this
        setMostrarForm(false);
        setUsuarioPermissaoEditando(null);
        return;
      }

      // Since usuario_permissoes has a composite key and no single 'id',
      // we only support creation (POST) and deletion (DELETE) of associations.
      // There's no 'update' in the traditional sense for a composite key table
      // without a single primary key 'id' column.
      const response = await fetch('http://localhost:3000/api/usuario_permissoes', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(up),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setUsuarioPermissaoEditando(null);
      setSuccess('Associação criada com sucesso!'); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar associação: ${message}`);
      console.error("Erro ao salvar associação:", e);
    }
  };

  const deletarUsuarioPermissao = async (usuario_id: number, permissao_id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null); // Reset success message
    try {
      // For composite keys, we need to send both parts of the key for deletion.
      // The generic CRUD service might need to be adapted to handle this,
      // or a custom backend route for this specific table would be more appropriate.
      // Assuming the generic DELETE can handle a body for composite keys.
      const response = await fetch(`http://localhost:3000/api/usuario_permissoes`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ usuario_id, permissao_id }), // Sending composite key in body
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after delete
      setSuccess("Associação excluída com sucesso!"); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar associação: ${message}`);
      console.error("Erro ao deletar associação:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando permissões de usuário...</div>;
  }

  // Error display from the initial load should still show.
  // The Alerta component will handle subsequent errors from save/delete.

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {/* Display Alerta for success and error messages */}
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Permissões de Usuário</h1>
        <button 
          onClick={() => { setUsuarioPermissaoEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Associação
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setUsuarioPermissaoEditando(null); }}>
        <UsuarioPermissaoForm
          usuarioPermissao={usuarioPermissaoEditando}
          usuarios={usuarios}
          permissoes={permissoes}
          onSave={salvarUsuarioPermissao}
          onCancel={() => { setMostrarForm(false); setUsuarioPermissaoEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Usuário</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Permissão</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {usuarioPermissoes.map((up) => ( 
              <tr key={`${up.usuario_id}-${up.permissao_id}`} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{usuarios.find(u => u.id === up.usuario_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{permissoes.find(p => p.id === up.permissao_id)?.descricao || 'N/A'}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => deletarUsuarioPermissao(up.usuario_id, up.permissao_id)}
                    className="bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded-md transition-colors"
                  >
                    Remover
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

const UsuarioPermissaoForm: React.FC<{
  usuarioPermissao: UsuarioPermissao | null;
  usuarios: Usuario[];
  permissoes: Permissao[];
  onSave: (up: UsuarioPermissao) => void;
  onCancel: () => void;
}> = ({ usuarioPermissao, usuarios, permissoes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<UsuarioPermissao>(
    usuarioPermissao || {
      usuario_id: 0,
      permissao_id: 0,
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            Associar Permissão a Usuário
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Selecione o usuário e a permissão que deseja associar.
        </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Selecione o Usuário
            </label>
            <select
                id="usuario_id"
                value={formData.usuario_id}
                onChange={e => setFormData({ ...formData, usuario_id: parseInt(e.target.value) })}
                required
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
                <option value="">Selecione um Usuário</option>
                {usuarios.map(usuario => (
                <option key={usuario.id} value={usuario.id}>
                    {usuario.nome}
                </option>
                ))}
            </select>
        </div>
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Selecione a Permissão
            </label>
            <select
                id="permissao_id"
                value={formData.permissao_id}
                onChange={e => setFormData({ ...formData, permissao_id: parseInt(e.target.value) })}
                required
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
                <option value="">Selecione uma Permissão</option>
                {permissoes.map(permissao => (
                <option key={permissao.id} value={permissao.id}>
                    {permissao.descricao}
                </option>
                ))}
            </select>
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

export default UsuarioPermissoes;
