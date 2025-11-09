import React, { useState, useEffect } from 'react';
import Modal from '../components/Modal';
import FiltroRoupasAvancado from '../components/FiltroRoupasAvancado';
import GradeTamanhosCores from '../components/GradeTamanhosCores';
import CalculadoraMargem from '../components/CalculadoraMargem';
import GerenciadorTags from '../components/GerenciadorTags'; // Import the new component

interface Tag {
  id: number;
  nome: string;
}

interface Produto {
  id?: number; // ID is optional for new entries
  codigo: string;
  descricao: string;
  grupo_id: number;
  preco_custo?: number;
  preco_venda: number;
  estoque_atual?: number;
  tabela_preco?: string;
  preco_minimo?: number;
  data_atualizacao?: string; // TIMESTAMP type
  tags?: Tag[]; // Add tags to Produto interface
}

interface ProdutoGrupo {
  id: number;
  codigo: string;
  descricao: string;
}

const Produtos: React.FC = () => {
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [grupos, setGrupos] = useState<ProdutoGrupo[]>([]);
  const [mostrarForm, setMostrarForm] = useState(false);
  const [produtoEditando, setProdutoEditando] = useState<Produto | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [filters, setFilters] = useState({});
  const [selectedProductIdForGrade, setSelectedProductIdForGrade] = useState<number | null>(null);
  const [showProductComparator, setShowProductComparator] = useState(false);
  const [showABCAnalysis, setShowABCAnalysis] = useState(false);
  const [showMassEditor, setShowMassEditor] = useState(false);

  useEffect(() => {
    carregarDados();
  }, [filters]);

  const carregarDados = async () => {
    setLoading(true);
    setError(null);
    try {
      const queryParams = new URLSearchParams(filters).toString();
      const produtosUrl = `http://localhost:3000/api/produtos${queryParams ? `?${queryParams}` : ''}`;

      const [produtosResponse, gruposResponse] = await Promise.all([
        fetch(produtosUrl),
        fetch('http://localhost:3000/api/produto_grupos')
      ]);

      if (!produtosResponse.ok) {
        throw new Error(`HTTP error! status: ${produtosResponse.status} for produtos`);
      }
      if (!gruposResponse.ok) {
        throw new Error(`HTTP error! status: ${gruposResponse.status} for produto_grupos`);
      }

      const produtosData: Produto[] = await produtosResponse.json();
      const gruposData: ProdutoGrupo[] = await gruposResponse.json();

      setProdutos(produtosData);
      setGrupos(gruposData);
    } catch (e: unknown) {
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

  const handleFilterChange = (newFilters: any) => {
    setFilters(newFilters);
  };

  const salvarProduto = async (produto: Produto) => {
    setError(null);
    try {
      let response;
      if (produto.id) {
        response = await fetch(`http://localhost:3000/api/produtos/${produto.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(produto),
        });
      } else {
        response = await fetch('http://localhost:3000/api/produtos', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(produto),
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados();
      setMostrarForm(false);
      setProdutoEditando(null);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar produto: ${message}`);
      console.error("Erro ao salvar produto:", e);
    }
  };

  const deletarProduto = async (id: number) => {
    if (!window.confirm('Confirmar exclusão?')) {
      return;
    }
    setError(null);
    try {
      const response = await fetch(`http://localhost:3000/api/produtos/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados();
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar produto: ${message}`);
      console.error("Erro ao deletar produto:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando produtos...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (selectedProductIdForGrade) {
    return (
      <div className="page-container p-6 bg-white shadow-md rounded-lg">
        <button 
          onClick={() => setSelectedProductIdForGrade(null)}
          className="mb-4 bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          ← Voltar para Produtos
        </button>
        <GradeTamanhosCores productId={selectedProductIdForGrade} />
      </div>
    );
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Gerenciar Produtos</h1>
        <div className="flex space-x-4">
          <button 
            onClick={() => { setShowProductComparator(false); setShowABCAnalysis(false); setShowMassEditor(!showMassEditor); }}
            className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showMassEditor ? 'Voltar para Produtos' : 'Editor em Massa'}
          </button>
          <button 
            onClick={() => { setShowProductComparator(false); setShowMassEditor(false); setShowABCAnalysis(!showABCAnalysis); }}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showABCAnalysis ? 'Voltar para Produtos' : 'Análise ABC'}
          </button>
          <button 
            onClick={() => { setShowABCAnalysis(false); setShowMassEditor(false); setShowProductComparator(!showProductComparator); }}
            className="bg-purple-500 hover:bg-purple-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showProductComparator ? 'Voltar para Produtos' : 'Comparar Produtos'}
          </button>
          <button 
            onClick={() => { setProdutoEditando(null); setMostrarForm(true); setShowProductComparator(false); setShowABCAnalysis(false); setShowMassEditor(false); }}
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            + Novo Produto
          </button>
        </div>
      </div>

      {showProductComparator ? (
        <ComparadorProdutos />
      ) : showABCAnalysis ? (
        <ClassificadorABC />
      ) : showMassEditor ? (
        <EditorEmMassa />
      ) : (
        <>
          <FiltroRoupasAvancado onFilterChange={handleFilterChange} />

          <Modal isOpen={mostrarForm} onClose={() => { setMostrarForm(false); setProdutoEditando(null); }}>
            <ProdutoForm
              produto={produtoEditando}
              grupos={grupos}
              onSave={salvarProduto}
              onCancel={() => { setMostrarForm(false); setProdutoEditando(null); }}
            />
          </Modal>

          <div className="table-container overflow-x-auto">
            <table className="min-w-full bg-white border border-gray-200">
              <thead>
                <tr className="bg-gray-100 border-b">
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Código</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Descrição</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Grupo</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Custo</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Venda</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Estoque Atual</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
                </tr>
              </thead>
              <tbody>
                {produtos.map(produto => (
                  <tr key={produto.id} className="border-b hover:bg-gray-50">
                    <td className="py-3 px-4 text-sm text-gray-700">{produto.codigo}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">{produto.descricao}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">{grupos.find(g => g.id === produto.grupo_id)?.descricao || 'N/A'}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">{produto.preco_custo?.toFixed(2)}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">{produto.preco_venda.toFixed(2)}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">{produto.estoque_atual}</td>
                    <td className="py-3 px-4 text-sm">
                      <button 
                        onClick={() => { setSelectedProductIdForGrade(produto.id!); }}
                        className="bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                      >
                        Ver Grade
                      </button>
                      <button 
                        onClick={() => { setProdutoEditando(produto); setMostrarForm(true); }}
                        className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                      >
                        Editar
                      </button>
                      <button 
                        onClick={() => deletarProduto(produto.id!)}
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
        </>
      )}
    </div>
  );
};

// Componente de formulário reutilizável
const ProdutoForm: React.FC<{
  produto: Produto | null; 
  grupos: ProdutoGrupo[];
  onSave: (produto: Produto) => void; 
  onCancel: () => void 
}> = ({ produto, grupos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Produto>(produto || {
    codigo: '', descricao: '', grupo_id: 0, preco_custo: 0, preco_venda: 0, estoque_atual: 0, tabela_preco: '', preco_minimo: 0
  });
  const [productTags, setProductTags] = useState<Tag[]>(produto?.tags || []); // State for product tags

  useEffect(() => {
    setProductTags(produto?.tags || []);
  }, [produto]);

  const handleTagsChange = (newTags: Tag[]) => {
    setProductTags(newTags);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave({ ...formData, tags: productTags }); // Include tags when saving
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{produto ? 'Editar' : 'Novo'} Produto</h2>
      
      <div className="mb-4">
        <label htmlFor="codigo" className="block text-gray-700 text-sm font-bold mb-2">Código:</label>
        <input
          type="text"
          id="codigo"
          placeholder="Código"
          value={formData.codigo}
          onChange={e => setFormData({...formData, codigo: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="descricao" className="block text-gray-700 text-sm font-bold mb-2">Descrição:</label>
        <input
          type="text"
          id="descricao"
          placeholder="Descrição"
          value={formData.descricao}
          onChange={e => setFormData({...formData, descricao: e.target.value})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="grupo_id" className="block text-gray-700 text-sm font-bold mb-2">Grupo:</label>
        <select
          id="grupo_id"
          value={formData.grupo_id}
          onChange={e => setFormData({...formData, grupo_id: parseInt(e.target.value)})}
          required
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="">Selecione um Grupo</option>
          {grupos.map(grupo => (
            <option key={grupo.id} value={grupo.id}>{grupo.descricao}</option>
          ))}
        </select>
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

      {/* Integrate CalculadoraMargem */}
      <div className="mb-4">
        <CalculadoraMargem 
          precoCusto={formData.preco_custo || 0} 
          precoVenda={formData.preco_venda || 0} 
        />
      </div>

      <div className="mb-4">
        <label htmlFor="estoque_atual" className="block text-gray-700 text-sm font-bold mb-2">Estoque Atual:</label>
        <input
          type="number"
          id="estoque_atual"
          placeholder="Estoque Atual"
          value={formData.estoque_atual}
          onChange={e => setFormData({...formData, estoque_atual: parseFloat(e.target.value)})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="tabela_preco" className="block text-gray-700 text-sm font-bold mb-2">Tabela Preço:</label>
        <input
          type="text"
          id="tabela_preco"
          placeholder="Tabela Preço"
          value={formData.tabela_preco}
          onChange={e => setFormData({...formData, tabela_preco: e.target.value})}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>

      <div className="mb-4">
        <label htmlFor="preco_minimo" className="block text-gray-700 text-sm font-bold mb-2">Preço Mínimo:</label>
        <input
          type="number"
          id="preco_minimo"
          placeholder="Preço Mínimo"
          value={formData.preco_minimo}
          onChange={e => setFormData({...formData, preco_minimo: parseFloat(e.target.value)})}
          step="0.01"
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
      </div>
      
      {/* Integrate GerenciadorTags */}
      <div className="mb-4">
        <GerenciadorTags 
          produtoId={produto?.id || 0} // Pass product ID if available
          initialTags={productTags}
          onTagsChange={handleTagsChange}
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

export default Produtos;