import React, { useState, useEffect } from 'react';
import '../../css/perdido.css'; // Importa o CSS

const PerdidoPage = () => {
    const [pedidoId, setPedidoId] = useState('');
    const [pedido, setPedido] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const [message, setMessage] = useState('');

    const API_URL = 'http://localhost/refactor/php/api/perdidos_api.php'; // Ajuste conforme sua configuração

    const fetchPedido = async (id) => {
        setLoading(true);
        setError(null);
        setMessage('');
        try {
            const response = await fetch(`${API_URL}?id=${id}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setPedido(data);
        } catch (e) {
            setError("Erro ao carregar pedido: " + e.message);
            setPedido(null);
        } finally {
            setLoading(false);
        }
    };

    const handleSearch = () => {
        if (pedidoId) {
            fetchPedido(pedidoId);
        } else {
            setMessage("Por favor, digite o número do pedido.");
        }
    };

    const handleUpdateStatus = async (newStatus) => {
        if (!pedido || !pedido.id) return;

        setLoading(true);
        setError(null);
        setMessage('');
        try {
            const response = await fetch(API_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ id: pedido.id, status: newStatus }),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();
            setMessage(result.message || "Status do pedido atualizado com sucesso!");
            fetchPedido(pedido.id); // Recarrega o pedido para refletir a mudança
        } catch (e) {
            setError("Erro ao atualizar status: " + e.message);
        } finally {
            setLoading(false);
        }
    };

    const handleUpdateItemQuantity = async (itemId, currentQuantity, newQuantity) => {
        if (!pedido || !pedido.id) return;

        // Validação básica para garantir que a nova quantidade é um número e não é negativa
        const parsedQuantity = parseFloat(newQuantity);
        if (isNaN(parsedQuantity) || parsedQuantity < 0) {
            setMessage("Quantidade inválida. Por favor, insira um número positivo.");
            return;
        }

        setLoading(true);
        setError(null);
        setMessage('');
        try {
            const response = await fetch(API_URL, {
                method: 'POST', // Usando POST para atualização de item, como definido na API
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    pedido_id: pedido.id,
                    item_id: itemId,
                    quantidade: parsedQuantity,
                }),
            });
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();
            setMessage(result.message || "Quantidade do item atualizada com sucesso!");
            fetchPedido(pedido.id); // Recarrega o pedido para refletir a mudança
        } catch (e) {
            setError("Erro ao atualizar quantidade do item: " + e.message);
        } finally {
            setLoading(false);
        }
    };

    const handleClosePedido = () => {
        if (window.confirm("Tem certeza que deseja fechar este pedido e marcá-lo como 'perdido'?")) {
            handleUpdateStatus('perdido');
            // Limpar campos após fechar, similar ao Delphi
            setPedidoId('');
            setPedido(null);
            setMessage('Pedido fechado e marcado como perdido.');
        }
    };

    const handleCancel = () => {
        setPedidoId('');
        setPedido(null);
        setMessage('Operação cancelada. Campos limpos.');
        setError(null);
    };

    const formatCurrency = (value) => {
        return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(value);
    };

    return (
        <div className="perdido-container">
            <h1>Gerenciamento de Pedidos Perdidos</h1>

            <div className="input-section">
                <label htmlFor="pedidoId">Número do Pedido:</label>
                <input
                    type="text"
                    id="pedidoId"
                    value={pedidoId}
                    onChange={(e) => setPedidoId(e.target.value)}
                    placeholder="Digite o ID do pedido"
                />
                <button onClick={handleSearch} disabled={loading}>Buscar Pedido</button>
                <button onClick={handleCancel} disabled={loading}>Limpar/Cancelar</button>
            </div>

            {loading && <p>Carregando...</p>}
            {error && <p className="error-message">{error}</p>}
            {message && <p className="info-message">{message}</p>}

            {pedido && (
                <div className="pedido-details">
                    <h2>Detalhes do Pedido #{pedido.id}</h2>
                    <p><strong>Cliente:</strong> {pedido.cliente_nome} ({pedido.cliente_id})</p>
                    <p><strong>Vendedor:</strong> {pedido.vendedor_nome} ({pedido.vendedor_id})</p>
                    <p><strong>Data de Emissão:</strong> {pedido.data_emissao}</p>
                    <p><strong>Data de Entrega:</strong> {pedido.data_entrega}</p>
                    <p><strong>Valor Total:</strong> {formatCurrency(pedido.valor_total)}</p>
                    <p><strong>Status:</strong> {pedido.status}</p>
                    <p><strong>Observações:</strong> {pedido.observacoes || 'N/A'}</p>

                    <h3>Itens do Pedido</h3>
                    {pedido.itens && pedido.itens.length > 0 ? (
                        <table className="items-table">
                            <thead>
                                <tr>
                                    <th>ID Item</th>
                                    <th>Produto</th>
                                    <th>Qtd. Saída</th>
                                    <th>Preço Unit.</th>
                                    <th>Valor Total</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {pedido.itens.map(item => (
                                    <tr key={item.id}>
                                        <td>{item.id}</td>
                                        <td>{item.produto_descricao}</td>
                                        <td>
                                            <input
                                                type="number"
                                                value={item.quantidade}
                                                onChange={(e) => {
                                                    // Atualiza o estado local temporariamente para refletir a mudança no input
                                                    const newItems = pedido.itens.map(i =>
                                                        i.id === item.id ? { ...i, quantidade: e.target.value } : i
                                                    );
                                                    setPedido({ ...pedido, itens: newItems });
                                                }}
                                                onBlur={(e) => handleUpdateItemQuantity(item.id, item.quantidade, e.target.value)}
                                                className="quantity-input"
                                            />
                                        </td>
                                        <td>{formatCurrency(item.preco_unitario)}</td>
                                        <td>{formatCurrency(item.valor_total)}</td>
                                        <td>
                                            <button onClick={() => handleUpdateItemQuantity(item.id, item.quantidade, item.quantidade)} disabled={loading}>
                                                Atualizar Item
                                            </button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <p>Nenhum item encontrado para este pedido.</p>
                    )}

                    <div className="action-buttons">
                        <button onClick={handleClosePedido} disabled={loading}>Fechar Pedido (Marcar como Perdido)</button>
                    </div>
                </div>
            )}
        </div>
    );
};

export default PerdidoPage;