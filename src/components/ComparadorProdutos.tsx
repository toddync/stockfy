import React, { useState, useEffect } from 'react';

interface ProductComparison {
  id: number;
  codigo: string;
  descricao: string;
  preco_venda: number;
  preco_custo?: number;
  estoque_atual?: number;
  // Add other relevant fields for comparison
}

interface ComparadorProdutosProps {
  // No direct props needed initially, as products will be selected within the component
}

const ComparadorProdutos: React.FC<ComparadorProdutosProps> = () => {
  const [availableProducts, setAvailableProducts] = useState<ProductComparison[]>([]);
  const [selectedProducts, setSelectedProducts] = useState<ProductComparison[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProducts = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch(`http://localhost:3000/api/produtos`); // Fetch all products for selection
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: ProductComparison[] = await response.json();
        setAvailableProducts(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar produtos para comparação: ${message}`);
        console.error("Erro ao carregar produtos para comparação:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchProducts();
  }, []);

  const handleAddProduct = (product: ProductComparison) => {
    if (selectedProducts.length < 3 && !selectedProducts.some(p => p.id === product.id)) {
      setSelectedProducts(prev => [...prev, product]);
      setSearchTerm(''); // Clear search after adding
    }
  };

  const handleRemoveProduct = (productId: number) => {
    setSelectedProducts(prev => prev.filter(p => p.id !== productId));
  };

  const filteredAvailableProducts = availableProducts.filter(product =>
    product.descricao.toLowerCase().includes(searchTerm.toLowerCase()) ||
    product.codigo.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Comparador de Produtos</h2>

      <div className="mb-4">
        <h3 className="text-lg font-medium text-gray-700 mb-2">Adicionar Produtos para Comparação (Máx. 3):</h3>
        <input
          type="text"
          placeholder="Buscar produto por código ou descrição"
          value={searchTerm}
          onChange={e => setSearchTerm(e.target.value)}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-2"
        />
        {loading && <p>Buscando produtos...</p>}
        {error && <p className="text-red-500">{error}</p>}
        {searchTerm && filteredAvailableProducts.length > 0 && (
          <div className="border border-gray-300 rounded max-h-48 overflow-y-auto">
            {filteredAvailableProducts.map(product => (
              <div
                key={product.id}
                className="p-2 hover:bg-gray-100 cursor-pointer flex justify-between items-center"
                onClick={() => handleAddProduct(product)}
              >
                <span>{product.codigo} - {product.descricao}</span>
                <span className="text-sm text-gray-500">R$ {product.preco_venda.toFixed(2)}</span>
              </div>
            ))}
          </div>
        )}
        {searchTerm && filteredAvailableProducts.length === 0 && !loading && <p className="text-gray-500">Nenhum produto encontrado.</p>}
      </div>

      {selectedProducts.length > 0 && (
        <div className="overflow-x-auto mt-6">
          <table className="min-w-full bg-white border border-gray-200">
            <thead>
              <tr className="bg-gray-100 border-b">
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Característica</th>
                {selectedProducts.map(product => (
                  <th key={product.id} className="py-3 px-4 text-center text-sm font-semibold text-gray-600">
                    {product.descricao} ({product.codigo})
                    <button 
                      onClick={() => handleRemoveProduct(product.id)}
                      className="ml-2 text-red-500 hover:text-red-700 focus:outline-none"
                    >
                      &times;
                    </button>
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              <tr className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700 font-medium">Preço de Venda</td>
                {selectedProducts.map(product => (
                  <td key={product.id} className="py-3 px-4 text-center text-sm text-gray-700">R$ {product.preco_venda.toFixed(2)}</td>
                ))}
              </tr>
              <tr className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700 font-medium">Preço de Custo</td>
                {selectedProducts.map(product => (
                  <td key={product.id} className="py-3 px-4 text-center text-sm text-gray-700">R$ {product.preco_custo?.toFixed(2) || 'N/A'}</td>
                ))}
              </tr>
              <tr className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700 font-medium">Estoque Atual</td>
                {selectedProducts.map(product => (
                  <td key={product.id} className="py-3 px-4 text-center text-sm text-gray-700">{product.estoque_atual || 'N/A'}</td>
                ))}
              </tr>
              {/* Add more comparison rows as needed */}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default ComparadorProdutos;
