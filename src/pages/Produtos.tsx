import React, { useState, useEffect, useCallback } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';
import FiltroRoupasAvancado from '../components/FiltroRoupasAvancado';
import GradeTamanhosCores from '../components/GradeTamanhosCores';
import CalculadoraMargem from '../components/CalculadoraMargem';
import GerenciadorTags from '../components/GerenciadorTags';
import ComparadorProdutos from '../components/ComparadorProdutos';
import ClassificadorABC from '../components/ClassificadorABC';
import EditorEmMassa from '../components/EditorEmMassa';


interface Tag {
  id: number;
  nome: string;
}

interface Variation {
  id?: number;
  sku: string;
  tamanho: string;
  cor: string;
  estoque_atual: number;
}

interface Produto {
  id?: number;
  codigo: string;
  descricao: string;
  grupo_id: number;
  preco_custo?: number;
  preco_venda: number;
  estoque_atual?: number;
  tabela_preco?: string;
  preco_minimo?: number;
  data_atualizacao?: string;
  tags?: Tag[];
  variations?: Variation[];
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
  const [success, setSuccess] = useState<string | null>(null);
  const [filters, setFilters] = useState({});
  const [selectedProductIdForGrade, setSelectedProductIdForGrade] = useState<number | null>(null);
  
  const [showAdvancedTools, setShowAdvancedTools] = useState(false);
  const [activeTool, setActiveTool] = useState<string | null>(null);

  useEffect(() => {
    carregarDados();
  }, [filters]);

