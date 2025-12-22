import React, { useState, useEffect } from "react";
// Assuming a charting library like Chart.js or Recharts would be used here
// For now, this will be a placeholder component

interface TendenciaData {
    mes: string;
    vendasAnoAtual: number;
    vendasAnoAnterior: number;
}

const GraficoTendencias: React.FC = () => {
    const [tendenciaData, setTendenciaData] = useState<TendenciaData[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchTendenciaData = async () => {
            setLoading(true);
            setError(null);
            try {
                const response = await fetch(
                    "http://localhost:3000/api/grafico-tendencias",
                );
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data: TendenciaData[] = await response.json();
                setTendenciaData(data);
            } catch (e: unknown) {
                let message = "Erro desconhecido";
                if (e instanceof Error) {
                    message = e.message;
                }
                setError(`Falha ao carregar dados de tendência: ${message}`);
                console.error("Erro ao carregar dados de tendência:", e);
            } finally {
                setLoading(false);
            }
        };

        fetchTendenciaData();
    }, []);

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando gráfico de tendências...
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center p-6 text-red-600">Erro: {error}</div>
        );
    }

    if (tendenciaData.length === 0) {
        return (
            <div className="text-center p-6">
                Nenhum dado de tendência disponível.
            </div>
        );
    }

    return (
        <div className="bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">
                Gráfico de Tendências Sazonais
            </h2>
            <div className="h-64 flex items-center justify-center bg-gray-100 rounded-md text-gray-500">
                {/* Placeholder for a chart */}
                <p>Gráfico de Vendas por Mês/Estação (Dados de Exemplo)</p>
                <ul className="list-disc list-inside mt-2">
                    {tendenciaData.map((item, index) => (
                        <li key={index}>
                            {item.mes}: Ano Atual - R$ {item.vendasAnoAtual},
                            Ano Anterior - R$ {item.vendasAnoAnterior}
                        </li>
                    ))}
                </ul>
            </div>
        </div>
    );
};

export default GraficoTendencias;
