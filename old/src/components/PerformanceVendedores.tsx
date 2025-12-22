import React, { useState, useEffect } from "react";

interface VendedorPerformance {
    id: number;
    nome: string;
    vendasMes: number;
    metaMes: number;
    comissao: number;
    conversao: number; // percentage
}

const PerformanceVendedores: React.FC = () => {
    const [performanceData, setPerformanceData] = useState<
        VendedorPerformance[]
    >([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchPerformanceData = async () => {
            setLoading(true);
            setError(null);
            try {
                const response = await fetch(
                    "http://localhost:3000/api/performance-vendedores",
                );
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data: VendedorPerformance[] = await response.json();
                setPerformanceData(data);
            } catch (e: unknown) {
                let message = "Erro desconhecido";
                if (e instanceof Error) {
                    message = e.message;
                }
                setError(
                    `Falha ao carregar performance de vendedores: ${message}`,
                );
                console.error("Erro ao carregar performance de vendedores:", e);
            } finally {
                setLoading(false);
            }
        };

        fetchPerformanceData();
    }, []);

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando performance de vendedores...
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center p-6 text-red-600">Erro: {error}</div>
        );
    }

    if (performanceData.length === 0) {
        return (
            <div className="text-center p-6">
                Nenhum dado de performance de vendedor disponível.
            </div>
        );
    }

    return (
        <div className="bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">
                Performance por Vendedor
            </h2>
            <div className="overflow-x-auto">
                <table className="min-w-full bg-white">
                    <thead>
                        <tr className="bg-gray-100 border-b">
                            <th className="py-2 px-4 text-left text-sm font-semibold text-gray-600">
                                Vendedor
                            </th>
                            <th className="py-2 px-4 text-left text-sm font-semibold text-gray-600">
                                Vendas Mês
                            </th>
                            <th className="py-2 px-4 text-left text-sm font-semibold text-gray-600">
                                Meta Mês
                            </th>
                            <th className="py-2 px-4 text-left text-sm font-semibold text-gray-600">
                                Comissão
                            </th>
                            <th className="py-2 px-4 text-left text-sm font-semibold text-gray-600">
                                Conversão
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {performanceData.map((vendedor) => (
                            <tr
                                key={vendedor.id}
                                className="border-b hover:bg-gray-50"
                            >
                                <td className="py-2 px-4 text-sm text-gray-700">
                                    {vendedor.nome}
                                </td>
                                <td className="py-2 px-4 text-sm text-gray-700">
                                    R${" "}
                                    {vendedor.vendasMes
                                        ? vendedor.vendasMes
                                        : "N/A"}
                                </td>
                                <td className="py-2 px-4 text-sm text-gray-700">
                                    R${" "}
                                    {vendedor.metaMes
                                        ? vendedor.metaMes
                                        : "N/A"}
                                </td>
                                <td className="py-2 px-4 text-sm text-gray-700">
                                    R${" "}
                                    {vendedor.comissao
                                        ? vendedor.comissao
                                        : "N/A"}
                                </td>
                                <td className="py-2 px-4 text-sm text-gray-700">
                                    {vendedor.conversao
                                        ? vendedor.conversao
                                        : "N/A"}
                                    %
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default PerformanceVendedores;
