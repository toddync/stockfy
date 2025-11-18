import React, { useState, useEffect } from 'react';

interface ABCItem {
  id: number;
  nome: string;
  valorTotalVendas: number;
  porcentagemAcumulada: number;
  classe: 'A' | 'B' | 'C';
}



const ClassificadorABC: React.FC = () => {
  const [abcData, setAbcData] = useState<ABCItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchABCData = async () => {
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch('http://localhost:3000/api/produtos/abc-analysis');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: ABCItem[] = await response.json();
        setAbcData(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar dados da Curva ABC: ${message}`);
        console.error("Erro ao carregar dados da Curva ABC:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchABCData();
  }, []);

  if (loading) {
    return <div className="text-center p-6">Carregando análise de Curva ABC...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (abcData.length === 0) {
    return <div className="text-center p-6">Nenhum dado para análise de Curva ABC encontrado.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Análise de Curva ABC</h2>
      <div className="overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200">
          <thead>
            <tr className="bg-gray-100 border-b">
              <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">Produto</th>
              <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">Valor Total Vendas</th>
              <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">Acumulado (%)</th>
              <th className="py-3 px-4 text-center text-sm font-semibold text-gray-600">Classe ABC</th>
            </tr>
          </thead>
          <tbody>
            {abcData.map(item => (
              <tr key={item.id} className="border-b hover:bg-gray-50">
                <td className="py-3 px-4 text-sm text-gray-700">{item.nome}</td>
                <td className="py-3 px-4 text-right text-sm text-gray-700">R$ {item.valorTotalVendas.toFixed(2)}</td>
                <td className="py-3 px-4 text-right text-sm text-gray-700">{item.porcentagemAcumulada.toFixed(2)}%</td>
                <td className="py-3 px-4 text-center text-sm font-bold">
                  <span className={`px-2 py-1 rounded-full text-xs ${
                    item.classe === 'A' ? 'bg-green-100 text-green-800' :
                    item.classe === 'B' ? 'bg-yellow-100 text-yellow-800' :
                    'bg-red-100 text-red-800'
                  }`}>
                    {item.classe}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default ClassificadorABC;
