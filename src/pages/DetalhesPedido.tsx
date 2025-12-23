import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import FormularioItemPedido from "../components/FormularioItemPedido";
import Alerta from "../components/Alerta"; // Import Alerta

interface ItemPedido {
    id: number;
    produto_id: number;
    produto_descricao: string;
    produto_codigo: string;
    quantidade: number;
    preco_unitario: number;
    valor_total: number;
    tamanho?: string;
    cor?: string;
}

interface Pedido {
    id: number;
    numero_pedido: string;
    cliente_nome: string;
    data_pedido: string;
    valor_total: number;
    situacao: string;
    itens: ItemPedido[];
}

const DetalhesPedido: React.FC = () => {
    const { id: pedidoId } = useParams<{ id: string }>();
    const [pedido, setPedido] = useState<Pedido | null>(null);
    const [editandoItem, setEditandoItem] = useState<ItemPedido | null>(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [success, setSuccess] = useState<string | null>(null); // Add success state

    useEffect(() => {
        if (pedidoId) {
            carregarPedido();
        }
    }, [pedidoId]);

    const carregarPedido = React.useCallback(async () => {
        setLoading(true);
        setError(null);
        // Do not reset success here so message can persist after reload
        try {
            const response = await fetch(
                `http://localhost:3000/api/pedidos/${pedidoId}/detalhes`,
            ); // New endpoint for detailed order
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data: Pedido = await response.json();
            setPedido(data);
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao carregar detalhes do pedido: ${message}`);
            console.error("Erro ao carregar detalhes do pedido:", e);
        } finally {
            setLoading(false);
        }
    }, [pedidoId, setPedido, setError, setLoading]);

    const removerItem = async (itemId: number) => {
        if (!window.confirm("Confirmar exclusão do item?")) {
            return;
        }
        setError(null);
        setSuccess(null); // Reset success message
        try {
            const response = await fetch(
                `http://localhost:3000/api/pedidos/${pedidoId}/itens/${itemId}`,
                {
                    method: "DELETE",
                },
            );
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            carregarPedido();
            setSuccess("Item do pedido excluído com sucesso!"); // Set success message
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao remover item: ${message}`);
            console.error("Erro ao remover item:", e);
        }
    };

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando detalhes do pedido...
            </div>
        );
    }

    // Error display from the initial load should still show.
    // The Alerta component will handle subsequent errors from save/delete.

    if (!pedido) {
        return <div className="text-center p-6">Pedido não encontrado.</div>;
    }

    return (
        <div className="page-container p-6 bg-gray-50 min-h-screen">
            {/* Display Alerta for success and error messages */}
            {success && (
                <Alerta message={success} onClose={() => setSuccess(null)} />
            )}
            {error && <Alerta message={error} onClose={() => setError(null)} />}

            <div className="detalhes-pedido bg-white shadow-md rounded-lg p-6">
                {/* Cabeçalho do Pedido */}
                <div className="pedido-header border-b pb-4 mb-4 flex justify-between items-center">
                    <div>
                        <h1 className="text-3xl font-bold text-gray-800">
                            Pedido #{pedido.numero_pedido}
                        </h1>
                        <div className="pedido-info text-gray-600 text-sm mt-1">
                            <span>
                                Cliente:{" "}
                                <span className="font-medium">
                                    {pedido.cliente_nome}
                                </span>
                            </span>
                            <span className="ml-4">
                                Data:{" "}
                                <span className="font-medium">
                                    {new Date(
                                        pedido.data_pedido,
                                    ).toLocaleDateString()}
                                </span>
                            </span>
                            <span className="ml-4">
                                Status:{" "}
                                <span
                                    className={`font-medium px-2 py-1 rounded-full text-xs ${
                                        pedido.situacao === "faturado"
                                            ? "bg-green-100 text-green-800"
                                            : pedido.situacao === "pendente"
                                              ? "bg-yellow-100 text-yellow-800"
                                              : "bg-gray-100 text-gray-800"
                                    }`}
                                >
                                    {pedido.situacao}
                                </span>
                            </span>
                        </div>
                    </div>
                    <div className="text-right">
                        <span className="text-lg text-gray-700">Total: </span>
                        <span className="text-2xl font-bold text-green-700">
                            R$ {pedido.valor_total}
                        </span>
                    </div>
                </div>

                {/* Lista de Itens do Pedido */}
                <div className="itens-pedido-section mt-6">
                    <div className="section-header flex justify-between items-center mb-4">
                        <h2 className="text-2xl font-semibold text-gray-800">
                            Itens do Pedido
                        </h2>
                        <button
                            onClick={() => setEditandoItem({} as ItemPedido)}
                            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
                        >
                            + Adicionar Item
                        </button>
                    </div>

                    <div className="itens-list grid grid-cols-1 gap-4">
                        {pedido.itens.length === 0 ? (
                            <p className="text-gray-500 text-center">
                                Nenhum item neste pedido.
                            </p>
                        ) : (
                            pedido.itens.map((item) => (
                                <div
                                    key={item.id}
                                    className="item-card bg-gray-50 border border-gray-200 rounded-lg p-4 flex justify-between items-center"
                                >
                                    <div className="item-info flex-grow">
                                        <div className="item-descricao text-gray-800 font-medium">
                                            <strong>
                                                {item.produto_descricao}
                                            </strong>
                                            <span className="ml-2 text-sm text-gray-600">
                                                Cód: {item.produto_codigo}
                                            </span>
                                            {item.tamanho && (
                                                <span className="ml-2 text-sm text-gray-600">
                                                    Tamanho: {item.tamanho}
                                                </span>
                                            )}
                                            {item.cor && (
                                                <span className="ml-2 text-sm text-gray-600">
                                                    Cor: {item.cor}
                                                </span>
                                            )}
                                        </div>
                                        <div className="item-quantidade text-gray-700 text-sm mt-1">
                                            {item.quantidade} × R${" "}
                                            {item.preco_unitario}
                                        </div>
                                    </div>
                                    <div className="item-total text-right mr-4">
                                        <span className="text-lg font-semibold text-gray-800">
                                            R$ {item.valor_total}
                                        </span>
                                    </div>
                                    <div className="item-actions flex space-x-2">
                                        <button
                                            onClick={() =>
                                                setEditandoItem(item)
                                            }
                                            className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md text-sm transition-colors"
                                        >
                                            Editar
                                        </button>
                                        <button
                                            onClick={() => removerItem(item.id)}
                                            className="bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded-md text-sm transition-colors"
                                        >
                                            Remover
                                        </button>
                                    </div>
                                </div>
                            ))
                        )}
                    </div>
                </div>

                {/* Formulário para Adicionar/Editar Item */}
                {editandoItem && (
                    <FormularioItemPedido
                        item={editandoItem.id ? editandoItem : null} // Pass null for new item
                        pedidoId={parseInt(pedidoId || "0")}
                        onSave={() => {
                            setEditandoItem(null);
                            carregarPedido();
                        }}
                        onCancel={() => setEditandoItem(null)}
                    />
                )}
            </div>
        </div>
    );
};

export default DetalhesPedido;
