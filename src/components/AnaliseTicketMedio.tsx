import React, { useState, useEffect } from "react";

interface TicketMedioData {
    periodo: string;
    valorMedio: number;
    itensPorPedido: number;
    totalPedidos: number;
    totalVendas: number;
}

const AnaliseTicketMedio: React.FC = () => {
    const [ticketMedioData, setTicketMedioData] = useState<TicketMedioData[]>(
        [],
    );
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchTicketMedioData = async () => {
            setLoading(true);
            setError(null);
            try {
                // This endpoint needs to be implemented in the backend
                const response = await fetch(
                    "http://localhost:3000/api/pedidos/ticket-medio-analysis",
                );
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data: TicketMedioData[] = await response.json();
                setTicketMedioData(data);
            } catch (e: unknown) {
                let message = "Erro desconhecido";
                if (e instanceof Error) {
                    message = e.message;
                }
                setError(
                    `Falha ao carregar dados de Análise de Ticket Médio: ${message}`,
                );
                console.error(
                    "Erro ao carregar dados de Análise de Ticket Médio:",
                    e,
                );
            } finally {
                setLoading(false);
            }
        };

        fetchTicketMedioData();
    }, []);

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando análise de Ticket Médio...
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center p-6 text-red-600">Erro: {error}</div>
        );
    }

    if (ticketMedioData.length === 0) {
        return (
            <div className="text-center p-6">
                Nenhum dado para análise de Ticket Médio encontrado.
            </div>
        );
    }

    return (
        <div className="bg-white p-6 rounded-lg shadow-md mt-6">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">
                Análise de Ticket Médio por Pedido
            </h2>
            <div className="overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200">
                    <thead>
                        <tr className="bg-gray-100 border-b">
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Período
                            </th>
                            <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">
                                Valor Médio
                            </th>
                            <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">
                                Itens por Pedido
                            </th>
                            <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">
                                Total Pedidos
                            </th>
                            <th className="py-3 px-4 text-right text-sm font-semibold text-gray-600">
                                Total Vendas
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {ticketMedioData.map((data, index) => (
                            <tr
                                key={index}
                                className="border-b hover:bg-gray-50"
                            >
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {data.periodo}
                                </td>
                                <td className="py-3 px-4 text-right text-sm text-gray-700">
                                    R$ {data.valorMedio}
                                </td>
                                <td className="py-3 px-4 text-right text-sm text-gray-700">
                                    {data.itensPorPedido}
                                </td>
                                <td className="py-3 px-4 text-right text-sm text-gray-700">
                                    {data.totalPedidos}
                                </td>
                                <td className="py-3 px-4 text-right text-sm text-gray-700">
                                    R$ {data.totalVendas}
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default AnaliseTicketMedio;
