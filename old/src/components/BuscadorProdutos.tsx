import React, { useState, useEffect, useRef } from 'react';

interface Produto {
  id: number;
  descricao: string;
  codigo: string;
  preco_venda: number;
}

interface BuscadorProdutosProps {
  onProdutoSelecionado: (produto: Produto | null) => void;
  produtoInicial?: Produto | null;
}

const BuscadorProdutos: React.FC<BuscadorProdutosProps> = ({ onProdutoSelecionado, produtoInicial }) => {
  const [searchTerm, setSearchTerm] = useState(produtoInicial ? `${produtoInicial.descricao} (${produtoInicial.codigo})` : '');
  const [searchResults, setSearchResults] = useState<Produto[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [showResults, setShowResults] = useState(false);
  const wrapperRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (produtoInicial) {
      setSearchTerm(`${produtoInicial.descricao} (${produtoInicial.codigo})`);
    } else {
      setSearchTerm('');
    }
  }, [produtoInicial]);

  useEffect(() => {
    const delayDebounceFn = setTimeout(() => {
      if (searchTerm.length > 2) {
        searchProducts(searchTerm);
      } else {
        setSearchResults([]);
      }
    }, 500); // Debounce search by 500ms

    return () => clearTimeout(delayDebounceFn);
  }, [searchTerm]);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setShowResults(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [wrapperRef]);

  const searchProducts = async (term: string) => {
    setLoading(true);
    setError(null);
    try {
      // This endpoint needs to be implemented in the backend
      const response = await fetch(`http://localhost:3000/api/produtos/search?q=${term}`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Produto[] = await response.json();
      setSearchResults(data);
      setShowResults(true);
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

  const handleSelectProduct = (produto: Produto) => {
    setSearchTerm(`${produto.descricao} (${produto.codigo})`);
    onProdutoSelecionado(produto);
    setShowResults(false);
  };

  return (
    <div className="relative" ref={wrapperRef}>
      <input
        type="text"
        placeholder="Buscar produto por descrição ou código..."
        value={searchTerm}
        onChange={(e) => {
          setSearchTerm(e.target.value);
          onProdutoSelecionado(null); // Clear selected product if search term changes
        }}
        onFocus={() => searchTerm.length > 2 && setSearchResults.length > 0 && setShowResults(true)}
        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
      />
      {loading && <div className="absolute right-2 top-2 text-gray-500">Carregando...</div>}
      {error && <div className="text-red-600 text-sm mt-1">{error}</div>}

      {showResults && searchResults.length > 0 && (
        <ul className="absolute z-10 w-full bg-white border border-gray-300 rounded-md shadow-lg mt-1 max-h-60 overflow-y-auto">
          {searchResults.map((produto) => (
            <li
              key={produto.id}
              onClick={() => handleSelectProduct(produto)}
              className="p-2 hover:bg-gray-100 cursor-pointer border-b border-gray-100 last:border-b-0"
            >
              {produto.descricao} (Cód: {produto.codigo})
            </li>
          ))}
        </ul>
      )}
      {showResults && !loading && searchResults.length === 0 && searchTerm.length > 2 && (
        <div className="absolute z-10 w-full bg-white border border-gray-300 rounded-md shadow-lg mt-1 p-2 text-gray-500">
          Nenhum produto encontrado.
        </div>
      )}
    </div>
  );
};

export default BuscadorProdutos;
