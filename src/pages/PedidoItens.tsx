import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface PedidoItem {
  id?: number; // ID is optional for new entries
  pedido_id: number;
  produto_id: number;
  quantidade_saida: number;
  quantidade_retorno: number;
  preco_custo?: number;
  preco_venda: number;
}

interface Pedido {
  id: number;
  numero_pedido: string;
}

interface Produto {
  id: number;
  descricao: string;
}

const PedidoItens: React.FC = () => {
  const [pedidoItens, setPedidoItens] = useState<PedidoItem[]>([]);
  const [pedidos, setPedidos] = useState<Pedido[]>([]);
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [pedidoItemEditando, setPedidoItemEditando] = useState<PedidoItem | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [pedidoItensResponse, pedidosResponse, produtosResponse] = await Promise.all([
        fetch('http://localhost:3000/api/pedido_itens'),
        fetch('http://localhost:3000/api/pedidos'),
        fetch('http://localhost:3000/api/produtos')
      ]);

      if (!pedidoItensResponse.ok) {
        throw new Error(`HTTP error! status: ${pedidoItensResponse.status} for pedido_itens`);
      }
      if (!pedidosResponse.ok) {
        throw new Error(`HTTP error! status: ${pedidosResponse.status} for pedidos`);
      }
      if (!produtosResponse.ok) {
        throw new Error(`HTTP error! status: ${produtosResponse.status} for produtos`);
      }

      const pedidoItensData: PedidoItem[] = await pedidoItensResponse.json();
      const pedidosData: Pedido[] = await pedidosResponse.json();
      const produtosData: Produto[] = await produtosResponse.json();

      setPedidoItens(pedidoItensData);
      setPedidos(pedidosData);
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

  const salvarPedidoItem = async (item: PedidoItem) => {
    setError(null);
    try {
      let response;
      if (item.id) {
        // Update existing item
        response = await fetch(`http://localhost:3000/api/pedido_itens/${item.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(item),
        });
      } else {
        // Create new item
        response = await fetch('http://localhost:3000/api/pedido_itens', {
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
      setPedidoItemEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar item de pedido: ${message}`);
      console.error("Erro ao salvar item de pedido:", e);
    }
  };

  const deletarPedidoItem = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/pedido_itens/${id}`, {
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
      setError(`Falha ao deletar item de pedido: ${message}`);
      console.error("Erro ao deletar item de pedido:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando itens de pedido...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Itens de Pedido</h1>
        <button 
          onClick={() => { setPedidoItemEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Item de Pedido
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setPedidoItemEditando(null); }}>
        <PedidoItemForm
          pedidoItem={pedidoItemEditando}
          pedidos={pedidos}
          produtos={produtos}
          onSave={salvarPedidoItem}
          onCancel={() => { setMostrarForm(false); setPedidoItemEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Pedido</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Produto</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Qtd Saída</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Qtd Retorno</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Custo</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Venda</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {pedidoItens.map(item => (
              <tr key={item.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{pedidos.find(p => p.id === item.pedido_id)?.numero_pedido || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{produtos.find(p => p.id === item.produto_id)?.descricao || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.quantidade_saida}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.quantidade_retorno}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.preco_custo?.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.preco_venda.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setPedidoItemEditando(item); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarPedidoItem(item.id!)}
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
const PedidoItemForm: React.FC<{ 
  pedidoItem: PedidoItem | null; 
  pedidos: Pedido[];
  produtos: Produto[];
  onSave: (item: PedidoItem) => void; 
  onCancel: () => void 
}> = ({ pedidoItem, pedidos, produtos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<PedidoItem>(pedidoItem || {
    pedido_id: 0, produto_id: 0, quantidade_saida: 0, quantidade_retorno: 0, preco_custo: 0, preco_venda: 0
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{pedidoItem ? 'Editar' : 'Novo'} Item de Pedido</h2>
      
      <div className="mb-4">
        <label htmlFor="pedido_id" className="block text-gray-700 text-sm font-bold mb-2">Pedido:</label>
        <select
          id="pedido_id"
          value={formData.pedido_id}
          onChange={e => setFormData({...formData, pedido_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Pedido</option>
          {pedidos.map(pedido => (
            <option key={pedido.id} value={pedido.id}>{pedido.numero_pedido}</option>
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
        <label htmlFor="quantidade_saida" className="block text-gray-700 text-sm font-bold mb-2">Quantidade Saída:</label>
        <input
          type="number"
          id="quantidade_saida"
          placeholder="Quantidade Saída"
          value={formData.quantidade_saida}
          onChange={e => setFormData({...formData, quantidade_saida: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="quantidade_retorno" className="block text-gray-700 text-sm font-bold mb-2">Quantidade Retorno:</label>
        <input
          type="number"
          id="quantidade_retorno"
          placeholder="Quantidade Retorno"
          value={formData.quantidade_retorno}
          onChange={e => setFormData({...formData, quantidade_retorno: parseInt(e.target.value)})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="preco_custo" className="block text-gray-700 text-sm font-bold mb-2">Preço Custo:</label>
        <input
          type="number"
          id="preco_custo"
          placeholder="Preço Custo"
          value={formData.preco_custo}
          onChange={e => setFormData({...formData, preco_custo: parseFloat(e.target.value)})}
          step="0.01"
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="preco_venda" className="block text-gray-700 text-sm font-bold mb-2">Preço Venda:</label>
        <input
          type="number"
          id="preco_venda"
          placeholder="Preço Venda"
          value={formData.preco_venda}
          onChange={e => setFormData({...formData, preco_venda: parseFloat(e.target.value)})}
          step="0.01"
          required
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

export default PedidoItens;