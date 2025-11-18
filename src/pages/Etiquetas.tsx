

import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta'; // Import Alerta

interface Etiqueta {
  id?: number; // ID is optional for new entries
  cliente_id: number;
  codigo_vendedor?: string;
  nome_vendedor?: string;
  sobrenome?: string;
}

interface Cliente {
  id: number;
  nome: string;
}

const Etiquetas: React.FC = () => {
  const [etiquetas, setEtiquetas] = useState<Etiqueta[]>([]);
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [etiquetaEditando, setEtiquetaEditando] = useState<Etiqueta | null>(null);
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
      const [etiquetasResponse, clientesResponse] = await Promise.all([
        fetch('http://localhost:3000/api/etiquetas'),
        fetch('http://localhost:3000/api/clientes')
      ]);

      if (!etiquetasResponse.ok) {
        throw new Error(`HTTP error! status: ${etiquetasResponse.status} for etiquetas`);
      }
      if (!clientesResponse.ok) {
        throw new Error(`HTTP error! status: ${clientesResponse.status} for clientes`);
      }

      const etiquetasData: Etiqueta[] = await etiquetasResponse.json();
      const clientesData: Cliente[] = await clientesResponse.json();

      setEtiquetas(etiquetasData);
      setClientes(clientesData);
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

  const salvarEtiqueta = async (etiqueta: Etiqueta) => {
    setError(null);
    setSuccess(null); // Reset success message
    try {
      let response;
      if (etiqueta.id) {
        // Update existing etiqueta
        response = await fetch(`http://localhost:3000/api/etiquetas/${etiqueta.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(etiqueta),
        });
      } else {
        // Create new etiqueta
        response = await fetch('http://localhost:3000/api/etiquetas', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(etiqueta),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setEtiquetaEditando(null);
      setSuccess(`Etiqueta ${etiqueta.id ? 'atualizada' : 'criada'} com sucesso!`); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar etiqueta: ${message}`);
      console.error("Erro ao salvar etiqueta:", e);
    }
  };

  const deletarEtiqueta = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    setSuccess(null); // Reset success message
    try {
      const response = await fetch(`http://localhost:3000/api/etiquetas/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after delete
      setSuccess("Etiqueta excluída com sucesso!"); // Set success message
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar etiqueta: ${message}`);
      console.error("Erro ao deletar etiqueta:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando etiquetas...</div>;
  }

  // Error display from the initial load should still show.
  // The Alerta component will handle subsequent errors from save/delete.

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {/* Display Alerta for success and error messages */}
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Etiquetas</h1>
        <button 
          onClick={() => { setEtiquetaEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Etiqueta
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setEtiquetaEditando(null); }}>
        <EtiquetaForm
          etiqueta={etiquetaEditando}
          clientes={clientes}
          onSave={salvarEtiqueta}
          onCancel={() => { setMostrarForm(false); setEtiquetaEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cliente</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cód. Vendedor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nome Vendedor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Sobrenome</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {etiquetas.map(etiqueta => (
              <tr key={etiqueta.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{clientes.find(c => c.id === etiqueta.cliente_id)?.nome || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{etiqueta.codigo_vendedor}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{etiqueta.nome_vendedor}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{etiqueta.sobrenome}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setEtiquetaEditando(etiqueta); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarEtiqueta(etiqueta.id!)}
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

const EtiquetaForm: React.FC<{
  etiqueta: Etiqueta | null;
  clientes: Cliente[];
  onSave: (etiqueta: Etiqueta) => void;
  onCancel: () => void;
}> = ({ etiqueta, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Etiqueta>(
    etiqueta || {
      cliente_id: 0,
      codigo_vendedor: '',
      nome_vendedor: '',
      sobrenome: '',
    }
  );

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
            {etiqueta ? 'Editar' : 'Nova'} Etiqueta
        </h2>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para {etiqueta ? 'atualizar a' : 'criar uma nova'} etiqueta.
        </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                1. Selecione o Cliente
            </label>
            <select
                id="cliente_id"
                value={formData.cliente_id}
                onChange={e => setFormData({ ...formData, cliente_id: parseInt(e.target.value) })}
                required
                className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
                <option value="">Selecione um Cliente</option>
                {clientes.map(cliente => (
                <option key={cliente.id} value={cliente.id}>
                    {cliente.nome}
                </option>
                ))}
            </select>
        </div>

        <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">
                2. Informações do Vendedor
            </label>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input
                    type="text"
                    placeholder="Código do Vendedor"
                    value={formData.codigo_vendedor || ''}
                    onChange={e => setFormData({ ...formData, codigo_vendedor: e.target.value })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
                <input
                    type="text"
                    placeholder="Nome do Vendedor"
                    value={formData.nome_vendedor || ''}
                    onChange={e => setFormData({ ...formData, nome_vendedor: e.target.value })}
                    className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
            </div>
        </div>

        <div>
            <label htmlFor="sobrenome" className="block text-xl font-semibold text-gray-700 mb-2">
                3. Sobrenome
            </label>
            <input
                type="text"
                id="sobrenome"
                placeholder="Sobrenome (opcional)"
                value={formData.sobrenome || ''}
                onChange={e => setFormData({ ...formData, sobrenome: e.target.value })}
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

export default Etiquetas;