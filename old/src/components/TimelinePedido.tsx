import React, { useState, useEffect } from 'react';

interface PedidoEvento {
  id: number;
  data: string;
  hora: string;
  descricao: string;
  responsavel?: string;
}

interface TimelinePedidoProps {
  pedidoId: number; // The ID of the order for which to display the timeline
}

const TimelinePedido: React.FC<TimelinePedidoProps> = ({ pedidoId }) => {
  const [eventos, setEventos] = useState<PedidoEvento[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchTimelineData = async () => {
      setLoading(true);
      setError(null);
      try {
        // This endpoint needs to be implemented in the backend
        const response = await fetch(`http://localhost:3000/api/pedidos/${pedidoId}/timeline`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: PedidoEvento[] = await response.json();
        setEventos(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar timeline do pedido ${pedidoId}: ${message}`);
        console.error(`Erro ao carregar timeline do pedido ${pedidoId}:`, e);
      } finally {
        setLoading(false);
      }
    };

    fetchTimelineData();
  }, [pedidoId]);

  if (loading) {
    return <div className="text-center p-6">Carregando timeline do pedido...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (eventos.length === 0) {
    return <div className="text-center p-6">Nenhum evento na timeline para este pedido.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md mt-6">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Timeline do Pedido #{pedidoId}</h2>
      <div className="relative border-l-4 border-blue-500 ml-4 pl-4">
        {eventos.map((evento) => (
          <div key={evento.id} className="mb-8 flex items-start">
            <div className="absolute w-4 h-4 bg-blue-500 rounded-full -left-2 mt-1" />
            <div className="ml-6">
              <p className="text-sm text-gray-500">{evento.data} {evento.hora}</p>
              <p className="text-lg font-medium text-gray-900">{evento.descricao}</p>
              {evento.responsavel && <p className="text-sm text-gray-600">Responsável: {evento.responsavel}</p>}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default TimelinePedido;
