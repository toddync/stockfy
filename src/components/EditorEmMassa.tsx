import React, { useState, useEffect } from 'react';

interface ProductVariant {
  id: number;
  productId: number;
  tamanho: string;
  cor: string;
  estoque: number;
  precoAdicional: number;
}

interface EditorEmMassaProps {
  // No direct props needed initially, as products/variants will be selected within the component
}

const EditorEmMassa: React.FC<EditorEmMassaProps> = () => {
  const [products, setProducts] = useState<any[]>([]); // Simplified product type for selection
  const [selectedProductId, setSelectedProductId] = useState<number | null>(null);
  const [variants, setVariants] = useState<ProductVariant[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [searchTerm, setSearchTerm] = useState('');

  useEffect(() => {
    const fetchProducts = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch('http://localhost:3000/api/produtos');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        setProducts(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar produtos: ${message}`);
        console.error("Erro ao carregar produtos:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchProducts();
  }, []);

  useEffect(() => {
    const fetchVariants = async () => {
      if (!selectedProductId) {
        setVariants([]);
        return;
      }
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch(`http://localhost:3000/api/produtos/${selectedProductId}/variacoes`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: ProductVariant[] = await response.json();
        setVariants(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar variações do produto: ${message}`);
        console.error("Erro ao carregar variações do produto:", e);
      } finally {
        setLoading(false);
      }
    };
    fetchVariants();
  }, [selectedProductId]);

  const handleVariantChange = (id: number, field: keyof ProductVariant, value: any) => {
    setVariants(prevVariants =>
      prevVariants.map(variant =>
        variant.id === id ? { ...variant, [field]: value } : variant
      )
    );
  };

  const handleSave = async () => {
    setLoading(true);
    setError(null);
    try {
      // This endpoint needs to be implemented in the backend
      const response = await fetch(`http://localhost:3000/api/produtos/${selectedProductId}/variacoes/bulk`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(variants),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      alert('Variações salvas com sucesso!');
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar variações: ${message}`);
      console.error("Erro ao salvar variações:", e);
    } finally {
      setLoading(false);
    }
  };

  const filteredProducts = products.filter(product =>
    product.descricao.toLowerCase().includes(searchTerm.toLowerCase()) ||
    product.codigo.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Gestor de Variações em Massa</h2>

      <div className="mb-4">
        <label htmlFor="product-select" className="block text-gray-700 text-sm font-bold mb-2">Selecionar Produto:</label>
        <input
          type="text"
          placeholder="Buscar produto por código ou descrição"
          value={searchTerm}
          onChange={e => setSearchTerm(e.target.value)}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline mb-2"
        />
        {searchTerm && filteredProducts.length > 0 && (
          <div className="border border-gray-300 rounded max-h-48 overflow-y-auto mb-2">
            {filteredProducts.map(product => (
              <div
                key={product.id}
                className="p-2 hover:bg-gray-100 cursor-pointer"
                onClick={() => {
                  setSelectedProductId(product.id);
                  setSearchTerm('');
                }}
              >
                {product.codigo} - {product.descricao}
              </div>
            ))}
          </div>
        )}
        {searchTerm && filteredProducts.length === 0 && !loading && <p className="text-gray-500">Nenhum produto encontrado.</p>}
        
        {selectedProductId && (
          <p className="text-gray-700 mt-2">Produto selecionado: 
            <span className="font-semibold ml-1">
              {products.find(p => p.id === selectedProductId)?.descricao}
            </span>
          </p>
        )}
      </div>

      {loading && <div className="text-center p-6">Carregando variações...</div>}
      {error && <div className="text-center p-6 text-red-600">Erro: {error}</div>}

      {selectedProductId && variants.length > 0 && !loading && (
        <div className="overflow-x-auto mt-6">
          <table className="min-w-full bg-white border border-gray-200">
            <thead>
              <tr className="bg-gray-100 border-b">
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Tamanho</th>
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Cor</th>
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Estoque</th>
                <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Preço Adicional</th>
              </tr>
            </thead>
            <tbody>
              {variants.map(variant => (
                <tr key={variant.id} className="border-b hover:bg-gray-50">
                  <td className="py-3 px-4 text-sm text-gray-700">{variant.tamanho}</td>
                  <td className="py-3 px-4 text-sm text-gray-700">{variant.cor}</td>
                  <td className="py-3 px-4 text-sm">
                    <input
                      type="number"
                      value={variant.estoque}
                      onChange={e => handleVariantChange(variant.id, 'estoque', parseInt(e.target.value))}
                      className="shadow-sm appearance-none border rounded w-20 py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    />
                  </td>
                  <td className="py-3 px-4 text-sm">
                    <input
                      type="number"
                      value={variant.precoAdicional}
                      onChange={e => handleVariantChange(variant.id, 'precoAdicional', parseFloat(e.target.value))}
                      step="0.01"
                      className="shadow-sm appearance-none border rounded w-24 py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          <button
            onClick={handleSave}
            className="mt-4 bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            Salvar Variações
          </button>
        </div>
      )}
      {selectedProductId && variants.length === 0 && !loading && (
        <div className="text-center p-6">Nenhuma variação encontrada para o produto selecionado.</div>
      )}
    </div>
  );
};

export default EditorEmMassa;
