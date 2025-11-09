import React, { useState, useEffect } from 'react';

interface GrupoVendas {
  grupo: string;
  vendas: number;
  cor: string; // traffic light color based on sales performance
}

const HeatmapVendasGrupos: React.FC = () => {
  const [heatmapData, setHeatmapData] = useState<GrupoVendas[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchHeatmapData = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch('http://localhost:3000/api/heatmap-vendas-grupos');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: GrupoVendas[] = await response.json();
        setHeatmapData(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar mapa de calor de vendas: ${message}`);
        console.error("Erro ao carregar mapa de calor de vendas:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchHeatmapData();
  }, []);

  if (loading) {
    return <div className="text-center p-6">Carregando mapa de calor...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (heatmapData.length === 0) {
    return <div className="text-center p-6">Nenhum dado de mapa de calor disponível.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Mapa de Calor de Vendas por Grupo</h2>
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {heatmapData.map((data, index) => (
          <div 
            key={index} 
            className={`p-4 rounded-lg text-white font-bold flex flex-col items-center justify-center`}
            style={{ backgroundColor: data.cor }}
          >
            <p className="text-lg">{data.grupo}</p>
            <p className="text-2xl">R$ {data.vendas.toFixed(2)}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default HeatmapVendasGrupos;
