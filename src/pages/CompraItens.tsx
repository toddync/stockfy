import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface CompraItem {
  id?: number; // ID is optional for new entries
  compra_id: number;
  produto_id: number;
  quantidade: number;
  preco_compra: number;
  desconto?: number;
  valor_total: number;
  tamanho?: string;
  cor?: string;
}

interface Compra {
  id: number;
  numero_pedido: string;
}

interface Produto {
  id: number;
  descricao: string;
}

const CompraItens: React.FC = () => {
  const [compraItens, setCompraItens] = useState<CompraItem[]>([]);
  const [compras, setCompras] = useState<Compra[]>([]);
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [compraItemEditando, setCompraItemEditando] = useState<CompraItem | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [compraItensResponse, comprasResponse, produtosResponse] = await Promise.all([
        fetch('http://localhost:3000/api/compra_itens'),
        fetch('http://localhost:3000/api/compras'),
        fetch('http://localhost:3000/api/produtos')
      ]);

      if (!compraItensResponse.ok) {
        throw new Error(`HTTP error! status: ${compraItensResponse.status} for compra_itens`);
      }
      if (!comprasResponse.ok) {
        throw new Error(`HTTP error! status: ${comprasResponse.status} for compras`);
      }
      if (!produtosResponse.ok) {
        throw new Error(`HTTP error! status: ${produtosResponse.status} for produtos`);
      }

      const compraItensData: CompraItem[] = await compraItensResponse.json();
      const comprasData: Compra[] = await comprasResponse.json();
      const produtosData: Produto[] = await produtosResponse.json();

      setCompraItens(compraItensData);
      setCompras(comprasData);
      setProdutos(produtosData);
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

  const salvarCompraItem = async (item: CompraItem) => {
    setError(null);
    try {
      let response;
      if (item.id) {
        // Update existing item
        response = await fetch(`http://localhost:3000/api/compra_itens/${item.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(item),
        });
      } else {
        // Create new item
        response = await fetch('http://localhost:3000/api/compra_itens', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(item),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados(); // Reload data after save
      setMostrarForm(false);
      setCompraItemEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar item de compra: ${message}`);
      console.error("Erro ao salvar item de compra:", e);
    }
  };

  const deletarCompraItem = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/compra_itens/${id}`, {
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
      setError(`Falha ao deletar item de compra: ${message}`);
      console.error("Erro ao deletar item de compra:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando itens de compra...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Itens de Compra</h1>
        <button 
          onClick={() => { setCompraItemEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Item de Compra
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setCompraItemEditando(null); }}>
        <CompraItemForm
          compraItem={compraItemEditando}
          compras={compras}
          produtos={produtos}
          onSave={salvarCompraItem}
          onCancel={() => { setMostrarForm(false); setCompraItemEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Compra</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Produto</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Quantidade</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Compra</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Valor Total</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Tamanho</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cor</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {compraItens.map(item => (
              <tr key={item.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{compras.find(c => c.id === item.compra_id)?.numero_pedido || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{produtos.find(p => p.id === item.produto_id)?.descricao || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.quantidade}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.preco_compra.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.valor_total.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.tamanho}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.cor}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setCompraItemEditando(item); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarCompraItem(item.id!)}
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
const CompraItemForm: React.FC<{ 
  compraItem: CompraItem | null; 
  compras: Compra[];
  produtos: Produto[];
  onSave: (item: CompraItem) => void; 
  onCancel: () => void 
}> = ({ compraItem, compras, produtos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<CompraItem>(compraItem || {
    compra_id: 0, produto_id: 0, quantidade: 0, preco_compra: 0, desconto: 0, valor_total: 0, tamanho: '', cor: ''
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{compraItem ? 'Editar' : 'Novo'} Item de Compra</h2>
      
      <div className="mb-4">
        <label htmlFor="compra_id" className="block text-gray-700 text-sm font-bold mb-2">Compra:</label>
        <select
          id="compra_id"
          value={formData.compra_id}
          onChange={e => setFormData({...formData, compra_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione uma Compra</option>
          {compras.map(compra => (
            <option key={compra.id} value={compra.id}>{compra.numero_pedido}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="produto_id" className="block text-gray-700 text-sm font-bold mb-2">Produto:</label>
        <select
          id="produto_id"
          value={formData.produto_id}
          onChange={e => setFormData({...formData, produto_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Produto</option>
          {produtos.map(produto => (
            <option key={produto.id} value={produto.id}>{produto.descricao}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="quantidade" className="block text-gray-700 text-sm font-bold mb-2">Quantidade:</label>
        <input
          type="number"
          id="quantidade"
          placeholder="Quantidade"
          value={formData.quantidade}
          onChange={e => setFormData({...formData, quantidade: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="preco_compra" className="block text-gray-700 text-sm font-bold mb-2">Preço Compra:</label>
        <input
          type="number"
          id="preco_compra"
          placeholder="Preço Compra"
          value={formData.preco_compra}
          onChange={e => setFormData({...formData, preco_compra: parseFloat(e.target.value)})}
          step="0.01"
          required
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
        <label htmlFor="valor_total" className="block text-gray-700 text-sm font-bold mb-2">Valor Total:</label>
        <input
          type="number"
          id="valor_total"
          placeholder="Valor Total"
          value={formData.valor_total}
          onChange={e => setFormData({...formData, valor_total: parseFloat(e.target.value)})}
          step="0.01"
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="tamanho" className="block text-gray-700 text-sm font-bold mb-2">Tamanho:</label>
        <input
          type="text"
          id="tamanho"
          placeholder="Tamanho"
          value={formData.tamanho || ''}
          onChange={e => setFormData({...formData, tamanho: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="cor" className="block text-gray-700 text-sm font-bold mb-2">Cor:</label>
        <input
          type="text"
          id="cor"
          placeholder="Cor"
          value={formData.cor || ''}
          onChange={e => setFormData({...formData, cor: e.target.value})}
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

export default CompraItens;