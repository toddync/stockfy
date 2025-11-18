import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

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

// Componente de formulário reutilizável
const EtiquetaForm: React.FC<{ 
  etiqueta: Etiqueta | null; 
  clientes: Cliente[];
  onSave: (etiqueta: Etiqueta) => void; 
  onCancel: () => void 
}> = ({ etiqueta, clientes, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Etiqueta>(etiqueta || {
    cliente_id: 0, codigo_vendedor: '', nome_vendedor: '', sobrenome: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{etiqueta ? 'Editar' : 'Nova'} Etiqueta</h2>
      
      <div className="mb-4">
        <label htmlFor="cliente_id" className="block text-gray-700 text-sm font-bold mb-2">Cliente:</label>
        <select
          id="cliente_id"
          value={formData.cliente_id}
          onChange={e => setFormData({...formData, cliente_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Cliente</option>
          {clientes.map(cliente => (
            <option key={cliente.id} value={cliente.id}>{cliente.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="codigo_vendedor" className="block text-gray-700 text-sm font-bold mb-2">Código Vendedor:</label>
        <input
          type="text"
          id="codigo_vendedor"
          placeholder="Código Vendedor"
          value={formData.codigo_vendedor || ''}
          onChange={e => setFormData({...formData, codigo_vendedor: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="nome_vendedor" className="block text-gray-700 text-sm font-bold mb-2">Nome Vendedor:</label>
        <input
          type="text"
          id="nome_vendedor"
          placeholder="Nome Vendedor"
          value={formData.nome_vendedor || ''}
          onChange={e => setFormData({...formData, nome_vendedor: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="sobrenome" className="block text-gray-700 text-sm font-bold mb-2">Sobrenome:</label>
        <input
          type="text"
          id="sobrenome"
          placeholder="Sobrenome"
          value={formData.sobrenome || ''}
          onChange={e => setFormData({...formData, sobrenome: e.target.value})}
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

export default Etiquetas;