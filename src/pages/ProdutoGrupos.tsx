import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';

interface ProdutoGrupo {
  id?: number; // ID is optional for new entries
  codigo: string;
  descricao: string;
}

const ProdutoGrupos: React.FC = () => {
  const [grupos, setGrupos] = useState<ProdutoGrupo[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [grupoEditando, setGrupoEditando] = useState<ProdutoGrupo | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    carregarGrupos();
  }, []);

  const carregarGrupos = async () => {
    setLoading(true);
    // Do not reset success/error here
    try {
      const response = await fetch('http://localhost:3000/api/produto-grupos');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: ProdutoGrupo[] = await response.json();
      setGrupos(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar grupos de produtos: ${message}`);
      console.error("Erro ao carregar grupos de produtos:", e);
    } finally {
      setLoading(false);
    }
  };

  const salvarGrupo = async (grupo: ProdutoGrupo) => {
    setError(null);
    setSuccess(null);
    try {
      let response;
      if (grupo.id) {
        // Update existing grupo
        response = await fetch(`http://localhost:3000/api/produto-grupos/${grupo.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(grupo),
        });
      } else {
        // Create new grupo
        response = await fetch('http://localhost:3000/api/produto-grupos', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(grupo),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarGrupos(); // Reload groups after save
      setMostrarForm(false);
      setGrupoEditando(null);
      setSuccess(`Grupo ${grupo.id ? 'atualizado' : 'criado'} com sucesso!`);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar grupo de produto: ${message}`);
      console.error("Erro ao salvar grupo de produto:", e);
    }
  };

  const deletarGrupo = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/produto-grupos/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarGrupos(); // Reload groups after delete
      setSuccess("Grupo excluído com sucesso!");
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar grupo de produto: ${message}`);
      console.error("Erro ao deletar grupo de produto:", e);
    }
  };

  if (loading && grupos.length === 0) {
    return <div className="text-center p-6">Carregando grupos de produtos...</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Grupos de Produtos</h1>
        <button 
          onClick={() => { setGrupoEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Grupo
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setGrupoEditando(null); }}>
        <ProdutoGrupoForm
          grupo={grupoEditando}
          onSave={salvarGrupo}
          onCancel={() => { setMostrarForm(false); setGrupoEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Código</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Descrição</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {grupos.map(grupo => (
              <tr key={grupo.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{grupo.codigo}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{grupo.descricao}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setGrupoEditando(grupo); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarGrupo(grupo.id!)}
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

const ProdutoGrupoForm: React.FC<{
  grupo: ProdutoGrupo | null;
  onSave: (grupo: ProdutoGrupo) => void;
  onCancel: () => void;
}> = ({ grupo, onSave, onCancel }) => {
  const [formData, setFormData] = useState<ProdutoGrupo>(
    grupo || {
      codigo: '',
      descricao: '',
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            {grupo ? 'Editar' : 'Novo'} Grupo de Produto
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {grupo ? 'atualizar o' : 'criar um novo'} grupo de produto.
        </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Código do Grupo
            </label>
            <input
                type="text"
                placeholder="Código"
                value={formData.codigo}
                onChange={e => setFormData({ ...formData, codigo: e.target.value })}
                required
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
        </div>

        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Descrição do Grupo
            </label>
            <input
                type="text"
                placeholder="Descrição"
                value={formData.descricao}
                onChange={e => setFormData({ ...formData, descricao: e.target.value })}
                required
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
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

export default ProdutoGrupos;