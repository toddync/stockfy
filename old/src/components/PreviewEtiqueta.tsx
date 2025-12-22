import React, { useState } from 'react';

interface ProductInfo {
  codigo: string;
  descricao: string;
  precoVenda: number;
  tamanho?: string;
  cor?: string;
}



const PreviewEtiqueta: React.FC = () => {
  const [searchTerm, setSearchTerm] = useState('');
  const [searchResults, setSearchResults] = useState<ProductInfo[]>([]);
  const [selectedProduct, setSelectedProduct] = useState<ProductInfo | null>(null);
  const [quantity, setQuantity] = useState(1);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSearch = async () => {
    if (!searchTerm) {
      setSearchResults([]);
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
      const data: ProductInfo[] = await response.json();
      setSearchResults(data);
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

  const handleSelectProduct = (product: ProductInfo) => {
    setSelectedProduct(product);
    setSearchResults([]);
    setSearchTerm('');
  };

  const generateLabels = () => {
    if (!selectedProduct) {
      alert('Por favor, selecione um produto para gerar etiquetas.');
      return;
    }
    if (quantity <= 0) {
      alert('A quantidade deve ser maior que zero.');
      return;
    }

    const labels = [];
    for (let i = 0; i < quantity; i++) {
      labels.push(
        <div key={`${selectedProduct.codigo}-${i}`} className="label-template border p-4 m-2 w-48 h-24 flex flex-col justify-between text-xs font-mono bg-white shadow-sm">
          <div className="text-center font-bold text-sm">{selectedProduct.descricao}</div>
          <div className="flex justify-between">
            <span>Cód: {selectedProduct.codigo}</span>
            <span>R$ {selectedProduct.precoVenda}</span>
          </div>
          {selectedProduct.tamanho && <div className="text-center">Tam: {selectedProduct.tamanho}</div>}
          {selectedProduct.cor && <div className="text-center">Cor: {selectedProduct.cor}</div>}
          {/* Add a placeholder for barcode/QR code */}
          <div className="text-center mt-1">
            <img src={`https://barcode.tec-it.com/barcode.ashx?data=${selectedProduct.codigo}&code=Code128&dpi=96`} alt="barcode" className="mx-auto h-6" />
          </div>
        </div>
      );
    }
    return labels;
  };

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Preview de Etiquetas</h2>

      <div className="mb-4 flex space-x-2">
        <input
          type="text"
          placeholder="Buscar produto por código ou descrição"
          value={searchTerm}
          onChange={e => setSearchTerm(e.target.value)}
          className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        />
        <button
          onClick={handleSearch}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          disabled={loading}
        >
          {loading ? 'Buscando...' : 'Buscar'}
        </button>
      </div>

      {error && <div className="text-red-600 mb-4">{error}</div>}

      {searchResults.length > 0 && (
        <div className="border border-gray-300 rounded max-h-48 overflow-y-auto mb-4">
          {searchResults.map(product => (
            <div
              key={product.codigo}
              className="p-2 hover:bg-gray-100 cursor-pointer flex justify-between items-center"
              onClick={() => handleSelectProduct(product)}
            >
              <span>{product.codigo} - {product.descricao}</span>
              <span className="font-semibold">R$ {product.precoVenda}</span>
            </div>
          ))}
        </div>
      )}

      {selectedProduct && (
        <div className="mb-4 p-4 border rounded-md bg-gray-50">
          <h3 className="text-lg font-semibold mb-2">Produto Selecionado:</h3>
          <p><strong>Código:</strong> {selectedProduct.codigo}</p>
          <p><strong>Descrição:</strong> {selectedProduct.descricao}</p>
          <p><strong>Preço Venda:</strong> R$ {selectedProduct.precoVenda}</p>
          {selectedProduct.tamanho && <p><strong>Tamanho:</strong> {selectedProduct.tamanho}</p>}
          {selectedProduct.cor && <p><strong>Cor:</strong> {selectedProduct.cor}</p>}

          <div className="mt-4">
            <label htmlFor="quantity" className="block text-gray-700 text-sm font-bold mb-2">Quantidade de Etiquetas:</label>
            <input
              type="number"
              id="quantity"
              value={quantity}
              onChange={e => setQuantity(parseInt(e.target.value))}
              min="1"
              className="shadow appearance-none border rounded w-24 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            />
          </div>
        </div>
      )}

      <button
        onClick={generateLabels}
        className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        disabled={!selectedProduct || quantity <= 0}
      >
        Gerar Preview de Etiquetas
      </button>

      <div className="mt-6 border-t pt-6 grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4">
        {selectedProduct && quantity > 0 && generateLabels()}
      </div>
    </div>
  );
};

export default PreviewEtiqueta;
