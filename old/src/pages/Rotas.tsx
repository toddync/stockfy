import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta'; // Import Alerta

interface Praca {
  id: number;
  codigo: string;
  nome: string;
}

interface Rota {
  id?: number; // ID is optional for new entries
  codigo: string;
  bairro?: string;
  nome?: string;
  praca_id?: number; // NEW: Vinculo com Praça
}

const Rotas: React.FC = () => {
  const [rotas, setRotas] = useState<Rota[]>([]);
  const [pracas, setPracas] = useState<Praca[]>([]); // NEW: Lista de praças
  const [mostrarForm, setMostrarForm] = useState(false);
  const [rotaEditando, setRotaEditando] = useState<Rota | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null); // Add success state

  useEffect(() => {
    carregarRotas();
    carregarPracas(); // NEW: Carregar praças
  }, []);

  const carregarRotas = async () => {
    setLoading(true);
    setError(null);
    // Do not reset success here so message can persist after reload
    try {
      const response = await fetch('http://localhost:3000/api/rotas');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Rota[] = await response.json();
      setRotas(data);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar rotas: ${message}`);
      console.error("Erro ao carregar rotas:", e);
    } finally {
      setLoading(false);
    }
  };

  // NEW: Carregar praças
  const carregarPracas = async () => {
    try {
      const response = await fetch('http://localhost:3000/api/pracas');
      if (response.ok) {
        const data: Praca[] = await response.json();
        setPracas(data);
      }
    } catch (e) {
      console.error('Erro ao carregar praças:', e);
    }
  };

  const salvarRota = async (rota: Rota) => {
    setError(null);
    setSuccess(null); // Reset success message
    try {
      let response;
      if (rota.id) {
        // Update existing rota
        response = await fetch(`http://localhost:3000/api/rotas/${rota.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(rota),
        });
      } else {
        // Create new rota
        response = await fetch('http://localhost:3000/api/rotas', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(rota),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarRotas(); // Reload rotas after save
      setMostrarForm(false);
      setRotaEditando(null);
      setSuccess(`Rota ${rota.id ? 'atualizada' : 'criada'} com sucesso!`); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar rota: ${message}`);
      console.error("Erro ao salvar rota:", e);
    }
  };

  const deletarRota = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null); // Reset success message
    try {
      const response = await fetch(`http://localhost:3000/api/rotas/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarRotas(); // Reload rotas after delete
      setSuccess("Rota excluída com sucesso!"); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar rota: ${message}`);
      console.error("Erro ao deletar rota:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando rotas...</div>;
  }

  // Error display from the initial load should still show.
  // The Alerta component will handle subsequent errors from save/delete.

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {/* Display Alerta for success and error messages */}
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Rotas</h1>
        <button 
          onClick={() => { setRotaEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Rota
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setRotaEditando(null); }}>
        <RotaForm
          rota={rotaEditando}
          pracas={pracas}
          onSave={salvarRota}
          onCancel={() => { setMostrarForm(false); setRotaEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Código</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Praça</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Bairro</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nome</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {rotas.map(rota => (
              <tr key={rota.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{rota.codigo}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{pracas.find(p => p.id === rota.praca_id)?.nome || '-'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{rota.bairro}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{rota.nome}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setRotaEditando(rota); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarRota(rota.id!)}
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

const RotaForm: React.FC<{
  rota: Rota | null;
  pracas: Praca[];
  onSave: (rota: Rota) => void;
  onCancel: () => void;
}> = ({ rota, pracas, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Rota>(
    rota || {
      codigo: '',
      bairro: '',
      nome: '',
      praca_id: undefined,
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            {rota ? 'Editar' : 'Nova'} Rota
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {rota ? 'atualizar a' : 'criar uma nova'} rota.
        </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Praça e Código
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <select
                    value={formData.praca_id || ''}
                    onChange={e => setFormData({ ...formData, praca_id: e.target.value ? parseInt(e.target.value) : undefined })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                    <option value="">Selecione uma Praça</option>
                    {pracas.map(praca => (
                        <option key={praca.id} value={praca.id}>{praca.codigo} - {praca.nome}</option>
                    ))}
                </select>
                <input
                    type="text"
                    placeholder="Código da Rota"
                    value={formData.codigo}
                    onChange={e => setFormData({ ...formData, codigo: e.target.value })}
                    required
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>

        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Informações da Rota
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input
                    type="text"
                    placeholder="Nome"
                    value={formData.nome || ''}
                    onChange={e => setFormData({ ...formData, nome: e.target.value })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="text"
                    placeholder="Bairro"
                    value={formData.bairro || ''}
                    onChange={e => setFormData({ ...formData, bairro: e.target.value })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>

        <div>
            <label htmlFor="bairro" className="block text-xl font-semibold text-gray-700 mb-2">
                2. Bairro
            </label>
            <input
                type="text"
                id="bairro"
                placeholder="Bairro"
                value={formData.bairro || ''}
                onChange={e => setFormData({ ...formData, bairro: e.target.value })}
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
  
  export default Rotas;