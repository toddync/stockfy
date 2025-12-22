import React, { useState, useEffect } from "react";

interface FinancialSummary {
    vendasDia: number;
    vendasMes: number;
    ticketMedio: number;
    comparacaoAnterior: number;
}

const ResumoFinanceiro: React.FC = () => {
    const [summary, setSummary] = useState<FinancialSummary | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const fetchSummary = async () => {
            setLoading(true);
            setError(null);
            try {
                const response = await fetch(
                    "http://localhost:3000/api/resumo-financeiro",
                );
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data: FinancialSummary = await response.json();
                setSummary(data);
            } catch (e: unknown) {
                let message = "Erro desconhecido";
                if (e instanceof Error) {
                    message = e.message;
                }
                setError(`Falha ao carregar resumo financeiro: ${message}`);
                console.error("Erro ao carregar resumo financeiro:", e);
            } finally {
                setLoading(false);
            }
        };

        fetchSummary();
    }, []);

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando resumo financeiro...
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center p-6 text-red-600">Erro: {error}</div>
        );
    }

    if (!summary) {
        return (
            <div className="text-center p-6">
                Nenhum dado de resumo financeiro disponível.
            </div>
        );
    }

    return (
        <div className="bg-white p-6 rounded-lg shadow-md">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">
                Resumo Financeiro em Tempo Real
            </h2>
            <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col items-center justify-center p-4 bg-blue-50 rounded-lg">
                    <p className="text-sm text-gray-500">Vendas do Dia</p>
                    <p className="text-2xl font-bold text-blue-600">
                        R$ {summary.vendasDia}
                    </p>
                </div>
                <div className="flex flex-col items-center justify-center p-4 bg-green-50 rounded-lg">
                    <p className="text-sm text-gray-500">Vendas do Mês</p>
                    <p className="text-2xl font-bold text-green-600">
                        R$ {summary.vendasMes}
                    </p>
                </div>
                <div className="flex flex-col items-center justify-center p-4 bg-purple-50 rounded-lg">
                    <p className="text-sm text-gray-500">Ticket Médio</p>
                    <p className="text-2xl font-bold text-purple-600">
                        R$ {summary.ticketMedio}
                    </p>
                </div>
                <div className="flex flex-col items-center justify-center p-4 bg-yellow-50 rounded-lg">
                    <p className="text-sm text-gray-500">Comparação Anterior</p>
                    <p className="text-2xl font-bold text-yellow-600">
                        +{summary.comparacaoAnterior}%
                    </p>
                </div>
            </div>
        </div>
    );
};

export default ResumoFinanceiro;
