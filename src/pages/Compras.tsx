import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface Compra {
  id?: number; // ID is optional for new entries
  numero_pedido: string;
  tipo_pedido?: string;
  fornecedor_id: number;
  data_pedido: string; // DATE type
  data_entrega?: string; // DATE type
  data_nota?: string; // DATE type
  tipo_nota?: string;
  numero_nota?: string;
  valor_total_pedido?: number;
  valor_total_nota?: number;
  desconto?: number;
  frete?: number;
  situacao?: string;
  parcelas?: string;
  observacoes?: string;
}

interface Fornecedor {
  id: number;
  razao_social: string;
}

const Compras: React.FC = () => {
  const [compras, setCompras] = useState<Compra[]>([]);
  const [fornecedores, setFornecedores] = useState<Fornecedor[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [compraEditando, setCompraEditando] = useState<Compra | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [comprasResponse, fornecedoresResponse] = await Promise.all([
        fetch('http://localhost:3000/api/compras'),
        fetch('http://localhost:3000/api/fornecedores')
      ]);

      if (!comprasResponse.ok) {
        throw new Error(`HTTP error! status: ${comprasResponse.status} for compras`);
      }
      if (!fornecedoresResponse.ok) {
        throw new Error(`HTTP error! status: ${fornecedoresResponse.status} for fornecedores`);
      }

      const comprasData: Compra[] = await comprasResponse.json();
      const fornecedoresData: Fornecedor[] = await fornecedoresResponse.json();

      setCompras(comprasData);
      setFornecedores(fornecedoresData);
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

  const salvarCompra = async (compra: Compra) => {
    setError(null);
    try {
      let response;
      if (compra.id) {
        // Update existing compra
        response = await fetch(`http://localhost:3000/api/compras/${compra.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(compra),
        });
      } else {
        // Create new compra
        response = await fetch('http://localhost:3000/api/compras', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(compra),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setCompraEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar compra: ${message}`);
      console.error("Erro ao salvar compra:", e);
    }
  };

  const deletarCompra = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/compras/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after delete
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar compra: ${message}`);
      console.error("Erro ao deletar compra:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando compras...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Compras</h1>
        <button 
          onClick={() => { setCompraEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Nova Compra
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setCompraEditando(null); }}>
        <CompraForm
          compra={compraEditando}
          fornecedores={fornecedores}
          onSave={salvarCompra}
          onCancel={() => { setMostrarForm(false); setCompraEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Nº Pedido</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Fornecedor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Data Pedido</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Data Entrega</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Valor Total</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Situação</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {compras.map(compra => (
              <tr key={compra.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{compra.numero_pedido}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{fornecedores.find(f => f.id === compra.fornecedor_id)?.razao_social || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{new Date(compra.data_pedido).toLocaleDateString()}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{compra.data_entrega ? new Date(compra.data_entrega).toLocaleDateString() : 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{compra.valor_total_pedido?.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">
                  <span className={`px-2 py-1 rounded-full text-xs font-semibold ${
                    compra.situacao === 'Concluída' ? 'bg-green-100 text-green-800' :
                    compra.situacao === 'Pendente' ? 'bg-yellow-100 text-yellow-800' :
                    'bg-gray-100 text-gray-800'
                  }`}>
                    {compra.situacao}
                  </span>
                </td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setCompraEditando(compra); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarCompra(compra.id!)}
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
const CompraForm: React.FC<{ 
  compra: Compra | null; 
  fornecedores: Fornecedor[];
  onSave: (compra: Compra) => void; 
  onCancel: () => void 
}> = ({ compra, fornecedores, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Compra>(compra || {
    numero_pedido: '', fornecedor_id: 0, data_pedido: new Date().toISOString().split('T')[0], data_entrega: '', valor_total_pedido: 0, situacao: 'Pendente'
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{compra ? 'Editar' : 'Nova'} Compra</h2>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="mb-4">
          <label htmlFor="numero_pedido" className="block text-gray-700 text-sm font-bold mb-2">Número do Pedido:</label>
          <input
            type="text"
            id="numero_pedido"
            placeholder="Número do Pedido"
            value={formData.numero_pedido}
            onChange={e => setFormData({...formData, numero_pedido: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="tipo_pedido" className="block text-gray-700 text-sm font-bold mb-2">Tipo de Pedido:</label>
          <input
            type="text"
            id="tipo_pedido"
            placeholder="Tipo de Pedido"
            value={formData.tipo_pedido || ''}
            onChange={e => setFormData({...formData, tipo_pedido: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="fornecedor_id" className="block text-gray-700 text-sm font-bold mb-2">Fornecedor:</label>
          <select
            id="fornecedor_id"
            value={formData.fornecedor_id}
            onChange={e => setFormData({...formData, fornecedor_id: parseInt(e.target.value)})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Selecione um Fornecedor</option>
            {fornecedores.map(fornecedor => (
              <option key={fornecedor.id} value={fornecedor.id}>{fornecedor.razao_social}</option>
            ))}
          </select>
        </div>

        <div className="mb-4">
          <label htmlFor="data_pedido" className="block text-gray-700 text-sm font-bold mb-2">Data do Pedido:</label>
          <input
            type="date"
            id="data_pedido"
            value={formData.data_pedido}
            onChange={e => setFormData({...formData, data_pedido: e.target.value})}
            required
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="data_entrega" className="block text-gray-700 text-sm font-bold mb-2">Data de Entrega:</label>
          <input
            type="date"
            id="data_entrega"
            value={formData.data_entrega || ''}
            onChange={e => setFormData({...formData, data_entrega: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="data_nota" className="block text-gray-700 text-sm font-bold mb-2">Data da Nota:</label>
          <input
            type="date"
            id="data_nota"
            value={formData.data_nota || ''}
            onChange={e => setFormData({...formData, data_nota: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="tipo_nota" className="block text-gray-700 text-sm font-bold mb-2">Tipo de Nota:</label>
          <input
            type="text"
            id="tipo_nota"
            placeholder="Tipo de Nota"
            value={formData.tipo_nota || ''}
            onChange={e => setFormData({...formData, tipo_nota: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="numero_nota" className="block text-gray-700 text-sm font-bold mb-2">Número da Nota:</label>
          <input
            type="text"
            id="numero_nota"
            placeholder="Número da Nota"
            value={formData.numero_nota || ''}
            onChange={e => setFormData({...formData, numero_nota: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="valor_total_pedido" className="block text-gray-700 text-sm font-bold mb-2">Valor Total do Pedido:</label>
          <input
            type="number"
            id="valor_total_pedido"
            placeholder="Valor Total do Pedido"
            value={formData.valor_total_pedido}
            onChange={e => setFormData({...formData, valor_total_pedido: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="valor_total_nota" className="block text-gray-700 text-sm font-bold mb-2">Valor Total da Nota:</label>
          <input
            type="number"
            id="valor_total_nota"
            placeholder="Valor Total da Nota"
            value={formData.valor_total_nota}
            onChange={e => setFormData({...formData, valor_total_nota: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="desconto" className="block text-gray-700 text-sm font-bold mb-2">Desconto:</label>
          <input
            type="number"
            id="desconto"
            placeholder="Desconto"
            value={formData.desconto}
            onChange={e => setFormData({...formData, desconto: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="frete" className="block text-gray-700 text-sm font-bold mb-2">Frete:</label>
          <input
            type="number"
            id="frete"
            placeholder="Frete"
            value={formData.frete}
            onChange={e => setFormData({...formData, frete: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="situacao" className="block text-gray-700 text-sm font-bold mb-2">Situação:</label>
          <input
            type="text"
            id="situacao"
            placeholder="Situação"
            value={formData.situacao || ''}
            onChange={e => setFormData({...formData, situacao: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4">
          <label htmlFor="parcelas" className="block text-gray-700 text-sm font-bold mb-2">Parcelas:</label>
          <input
            type="text"
            id="parcelas"
            placeholder="Parcelas"
            value={formData.parcelas || ''}
            onChange={e => setFormData({...formData, parcelas: e.target.value})}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <div className="mb-4 col-span-full">
          <label htmlFor="observacoes" className="block text-gray-700 text-sm font-bold mb-2">Observações:</label>
          <textarea
            id="observacoes"
            placeholder="Observações"
            value={formData.observacoes || ''}
            onChange={e => setFormData({...formData, observacoes: e.target.value})}
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

export default Compras;