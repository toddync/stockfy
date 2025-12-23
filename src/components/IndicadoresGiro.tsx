import React, { useState, useEffect } from 'react';

interface IndicadoresGiroData {
  taxaGiro: number; // times per period
  coberturaEstoque: number; // days
  diasVendaCobertos: number; // days
}

const IndicadoresGiro: React.FC = () => {
  const [giroData, setGiroData] = useState<IndicadoresGiroData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchGiroData = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch('http://localhost:3000/api/indicadores-giro');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: IndicadoresGiroData = await response.json();
        setGiroData(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar indicadores de giro: ${message}`);
        console.error("Erro ao carregar indicadores de giro:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchGiroData();
  }, []);

  if (loading) {
    return <div className="text-center p-6">Carregando indicadores de giro...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (!giroData) {
    return <div className="text-center p-6">Nenhum indicador de giro disponível.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Indicadores de Giro de Estoque</h2>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="flex flex-col items-center justify-center p-4 bg-blue-50 rounded-lg">
          <p className="text-sm text-gray-500">Taxa de Giro</p>
          <p className="text-2xl font-bold text-blue-600">{giroData.taxaGiro}x</p>
        </div>
        <div className="flex flex-col items-center justify-center p-4 bg-green-50 rounded-lg">
          <p className="text-sm text-gray-500">Cobertura de Estoque</p>
          <p className="text-2xl font-bold text-green-600">{giroData.coberturaEstoque} dias</p>
        </div>
        <div className="flex flex-col items-center justify-center p-4 bg-purple-50 rounded-lg">
          <p className="text-sm text-gray-500">Dias de Venda Cobertos</p>
          <p className="text-2xl font-bold text-purple-600">{giroData.diasVendaCobertos} dias</p>
        </div>
      </div>
    </div>
  );
};

export default IndicadoresGiro;
