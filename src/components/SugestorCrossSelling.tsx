import React, { useState } from "react";

interface Produto {
    id: number;
    descricao: string;
    codigo: string;
    preco_venda: number;
}

const SugestorCrossSelling: React.FC = () => {
    const [searchTerm, setSearchTerm] = useState("");
    const [searchResults, setSearchResults] = useState<Produto[]>([]);
    const [selectedProduct, setSelectedProduct] = useState<Produto | null>(
        null,
    );
    const [suggestions, setSuggestions] = useState<Produto[]>([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);

    const handleSearchProducts = async () => {
        if (!searchTerm) {
            setSearchResults([]);
            return;
        }
        setLoading(true);
        setError(null);
        try {
            // Reusing the existing product search endpoint
            const response = await fetch(
                `http://localhost:3000/api/produtos/search?q=${searchTerm}`,
            );
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data: Produto[] = await response.json();
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

    const handleSelectProduct = async (product: Produto) => {
        setSelectedProduct(product);
        setSearchResults([]);
        setSearchTerm("");
        setLoading(true);
        setError(null);
        try {
            // This endpoint needs to be implemented in the backend
            const response = await fetch(
                `http://localhost:3000/api/produtos/${product.id}/cross-selling-suggestions`,
            );
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data: Produto[] = await response.json();
            setSuggestions(data);
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(
                `Falha ao carregar sugestões de cross-selling: ${message}`,
            );
            console.error("Erro ao carregar sugestões de cross-selling:", e);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="bg-white p-6 rounded-lg shadow-md mt-6">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">
                Sugestão de Cross-selling
            </h2>

            <div className="mb-4">
                <label
                    htmlFor="product-search"
                    className="block text-gray-700 text-sm font-bold mb-2"
                >
                    Buscar Produto Principal:
                </label>
                <div className="flex space-x-2">
                    <input
                        type="text"
                        placeholder="Código ou descrição do produto"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
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
                {searchResults.length > 0 && (
                    <div className="border border-gray-300 rounded max-h-48 overflow-y-auto mt-2">
                        {searchResults.map((product) => (
                            <div
                                key={product.id}
                                className="p-2 hover:bg-gray-100 cursor-pointer flex justify-between items-center"
                                onClick={() => handleSelectProduct(product)}
                            >
                                <span>
                                    {product.codigo} - {product.descricao}
                                </span>
                                <span className="font-semibold">
                                    R$ {product.preco_venda}
                                </span>
                            </div>
                        ))}
                    </div>
                )}
                {searchTerm && searchResults.length === 0 && !loading && (
                    <p className="text-gray-500 mt-2">
                        Nenhum produto encontrado.
                    </p>
                )}
            </div>

            {selectedProduct && (
                <div className="mb-4 p-4 border rounded-md bg-gray-50">
                    <h3 className="text-lg font-semibold mb-2">
                        Produto Principal Selecionado:
                    </h3>
                    <p>
                        <strong>Código:</strong> {selectedProduct.codigo}
                    </p>
                    <p>
                        <strong>Descrição:</strong> {selectedProduct.descricao}
                    </p>
                    <p>
                        <strong>Preço Venda:</strong> R${" "}
                        {selectedProduct.preco_venda}
                    </p>
                </div>
            )}

            {loading && (
                <div className="text-center p-6">Carregando sugestões...</div>
            )}
            {error && (
                <div className="text-center p-6 text-red-600">
                    Erro: {error}
                </div>
            )}

            {selectedProduct && !loading && !error && (
                <div className="mt-6">
                    <h3 className="font-semibold text-lg mb-2">
                        Produtos Sugeridos para Cross-selling:
                    </h3>
                    {suggestions.length === 0 ? (
                        <p className="text-gray-600">
                            Nenhuma sugestão de cross-selling encontrada para
                            este produto.
                        </p>
                    ) : (
                        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
                            {suggestions.map((sug) => (
                                <div
                                    key={sug.id}
                                    className="border p-4 rounded-md shadow-sm bg-white"
                                >
                                    <p className="font-semibold text-blue-600">
                                        {sug.descricao}
                                    </p>
                                    <p className="text-sm text-gray-700">
                                        Cód: {sug.codigo}
                                    </p>
                                    <p className="text-sm text-gray-700">
                                        R$ {sug.preco_venda}
                                    </p>
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            )}
        </div>
    );
};

export default SugestorCrossSelling;
