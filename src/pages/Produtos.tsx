import React, { useState, useEffect, useCallback } from 'react';
import Modal from '../components/Modal';
import Alerta from '../components/Alerta';
import FiltroRoupasAvancado, { type FilterState } from '../components/FiltroRoupasAvancado';
import GradeTamanhosCores from '../components/GradeTamanhosCores';
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

  const carregarDados = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const queryParams = new URLSearchParams(filters as Record<string, string>).toString();
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

      const produtosData: any[] = await produtosResponse.json();
      const gruposData: ProdutoGrupo[] = await gruposResponse.json();

      const processedProdutos = produtosData.map(p => ({
        ...p,
        preco_venda: p.preco_venda ? parseFloat(p.preco_venda) : 0,
        preco_custo: p.preco_custo ? parseFloat(p.preco_custo) : undefined,
        preco_minimo: p.preco_minimo ? parseFloat(p.preco_minimo) : undefined,
        estoque_atual: p.estoque_atual ? parseFloat(p.estoque_atual) : undefined,
      }));

      setProdutos(processedProdutos);
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
  }, [filters]);

  useEffect(() => {
    carregarDados();
  }, [carregarDados]);

  const handleFilterChange = useCallback((newFilters: FilterState) => {
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
                  <td className="py-3 px-4 text-sm text-gray-700">{produto.preco_venda?.toFixed(2)}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{produto.estoque_atual != null ? produto.estoque_atual.toFixed(0) : 'N/A'}</td>
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

export default Produtos;
const ProdutoForm: React.FC<{
  produto: Produto | null;
  grupos: ProdutoGrupo[];
  onSave: (produto: Produto) => void;
  onCancel: () => void;
}> = ({ produto, grupos, onSave, onCancel }) => {
  const [formData, setFormData] = useState<Produto>(
    produto || {
      codigo: '',
      descricao: '',
      grupo_id: 0,
      preco_custo: 0,
      preco_venda: 0,
      tabela_preco: '',
      preco_minimo: 0,
    }
  );

  useEffect(() => {
    setFormData(
      produto || {
        codigo: '',
        descricao: '',
        grupo_id: 0,
        preco_custo: 0,
        preco_venda: 0,
        tabela_preco: '',
        preco_minimo: 0,
      }
    );
  }, [produto]);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
      <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
        {produto ? 'Editar' : 'Novo'} Produto
      </h2>
      <p className="text-center text-gray-600 mb-8 text-lg">
        Preencha os dados para {produto ? 'atualizar o' : 'cadastrar um novo'} produto.
      </p>
      <form onSubmit={handleSubmit} className="space-y-8">
        <div>
          <label className="block text-xl font-semibold text-gray-700 mb-2">
            1. Informações Básicas
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input
              type="text"
              placeholder="Código"
              value={formData.codigo}
              onChange={e => setFormData({ ...formData, codigo: e.target.value })}
              required
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="text"
              placeholder="Descrição"
              value={formData.descricao}
              onChange={e => setFormData({ ...formData, descricao: e.target.value })}
              required
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <select
              value={formData.grupo_id}
              onChange={e => setFormData({ ...formData, grupo_id: parseInt(e.target.value) })}
              required
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
              <option value="">Selecione um Grupo</option>
              {grupos.map(grupo => (
                <option key={grupo.id} value={grupo.id}>
                  {grupo.descricao}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div>
          <label className="block text-xl font-semibold text-gray-700 mb-2">
            2. Preços
          </label>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input
              type="number"
              placeholder="Preço Custo"
              value={formData.preco_custo || ''}
              onChange={e => setFormData({ ...formData, preco_custo: parseFloat(e.target.value) })}
              step="0.01"
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
            <input
              type="number"
              placeholder="Preço Venda"
              value={formData.preco_venda}
              onChange={e => setFormData({ ...formData, preco_venda: parseFloat(e.target.value) })}
              step="0.01"
              required
              className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            />
          </div>
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