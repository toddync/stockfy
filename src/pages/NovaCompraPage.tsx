import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Alerta from '../components/Alerta';
import BuscadorProdutos from '../components/BuscadorProdutos';

// Interfaces based on backend service expectations
interface CompraData {
  numero_pedido: string;
  tipo_pedido?: string;
  fornecedor_id: number;
  data_pedido: string;
  data_entrega?: string;
  data_nota?: string;
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

interface CompraItemData {
  produto_id: number;
  quantidade: number;
  preco_compra: number;
  desconto?: number;
  valor_total: number;
  tamanho?: string;
  cor?: string;
  // Additional frontend-only fields for display
  produto_descricao: string; 
  produto_codigo: string;
}

interface Fornecedor {
  id: number;
  razao_social: string;
}

interface Produto {
  id: number;
  descricao: string;
  codigo: string;
  preco_venda: number; // Assuming preco_venda can be used as base for preco_compra
}

const NovaCompraPage: React.FC = () => {
  const navigate = useNavigate();
  const [fornecedores, setFornecedores] = useState<Fornecedor[]>([]);
  const [compraData, setCompraData] = useState<CompraData>({
    numero_pedido: '',
    fornecedor_id: 0,
    data_pedido: new Date().toISOString().split('T')[0],
    situacao: 'Pendente',
  });
  const [itensCompra, setItensCompra] = useState<CompraItemData[]>([]);
  const [produtoSelecionado, setProdutoSelecionado] = useState<Produto | null>(null);
  const [quantidadeItem, setQuantidadeItem] = useState(1);
  const [precoCompraItem, setPrecoCompraItem] = useState(0);
  const [descontoItem, setDescontoItem] = useState(0);

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    const fetchFornecedores = async () => {
      setLoading(true);
      try {
        const response = await fetch('http://localhost:3000/api/fornecedores');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: Fornecedor[] = await response.json();
        setFornecedores(data);
      } catch (e: unknown) {
        const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
        setError(`Falha ao carregar fornecedores: ${message}`);
        console.error("Erro ao carregar fornecedores:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchFornecedores();
  }, []);

  useEffect(() => {
    if (produtoSelecionado) {
      setPrecoCompraItem(produtoSelecionado.preco_venda); // Use venda price as default buy price
    }
  }, [produtoSelecionado]);

  const handleAddProdutoToItens = () => {
    if (!produtoSelecionado || quantidadeItem <= 0 || precoCompraItem <= 0) {
      setError('Selecione um produto, quantidade e preço de compra válidos.');
      return;
    }

    const valorTotalItem = (quantidadeItem * precoCompraItem) * (1 - descontoItem / 100);

    setItensCompra(prevItens => [
      ...prevItens,
      {
        produto_id: produtoSelecionado.id,
        quantidade: quantidadeItem,
        preco_compra: precoCompraItem,
        desconto: descontoItem,
        valor_total: valorTotalItem,
        produto_descricao: produtoSelecionado.descricao,
        produto_codigo: produtoSelecionado.codigo,
      },
    ]);

    // Reset item fields
    setProdutoSelecionado(null);
    setQuantidadeItem(1);
    setPrecoCompraItem(0);
    setDescontoItem(0);
    setError(null);
  };

  const handleRemoveItem = (index: number) => {
    setItensCompra(prevItens => prevItens.filter((_, i) => i !== index));
  };

  const calculateTotalCompra = () => {
    const total = itensCompra.reduce((sum, item) => sum + item.valor_total, 0);
    setCompraData(prevData => ({ ...prevData, valor_total_pedido: total, valor_total_nota: total }));
    return total;
  };

  useEffect(() => {
    calculateTotalCompra();
  }, [itensCompra]);

  const handleSubmitCompra = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setSuccess(null);
    setLoading(true);

    if (!compraData.fornecedor_id) {
      setError('Por favor, selecione um fornecedor.');
      setLoading(false);
      return;
    }
    if (itensCompra.length === 0) {
      setError('Adicione pelo menos um item à compra.');
      setLoading(false);
      return;
    }

    try {
      const response = await fetch('http://localhost:3000/api/compras/nova', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ compraData, itensData: itensCompra }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Falha ao criar a nova compra.');
      }

      const result = await response.json();
      setSuccess(result.message || 'Nova compra criada com sucesso!');
      
      // Reset form
      setCompraData({
        numero_pedido: '',
        fornecedor_id: 0,
        data_pedido: new Date().toISOString().split('T')[0],
        situacao: 'Pendente',
      });
      setItensCompra([]);
      setProdutoSelecionado(null);
      setQuantidadeItem(1);
      setPrecoCompraItem(0);
      setDescontoItem(0);

    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(`Falha ao registrar compra: ${message}`);
      console.error("Erro ao registrar compra:", e);
    } finally {
      setLoading(false);
    }
  };

  if (loading && fornecedores.length === 0) {
    return <div className="text-center p-6">Carregando dados...</div>;
  }

