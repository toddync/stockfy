import React, { useState, useEffect } from "react";

interface Pedido {
    id: number;
    numero_pedido: string;
    cliente_nome: string;
    data_pedido: string;
    valor_total: number;
    situacao:
        | "orcamento"
        | "confirmado"
        | "separacao"
        | "entregue"
        | "cancelado";
}

interface KanbanColumnProps {
    title: string;
    status: Pedido["situacao"];
    pedidos: Pedido[];
    onDragStart: (e: React.DragEvent, id: number) => void;
    onDragOver: (e: React.DragEvent) => void;
    onDrop: (e: React.DragEvent, status: Pedido["situacao"]) => void;
}

const KanbanColumn: React.FC<KanbanColumnProps> = ({
    title,
    status,
    pedidos,
    onDragStart,
    onDragOver,
    onDrop,
}) => {
    return (
        <div
            className="kanban-column bg-gray-100 p-4 rounded-lg shadow-md w-72 flex-shrink-0"
            onDragOver={onDragOver}
            onDrop={(e) => onDrop(e, status)}
        >
            <h3 className="font-bold text-lg mb-4 text-gray-800">
                {title} ({pedidos.length})
            </h3>
            {pedidos.map((pedido) => (
                <div
                    key={pedido.id}
                    className="kanban-card bg-white p-3 mb-3 rounded-md shadow-sm border border-gray-200 cursor-grab"
                    draggable
                    onDragStart={(e) => onDragStart(e, pedido.id)}
                >
                    <p className="font-semibold text-blue-600">
                        #{pedido.numero_pedido}
                    </p>
                    <p className="text-sm text-gray-700">
                        {pedido.cliente_nome}
                    </p>
                    <p className="text-xs text-gray-500">
                        Total: R$ {pedido.valor_total}
                    </p>
                </div>
            ))}
        </div>
    );
};

const KanbanPedidos: React.FC = () => {
    const [pedidos, setPedidos] = useState<Pedido[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    const statuses: { title: string; status: Pedido["situacao"] }[] = [
        { title: "Orçamento", status: "orcamento" },
        { title: "Confirmado", status: "confirmado" },
        { title: "Em Separação", status: "separacao" },
        { title: "Entregue", status: "entregue" },
        { title: "Cancelado", status: "cancelado" },
    ];

    useEffect(() => {
        fetchPedidos();
    }, []);

    const fetchPedidos = async () => {
        setLoading(true);
        setError(null);
        try {
            // This endpoint needs to be implemented in the backend
            const response = await fetch("http://localhost:3000/api/pedidos");
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data: Pedido[] = await response.json();
            setPedidos(data);
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao carregar pedidos: ${message}`);
            console.error("Erro ao carregar pedidos:", e);
        } finally {
            setLoading(false);
        }
    };

    const onDragStart = (e: React.DragEvent, id: number) => {
        e.dataTransfer.setData("pedidoId", id.toString());
    };

    const onDragOver = (e: React.DragEvent) => {
        e.preventDefault();
    };

    const onDrop = async (
        e: React.DragEvent,
        newStatus: Pedido["situacao"],
    ) => {
        const pedidoId = parseInt(e.dataTransfer.getData("pedidoId"));
        const updatedPedidos = pedidos.map((pedido) =>
            pedido.id === pedidoId
                ? { ...pedido, situacao: newStatus }
                : pedido,
        );
        setPedidos(updatedPedidos);

        // In a real application, you would send this update to the backend
        try {
            const response = await fetch(
                `http://localhost:3000/api/pedidos/${pedidoId}`,
                {
                    method: "PUT",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({ situacao: newStatus }),
                },
            );
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            console.log(
                `Pedido ${pedidoId} atualizado para ${newStatus} no backend.`,
            );
        } catch (e: unknown) {
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao atualizar pedido no backend: ${message}`);
            console.error("Erro ao atualizar pedido no backend:", e);
            // Optionally revert the UI change if backend update fails
            fetchPedidos();
        }
    };

    if (loading) {
        return (
            <div className="text-center p-6">
                Carregando Kanban de Pedidos...
            </div>
        );
    }

    if (error) {
        return (
            <div className="text-center p-6 text-red-600">Erro: {error}</div>
        );
    }

    return (
        <div className="kanban-board flex space-x-4 overflow-x-auto p-6 bg-white shadow-md rounded-lg">
            {statuses.map((col) => (
                <KanbanColumn
                    key={col.status}
                    title={col.title}
                    status={col.status}
                    pedidos={pedidos.filter(
                        (pedido) => pedido.situacao === col.status,
                    )}
                    onDragStart={onDragStart}
                    onDragOver={onDragOver}
                    onDrop={onDrop}
                />
            ))}
        </div>
    );
};

export default KanbanPedidos;
