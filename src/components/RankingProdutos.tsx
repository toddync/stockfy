import React, { useState, useEffect } from 'react';

interface ProdutoVendido {
  id: number;
  nome: string;
  quantidade: number;
  valor: number;
}

const RankingProdutos: React.FC = () => {
  const [topProdutos, setTopProdutos] = useState<ProdutoVendido[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchRanking = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch('http://localhost:3000/api/ranking-produtos');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: ProdutoVendido[] = await response.json();
        setTopProdutos(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar ranking de produtos: ${message}`);
        console.error("Erro ao carregar ranking de produtos:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchRanking();
  }, []);

  if (loading) {
    return <div className="text-center p-6">Carregando ranking de produtos...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (topProdutos.length === 0) {
    return <div className="text-center p-6">Nenhum produto no ranking disponível.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Ranking de Produtos Mais Vendidos (Últimas 4 Semanas)</h2>
      <ul className="divide-y divide-gray-200">
        {topProdutos.map((produto, index) => (
          <li key={produto.id} className="py-3 flex justify-between items-center">
            <div className="flex items-center">
              <span className="text-lg font-bold text-gray-600 mr-3">{index + 1}.</span>
              <p className="text-gray-700 font-medium">{produto.nome}</p>
            </div>
            <div className="text-right">
              <p className="text-sm text-gray-600">{produto.quantidade} unidades</p>
              <p className="text-md font-semibold text-green-600">R$ {produto.valor}</p>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default RankingProdutos;
