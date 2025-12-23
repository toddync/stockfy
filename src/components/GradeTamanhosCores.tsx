import React, { useState, useEffect } from 'react';

interface ProductVariant {
  tamanho: string;
  cor: string;
  estoque: number;
}

interface GradeTamanhosCoresProps {
  productId: number;
}

const GradeTamanhosCores: React.FC<GradeTamanhosCoresProps> = ({ productId }) => {
  const [variants, setVariants] = useState<ProductVariant[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchVariants = async () => {
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch(`http://localhost:3000/api/produtos/${productId}/variacoes`);
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

    if (productId) {
      fetchVariants();
    }
  }, [productId]);

  if (loading) {
    return <div className="text-center p-6">Carregando grade de tamanhos/cores...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (variants.length === 0) {
    return <div className="text-center p-6">Nenhuma variação de tamanho/cor encontrada para este produto.</div>;
  }

  // Extract unique sizes and colors for table headers
  const uniqueTamanhos = Array.from(new Set(variants.map(v => v.tamanho))).sort();
  const uniqueCores = Array.from(new Set(variants.map(v => v.cor))).sort();

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Grade de Tamanhos e Cores</h2>
      <div className="overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">Cor / Tamanho</th>
              {uniqueTamanhos.map(tamanho => (
                <th key={tamanho} className="py-2 px-3 text-center text-sm font-semibold text-gray-600">{tamanho}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {uniqueCores.map(cor => (
              <tr key={cor} className="border-b hover:bg-gray-50">
                <td className="py-2 px-3 text-sm text-gray-700 font-medium">{cor}</td>
                {uniqueTamanhos.map(tamanho => {
                  const variant = variants.find(v => v.tamanho === tamanho && v.cor === cor);
                  const estoque = variant ? variant.estoque : 0;
                  return (
                    <td 
                      key={`${cor}-${tamanho}`} 
                      className={`py-2 px-3 text-center text-sm ${estoque > 0 ? 'text-green-700' : 'text-red-700 font-bold'}`}
                    >
                      {estoque}
                    </td>
                  );
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default GradeTamanhosCores;