  const carregarDados = async () => {
    setLoading(true);
    //setError(null);
    try {
      const queryParams = new URLSearchParams(filters).toString();
      const produtosUrl = `http://localhost:3000/api/produtos${queryParams ? `?${queryParams}` : ''}`;

      const [produtosResponse, gruposResponse] = await Promise.all([
        fetch(produtosUrl),
        fetch('http://localhost:3000/api/produto-grupos')
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

  const handleFilterChange = useCallback((newFilters: any) => {
    setFilters(newFilters);
  }, []);

  const salvarProduto = async (produto: Produto) => {
    setError(null);
    setSuccess(null);
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
      setSuccess(`Produto ${produto.id ? 'atualizado' : 'criado'} com sucesso!`);
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
    setSuccess(null);
    try {
      const response = await fetch(`http://localhost:3000/api/produtos/${id}`, {
        method: 'DELETE',
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      await carregarDados();
      setSuccess("Produto excluído com sucesso!");
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao deletar produto: ${message}`);
      console.error("Erro ao deletar produto:", e);
    }
  };

  const handleToolToggle = (tool: string) => {
    if (activeTool === tool) {
      setActiveTool(null);
    } else {
      setActiveTool(tool);
    }
  }

  if (loading) {
    return <div className="text-center p-6">Carregando produtos...</div>;
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
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="page-header flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Produtos</h1>
        <div className="flex space-x-4">
          <button 
            onClick={() => { setProdutoEditando(null); setMostrarForm(true); setActiveTool(null); }}
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            + Novo Produto
          </button>
          <button 
            onClick={() => setShowAdvancedTools(!showAdvancedTools)}
            className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-md transition-colors"
          >
            {showAdvancedTools ? 'Ocultar Ferramentas' : 'Ferramentas Avançadas'}
          </button>
        </div>
      </div>

      {showAdvancedTools && (
        <div className="advanced-tools bg-gray-50 p-4 rounded-lg mb-6 border">
          <h3 className="text-lg font-semibold mb-4">Ferramentas Avançadas</h3>
          <div className="flex space-x-4 mb-4">
            <button 
              onClick={() => handleToolToggle('mass_editor')}
              className={`font-bold py-2 px-4 rounded-md transition-colors ${activeTool === 'mass_editor' ? 'bg-orange-500 text-white' : 'bg-orange-200 hover:bg-orange-300 text-orange-800'}`}
            >
              Editor em Massa
            </button>
            <button 
              onClick={() => handleToolToggle('abc_analysis')}
              className={`font-bold py-2 px-4 rounded-md transition-colors ${activeTool === 'abc_analysis' ? 'bg-green-500 text-white' : 'bg-green-200 hover:bg-green-300 text-green-800'}`}
            >
              Análise ABC
            </button>
            <button 
              onClick={() => handleToolToggle('product_comparator')}
              className={`font-bold py-2 px-4 rounded-md transition-colors ${activeTool === 'product_comparator' ? 'bg-purple-500 text-white' : 'bg-purple-200 hover:bg-purple-300 text-purple-800'}`}
            >
              Comparar Produtos
            </button>
          </div>
          
          {activeTool === 'mass_editor' && <EditorEmMassa />}
          {activeTool === 'abc_analysis' && <ClassificadorABC />}
          {activeTool === 'product_comparator' && <ComparadorProdutos />}

          <h3 className="text-lg font-semibold mb-4 mt-6">Filtros Avançados</h3>
          <FiltroRoupasAvancado onFilterChange={handleFilterChange} />
        </div>
      )}

      <>
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
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Venda</th>
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Estoque</th>
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Ações</th>
              </tr>
            </thead>
            <tbody>
              {produtos.map(produto => (
                <tr key={produto.id} className="border-b hover:bg-gray-50">
                  <td className="py-3 px-4 text-sm text-gray-700">{produto.codigo}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{produto.descricao}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{grupos.find(g => g.id === produto.grupo_id)?.descricao || 'N/A'}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{parseFloat(produto.preco_venda as any).toFixed(2)}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{produto.estoque_atual != null ? parseFloat(produto.estoque_atual as any).toFixed(0) : 'N/A'}</td>
                  <td className="py-3 px-4 text-sm">
                    <button 
                      onClick={() => { setSelectedProductIdForGrade(produto.id!); }}
                      className="bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                    >
                      Grade
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
    </div>
  );
};
// The rest of the file (ProdutoForm) remains the same
const ProdutoForm: React.FC<{
  produto: Produto | null; 
  grupos: ProdutoGrupo[];
  onSave: (produto: Produto) => void; 
  onCancel: () => void 
}> = ({ produto, grupos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Produto>(produto || {
    codigo: '', descricao: '', grupo_id: 0, preco_custo: 0, preco_venda: 0, tabela_preco: '', preco_minimo: 0, variations: [], tags: []
  });
  const [productTags, setProductTags] = useState<Tag[]>(produto?.tags || []);
  const [variations, setVariations] = useState<Variation[]>(produto?.variations || []);

  useEffect(() => {
    setFormData(produto || {
      codigo: '', descricao: '', grupo_id: 0, preco_custo: 0, preco_venda: 0, tabela_preco: '', preco_minimo: 0, variations: [], tags: []
    });
    setProductTags(produto?.tags || []);
    setVariations(produto?.variations || []);
  }, [produto]);

  const handleTagsChange = (newTags: Tag[]) => {
    setProductTags(newTags);
  };

  const handleVariationChange = (index: number, field: keyof Variation, value: any) => {
    const newVariations = [...variations];
    newVariations[index] = { ...newVariations[index], [field]: value };
    setVariations(newVariations);
  };

  const addVariation = () => {
    setVariations([...variations, { sku: '', tamanho: '', cor: '', estoque_atual: 0 }]);
  };

  const removeVariation = (index: number) => {
    const newVariations = variations.filter((_, i) => i !== index);
    setVariations(newVariations);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave({ ...formData, tags: productTags, variations: variations });
  };

  return (
    <form onSubmit={handleSubmit} className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-2xl">
      <h2 className="text-2xl font-bold mb-6 text-gray-800">{produto ? 'Editar' : 'Novo'} Produto</h2>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
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
            value={formData.preco_custo || ''}
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
        
        <div className="mb-4">
          <label htmlFor="tabela_preco" className="block text-gray-700 text-sm font-bold mb-2">Tabela Preço:</label>
          <input
            type="text"
            id="tabela_preco"
            placeholder="Tabela Preço"
            value={formData.tabela_preco || ''}
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
            value={formData.preco_minimo || ''}
            onChange={e => setFormData({...formData, preco_minimo: parseFloat(e.target.value)})}
            step="0.01"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>
      </div>
      
      <div className="mb-4 col-span-2">
        <CalculadoraMargem 
          precoCusto={formData.preco_custo || 0} 
          precoVenda={formData.preco_venda || 0} 
        />
      </div>

      <div className="col-span-2">
        <h3 className="text-lg font-bold mb-2">Variações</h3>
        {variations.map((v, i) => (
            <div key={i} className="grid grid-cols-5 gap-2 mb-2 p-2 border rounded">
                <input value={v.sku} onChange={e => handleVariationChange(i, 'sku', e.target.value)} placeholder="SKU" className="shadow-sm border rounded py-1 px-2"/>
                <input value={v.tamanho} onChange={e => handleVariationChange(i, 'tamanho', e.target.value)} placeholder="Tamanho" className="shadow-sm border rounded py-1 px-2"/>
                <input value={v.cor} onChange={e => handleVariationChange(i, 'cor', e.target.value)} placeholder="Cor" className="shadow-sm border rounded py-1 px-2"/>
                <input type="number" value={v.estoque_atual} onChange={e => handleVariationChange(i, 'estoque_atual', parseFloat(e.target.value))} placeholder="Estoque" className="shadow-sm border rounded py-1 px-2"/>
                <button type="button" onClick={() => removeVariation(i)} className="bg-red-500 text-white rounded px-2 py-1">Remover</button>
            </div>
        ))}
        <button type="button" onClick={addVariation} className="bg-green-500 text-white rounded px-4 py-2 mt-2">Adicionar Variação</button>
      </div>
      
      <div className="mb-4 mt-4">
        <GerenciadorTags 
          produtoId={produto?.id || 0}
          initialTags={productTags}
          onTagsChange={handleTagsChange}
        />
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

export default Produtos;