  return (
    <div className="page-container p-6 bg-gray-50 min-h-screen">
      <h1 className="text-3xl font-bold text-gray-800 mb-6">Nova Compra</h1>
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <form onSubmit={handleSubmitCompra} className="bg-white p-8 rounded-lg shadow-md space-y-6">
        {/* Detalhes da Compra */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label htmlFor="numero_pedido" className="block text-gray-700 text-sm font-bold mb-2">Número do Pedido:</label>
            <input type="text" id="numero_pedido" value={compraData.numero_pedido} onChange={e => setCompraData({...compraData, numero_pedido: e.target.value})} required className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight"/>
          </div>
          <div>
            <label htmlFor="fornecedor_id" className="block text-gray-700 text-sm font-bold mb-2">Fornecedor:</label>
            <select id="fornecedor_id" value={compraData.fornecedor_id} onChange={e => setCompraData({...compraData, fornecedor_id: parseInt(e.target.value)})} required className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight">
              <option value="0">Selecione um Fornecedor</option>
              {fornecedores.map(fornecedor => (<option key={fornecedor.id} value={fornecedor.id}>{fornecedor.razao_social}</option>))}
            </select>
          </div>
          <div>
            <label htmlFor="data_pedido" className="block text-gray-700 text-sm font-bold mb-2">Data do Pedido:</label>
            <input type="date" id="data_pedido" value={compraData.data_pedido} onChange={e => setCompraData({...compraData, data_pedido: e.target.value})} required className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight"/>
          </div>
          {/* Add other main purchase data fields as needed, similar to CompraForm */}
        </div>

        {/* Adicionar Itens à Compra */}
        <div className="border-t pt-6 mt-6">
          <h2 className="text-2xl font-bold text-gray-800 mb-4">Adicionar Itens</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-4">
            <div className="lg:col-span-2">
              <label className="block text-gray-700 text-sm font-bold mb-2">Produto:</label>
              <BuscadorProdutos onProdutoSelecionado={setProdutoSelecionado} produtoInicial={produtoSelecionado}/>
              {produtoSelecionado && (<p className="text-gray-600 text-sm mt-1">Selecionado: {produtoSelecionado.descricao} (R$ {produtoSelecionado.preco_venda.toFixed(2)})</p>)}
            </div>
            <div>
              <label htmlFor="quantidadeItem" className="block text-gray-700 text-sm font-bold mb-2">Quantidade:</label>
              <input type="number" id="quantidadeItem" value={quantidadeItem} onChange={e => setQuantidadeItem(parseInt(e.target.value))} min="1" className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight"/>
            </div>
            <div>
              <label htmlFor="precoCompraItem" className="block text-gray-700 text-sm font-bold mb-2">Preço de Compra:</label>
              <input type="number" id="precoCompraItem" value={precoCompraItem} onChange={e => setPrecoCompraItem(parseFloat(e.target.value))} step="0.01" className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight"/>
            </div>
            <div>
              <label htmlFor="descontoItem" className="block text-gray-700 text-sm font-bold mb-2">Desconto (%):</label>
              <input type="number" id="descontoItem" value={descontoItem} onChange={e => setDescontoItem(parseFloat(e.target.value))} min="0" max="100" className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight"/>
            </div>
            <div className="lg:col-span-4 flex justify-end">
              <button type="button" onClick={handleAddProdutoToItens} className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md">Adicionar Item</button>
            </div>
          </div>

          {/* Lista de Itens Adicionados */}
          {itensCompra.length > 0 && (
            <div className="mt-6">
              <h3 className="text-lg font-bold mb-2">Itens da Compra:</h3>
              <div className="overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200">
                  <thead>
                    <tr className="bg-gray-100">
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Produto</th>
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Qtd</th>
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Preço Compra</th>
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Desconto</th>
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Total</th>
                      <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    {itensCompra.map((item, index) => (
                      <tr key={index} className="border-b">
                        <td className="py-2 px-3 text-sm text-gray-700">{item.produto_descricao}</td>
                        <td className="py-2 px-3 text-sm text-gray-700">{item.quantidade}</td>
                        <td className="py-2 px-3 text-sm text-gray-700">R$ {item.preco_compra.toFixed(2)}</td>
                        <td className="py-2 px-3 text-sm text-gray-700">{item.desconto?.toFixed(2) || 0}%</td>
                        <td className="py-2 px-3 text-sm text-gray-700">R$ {item.valor_total.toFixed(2)}</td>
                        <td className="py-2 px-3 text-sm">
                          <button type="button" onClick={() => handleRemoveItem(index)} className="text-red-600 hover:text-red-800">Remover</button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <div className="text-right mt-4 text-lg font-bold text-gray-800">Total da Compra: R$ {compraData.valor_total_pedido?.toFixed(2) || '0.00'}</div>
            </div>
          )}
        </div>

        <div className="flex justify-end mt-6 space-x-4">
          <button type="button" onClick={() => navigate('/compras')} className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md">Cancelar</button>
          <button type="submit" className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md" disabled={loading}>
            {loading ? 'Salvando...' : 'Finalizar Compra'}
          </button>
        </div>
      </form>
    </div>
  );
};

export default NovaCompraPage;
