import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Modal from "../components/Modal";
import Alerta from "../components/Alerta";
import KanbanPedidos from "../components/KanbanPedidos";
import CalculadoraComissoes from "../components/CalculadoraComissoes";
import AnaliseTicketMedio from "../components/AnaliseTicketMedio";
import SugestorCrossSelling from "../components/SugestorCrossSelling";
import TimelinePedido from "../components/TimelinePedido";
import SimuladorDescontos from "../components/SimuladorDescontos";
import NovoPedido from "./NovoPedido";

interface Pedido {
    id: number;
    numero_pedido: string;
    cliente_nome: string; // Assuming API provides this
    vendedor_nome: string; // Assuming API provides this
    data_pedido: string;
    valor_total: number;
    situacao: string;
}

const Pedidos: React.FC = () => {
    const [pedidos, setPedidos] = useState<Pedido[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [success, setSuccess] = useState<string | null>(null);
    const [showNovoPedido, setShowNovoPedido] = useState(false);
    const [showAdvancedTools, setShowAdvancedTools] = useState(false);
    const [activeTool, setActiveTool] = useState<string | null>(null);
    const [selectedPedidoIdForTimeline, setSelectedPedidoIdForTimeline] =
        useState<number | null>(null);
    const navigate = useNavigate();

    const fetchPedidos = async () => {
        setLoading(true);
        try {
            const response = await fetch("http://localhost:3000/api/pedidos");
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setPedidos(data);
        } catch (e: unknown) {
            const message =
                e instanceof Error
                    ? e.message
                    : "Ocorreu um erro desconhecido.";
            setError(`Falha ao carregar pedidos: ${message}`);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchPedidos();
    }, []);

    const handleSavePedido = (pedidoId: number) => {
        setShowNovoPedido(false);
        fetchPedidos();
        setSuccess("Pedido salvo com sucesso!");
        navigate(`/pedidos/${pedidoId}`);
    };

    const handleToolToggle = (tool: string) => {
        setActiveTool(activeTool === tool ? null : tool);
    };

    if (loading) {
        return <div className="text-center p-6">Carregando pedidos...</div>;
    }

    return (
        <div className="page-container p-6 bg-white shadow-md rounded-lg">
            {success && (
                <Alerta message={success} onClose={() => setSuccess(null)} />
            )}
            {error && <Alerta message={error} onClose={() => setError(null)} />}

            <div className="page-header flex justify-between items-center mb-6">
                <h1 className="text-3xl font-bold text-gray-800">
                    Gerenciar Pedidos
                </h1>
                <div className="flex space-x-4">
                    <button
                        onClick={() => setShowNovoPedido(true)}
                        className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
                    >
                        + Novo Pedido
                    </button>
                    <button
                        onClick={() => setShowAdvancedTools(!showAdvancedTools)}
                        className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-md transition-colors"
                    >
                        {showAdvancedTools
                            ? "Ocultar Ferramentas"
                            : "Ferramentas Avançadas"}
                    </button>
                </div>
            </div>

            <Modal
                isOpen={showNovoPedido}
                onClose={() => setShowNovoPedido(false)}
            >
                <NovoPedido
                    onSave={handleSavePedido}
                    onCancel={() => setShowNovoPedido(false)}
                />
            </Modal>

            {showAdvancedTools && (
                <div className="advanced-tools bg-gray-50 p-4 rounded-lg mb-6 border">
                    <h3 className="text-lg font-semibold mb-4">
                        Ferramentas Avançadas
                    </h3>
                    <div className="flex flex-wrap gap-4 mb-4">
                        <button
                            onClick={() => handleToolToggle("kanban")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "kanban" ? "bg-blue-500 text-white" : "bg-blue-200 hover:bg-blue-300"}`}
                        >
                            Kanban
                        </button>
                        <button
                            onClick={() => handleToolToggle("comissoes")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "comissoes" ? "bg-indigo-500 text-white" : "bg-indigo-200 hover:bg-indigo-300"}`}
                        >
                            Calculadora de Comissões
                        </button>
                        <button
                            onClick={() => handleToolToggle("ticket_medio")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "ticket_medio" ? "bg-purple-500 text-white" : "bg-purple-200 hover:bg-purple-300"}`}
                        >
                            Análise de Ticket Médio
                        </button>
                        <button
                            onClick={() => handleToolToggle("cross_selling")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "cross_selling" ? "bg-orange-500 text-white" : "bg-orange-200 hover:bg-orange-300"}`}
                        >
                            Sugestão de Cross-selling
                        </button>
                        <button
                            onClick={() => handleToolToggle("descontos")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "descontos" ? "bg-red-500 text-white" : "bg-red-200 hover:bg-red-300"}`}
                        >
                            Simulador de Descontos
                        </button>
                        <button
                            onClick={() => handleToolToggle("timeline")}
                            className={`font-bold py-2 px-4 rounded-md ${activeTool === "timeline" ? "bg-green-500 text-white" : "bg-green-200 hover:bg-green-300"}`}
                        >
                            Timeline do Pedido
                        </button>
                    </div>

                    {activeTool === "kanban" && <KanbanPedidos />}
                    {activeTool === "comissoes" && <CalculadoraComissoes />}
                    {activeTool === "ticket_medio" && <AnaliseTicketMedio />}
                    {activeTool === "cross_selling" && <SugestorCrossSelling />}
                    {activeTool === "descontos" && <SimuladorDescontos />}
                    {activeTool === "timeline" && (
                        <div>
                            <div className="mb-4">
                                <label
                                    htmlFor="pedidoIdInput"
                                    className="block text-gray-700 text-sm font-bold mb-2"
                                >
                                    ID do Pedido para Timeline:
                                </label>
                                <input
                                    type="number"
                                    id="pedidoIdInput"
                                    placeholder="Digite o ID do Pedido"
                                    value={selectedPedidoIdForTimeline || ""}
                                    onChange={(e) =>
                                        setSelectedPedidoIdForTimeline(
                                            parseInt(e.target.value) || null,
                                        )
                                    }
                                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                />
                            </div>
                            {selectedPedidoIdForTimeline && (
                                <TimelinePedido
                                    pedidoId={selectedPedidoIdForTimeline}
                                />
                            )}
                        </div>
                    )}
                </div>
            )}

            <div className="table-container overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200">
                    <thead>
                        <tr className="bg-gray-100 border-b">
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Nº Pedido
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Cliente
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Vendedor
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Data
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Valor Total
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Situação
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Ações
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {pedidos.map((pedido) => (
                            <tr
                                key={pedido.id}
                                className="border-b hover:bg-gray-50"
                            >
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {pedido.numero_pedido}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {pedido.cliente_nome}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {pedido.vendedor_nome}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {new Date(
                                        pedido.data_pedido,
                                    ).toLocaleDateString()}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    R$ {pedido.valor_total}
                                </td>
                                <td className="py-3 px-4 text-sm">
                                    <span
                                        className={`px-2 py-1 rounded-full text-xs font-semibold ${
                                            pedido.situacao === "faturado"
                                                ? "bg-green-100 text-green-800"
                                                : "bg-yellow-100 text-yellow-800"
                                        }`}
                                    >
                                        {pedido.situacao}
                                    </span>
                                </td>
                                <td className="py-3 px-4 text-sm">
                                    <button
                                        onClick={() =>
                                            navigate(`/pedidos/${pedido.id}`)
                                        }
                                        className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-1 px-3 rounded-md transition-colors"
                                    >
                                        Detalhes
                                    </button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default Pedidos;
