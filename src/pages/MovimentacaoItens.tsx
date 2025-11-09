import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';

interface MovimentacaoItem {
  id?: number; // ID is optional for new entries
  movimentacao_id: number;
  produto_id: number;
  quantidade: number;
  preco_custo?: number;
}

interface MovimentacaoEstoque {
  id: number;
  numero_documento: string;
  tipo_movimentacao: string;
}

interface Produto {
  id: number;
  descricao: string;
}

const MovimentacaoItens: React.FC = () => {
  const [movimentacaoItens, setMovimentacaoItens] = useState<MovimentacaoItem[]>([]);
  const [movimentacoes, setMovimentacoes] = useState<MovimentacaoEstoque[]>([]);
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [movimentacaoItemEditando, setMovimentacaoItemEditando] = useState<MovimentacaoItem | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, []);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const [movimentacaoItensResponse, movimentacoesResponse, produtosResponse] = await Promise.all([
        fetch('http://localhost:3000/api/movimentacao_itens'),
        fetch('http://localhost:3000/api/movimentacoes_estoque'),
        fetch('http://localhost:3000/api/produtos')
      ]);

      if (!movimentacaoItensResponse.ok) {
        throw new Error(`HTTP error! status: ${movimentacaoItensResponse.status} for movimentacao_itens`);
      }
      if (!movimentacoesResponse.ok) {
        throw new Error(`HTTP error! status: ${movimentacoesResponse.status} for movimentacoes_estoque`);
      }
      if (!produtosResponse.ok) {
        throw new Error(`HTTP error! status: ${produtosResponse.status} for produtos`);
      }

      const movimentacaoItensData: MovimentacaoItem[] = await movimentacaoItensResponse.json();
      const movimentacoesData: MovimentacaoEstoque[] = await movimentacoesResponse.json();
      const produtosData: Produto[] = await produtosResponse.json();

      setMovimentacaoItens(movimentacaoItensData);
      setMovimentacoes(movimentacoesData);
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

  const salvarMovimentacaoItem = async (item: MovimentacaoItem) => {
    setError(null);
    try {
      let response;
      if (item.id) {
        // Update existing item
        response = await fetch(`http://localhost:3000/api/movimentacao_itens/${item.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(item),
        });
      } else {
        // Create new item
        response = await fetch('http://localhost:3000/api/movimentacao_itens', {
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
      setMovimentacaoItemEditando(null);
    } catch (e: unknown) { // Changed from any to unknown
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar item de movimentação: ${message}`);
      console.error("Erro ao salvar item de movimentação:", e);
    }
  };

  const deletarMovimentacaoItem = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/movimentacao_itens/${id}`, {
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
      setError(`Falha ao deletar item de movimentação: ${message}`);
      console.error("Erro ao deletar item de movimentação:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando itens de movimentação...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Itens de Movimentação</h1>
        <button 
          onClick={() => { setMovimentacaoItemEditando(null); setMostrarForm(true); }}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          + Novo Item de Movimentação
        </button>
      </div>

      <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setMovimentacaoItemEditando(null); }}>
        <MovimentacaoItemForm
          movimentacaoItem={movimentacaoItemEditando}
          movimentacoes={movimentacoes}
          produtos={produtos}
          onSave={salvarMovimentacaoItem}
          onCancel={() => { setMostrarForm(false); setMovimentacaoItemEditando(null); }}
        />
      </Modal>

      <div className="table-container overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Movimentação</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Produto</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Quantidade</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Custo</th>
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
            </tr>
          </thead>
          <tbody>
            {movimentacaoItens.map(item => (
              <tr key={item.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{movimentacoes.find(m => m.id === item.movimentacao_id)?.numero_documento || 'N/A'} ({movimentacoes.find(m => m.id === item.movimentacao_id)?.tipo_movimentacao})</td>
                <td className="py-3 px-4 text-sm text-gray-700">{produtos.find(p => p.id === item.produto_id)?.descricao || 'N/A'}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.quantidade}</td>
                <td className="py-3 px-4 text-sm text-gray-700">{item.preco_custo?.toFixed(2)}</td>
                <td className="py-3 px-4 text-sm">
                  <button 
                    onClick={() => { setMovimentacaoItemEditando(item); setMostrarForm(true); }}
                    className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                  >
                    Editar
                  </button>
                  <button 
                    onClick={() => deletarMovimentacaoItem(item.id!)}
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
const MovimentacaoItemForm: React.FC<{ 
  movimentacaoItem: MovimentacaoItem | null; 
  movimentacoes: MovimentacaoEstoque[];
  produtos: Produto[];
  onSave: (item: MovimentacaoItem) => void; 
  onCancel: () => void 
}> = ({ movimentacaoItem, movimentacoes, produtos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<MovimentacaoItem>(movimentacaoItem || {
    movimentacao_id: 0, produto_id: 0, quantidade: 0, preco_custo: 0
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{movimentacaoItem ? 'Editar' : 'Novo'} Item de Movimentação</h2>
      
      <div className="mb-4">
        <label htmlFor="movimentacao_id" className="block text-gray-700 text-sm font-bold mb-2">Movimentação:</label>
        <select
          id="movimentacao_id"
          value={formData.movimentacao_id}
          onChange={e => setFormData({...formData, movimentacao_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione uma Movimentação</option>
          {movimentacoes.map(mov => (
            <option key={mov.id} value={mov.id}>{mov.numero_documento} ({mov.tipo_movimentacao})</option>
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

export default MovimentacaoItens;