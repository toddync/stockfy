import React, { useState, useEffect } from 'react';

interface Vendedor {
  id: number;
  nome: string;
}

interface Produto {
  id: number;
  descricao: string;
  preco_venda: number;
}

interface ItemVenda {
  produto: Produto;
  quantidade: number;
  comissaoPercentual: number; // Commission percentage for this specific item
}



const CalculadoraComissoes: React.FC = () => {
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [selectedVendedor, setSelectedVendedor] = useState<Vendedor | null>(null);
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [carrinho, setCarrinho] = useState<ItemVenda[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchVendedores = async () => {
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch('http://localhost:3000/api/vendedores');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: Vendedor[] = await response.json();
        setVendedores(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar vendedores: ${message}`);
        console.error("Erro ao carregar vendedores:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchVendedores();
  }, []);

  const handleSearchProducts = async () => {
    if (!searchTerm) {
      setProdutos([]);
      return;
    }
    setLoading(true);
    setError(null);
    try {
      // Reusing the existing product search endpoint
      const response = await fetch(`http://localhost:3000/api/produtos/search?q=${searchTerm}`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Produto[] = await response.json();
      setProdutos(data);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao buscar produtos: ${message}`);
      console.error("Erro ao buscar produtos:", e);
    } finally {
      setLoading(false);
    }
  };

  const handleAddProductToCart = (product: Produto) => {
    setCarrinho(prevCarrinho => {
      const existingItem = prevCarrinho.find(item => item.produto.id === product.id);
      if (existingItem) {
        return prevCarrinho.map(item =>
          item.produto.id === product.id ? { ...item, quantidade: item.quantidade + 1 } : item
        );
      } else {
        // Default commission percentage, could be fetched from backend or configured
        return [...prevCarrinho, { produto: product, quantidade: 1, comissaoPercentual: 5 }]; 
      }
    });
    setSearchTerm('');
    setProdutos([]);
  };

  const handleUpdateQuantity = (productId: number, quantity: number) => {
    setCarrinho(prevCarrinho =>
      prevCarrinho.map(item =>
        item.produto.id === productId ? { ...item, quantidade: quantity } : item
      ).filter(item => item.quantidade > 0)
    );
  };

  const handleUpdateCommission = (productId: number, percentage: number) => {
    setCarrinho(prevCarrinho =>
      prevCarrinho.map(item =>
        item.produto.id === productId ? { ...item, comissaoPercentual: percentage } : item
      )
    );
  };

  const calculateTotalComissao = () => {
    return carrinho.reduce((total, item) => {
      const valorVenda = item.produto.preco_venda * item.quantidade;
      const comissao = valorVenda * (item.comissaoPercentual / 100);
      return total + comissao;
    }, 0);
  };

  const calculateTotalVenda = () => {
    return carrinho.reduce((total, item) => total + (item.produto.preco_venda * item.quantidade), 0);
  };

  if (loading && vendedores.length === 0) {
    return <div className="text-center p-6">Carregando dados da calculadora de comissões...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Calculadora de Comissões</h2>

      <div className="mb-4">
        <label htmlFor="vendedor-select" className="block text-gray-700 text-sm font-bold mb-2">Selecionar Vendedor:</label>
        <select
          id="vendedor-select"
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          onChange={e => setSelectedVendedor(vendedores.find(v => v.id === parseInt(e.target.value)) || null)}
          value={selectedVendedor?.id || ''}
        >
          <option value="">Selecione um Vendedor</option>
          {vendedores.map(vendedor => (
            <option key={vendedor.id} value={vendedor.id}>{vendedor.nome}</option>
          ))}
        </select>
      </div>

      <div className="mb-4">
        <label htmlFor="product-search" className="block text-gray-700 text-sm font-bold mb-2">Adicionar Produtos:</label>
        <div className="flex space-x-2">
          <input
            type="text"
            placeholder="Buscar produto por código ou descrição"
            value={searchTerm}
            onChange={e => setSearchTerm(e.target.value)}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
          <button
            onClick={handleSearchProducts}
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
            disabled={loading}
          >
            Buscar
          </button>
        </div>
        {produtos.length > 0 && (
          <div className="border border-gray-300 rounded max-h-48 overflow-y-auto mt-2">
            {produtos.map(product => (
              <div
                key={product.id}
                className="p-2 hover:bg-gray-100 cursor-pointer flex justify-between items-center"
                onClick={() => handleAddProductToCart(product)}
              >
                <span>{product.descricao} (R$ {product.preco_venda.toFixed(2)})</span>
                <button className="bg-green-500 text-white px-2 py-1 rounded text-xs">+ Add</button>
              </div>
            ))}
          </div>
        )}
      </div>

      <div className="mt-6">
        <h3 className="font-semibold text-lg mb-2">Itens da Venda:</h3>
        {carrinho.length === 0 ? (
          <p className="text-gray-600">Nenhum item adicionado.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="min-w-full bg-white border border-gray-200">
              <thead>
                <tr className="bg-gray-100 border-b">
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Produto</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Unit.</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Quantidade</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Comissão (%)</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Total Item</th>
                  <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Comissão Item</th>
                </tr>
              </thead>
              <tbody>
                {carrinho.map(item => (
                  <tr key={item.produto.id} className="border-b hover:bg-gray-50">
                    <td className="py-3 px-4 text-sm text-gray-700">{item.produto.descricao}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">R$ {item.produto.preco_venda.toFixed(2)}</td>
                    <td className="py-3 px-4 text-sm">
                      <input
                        type="number"
                        min="1"
                        value={item.quantidade}
                        onChange={e => handleUpdateQuantity(item.produto.id, parseInt(e.target.value))}
                        className="shadow-sm appearance-none border rounded w-20 py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      />
                    </td>
                    <td className="py-3 px-4 text-sm">
                      <input
                        type="number"
                        min="0"
                        max="100"
                        value={item.comissaoPercentual}
                        onChange={e => handleUpdateCommission(item.produto.id, parseFloat(e.target.value))}
                        className="shadow-sm appearance-none border rounded w-20 py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      />
                    </td>
                    <td className="py-3 px-4 text-sm text-gray-700">R$ {(item.produto.preco_venda * item.quantidade).toFixed(2)}</td>
                    <td className="py-3 px-4 text-sm text-gray-700">R$ {((item.produto.preco_venda * item.quantidade) * (item.comissaoPercentual / 100)).toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        <div className="mt-4 p-4 bg-gray-50 rounded-md text-right">
          <p className="text-lg font-bold text-gray-800">Total Venda: R$ {calculateTotalVenda().toFixed(2)}</p>
          <p className="text-xl font-bold text-blue-600">Comissão Total: R$ {calculateTotalComissao().toFixed(2)}</p>
          {selectedVendedor && (
            <p className="text-sm text-gray-600">Comissão para: {selectedVendedor.nome}</p>
          )}
        </div>
      </div>
    </div>
  );
};

export default CalculadoraComissoes;
