import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import api from '../api'; // Assumindo que você tem um arquivo api.js para configurar o axios

const TelaretornoPage = () => {
    const [pedidos, setPedidos] = useState([]);
    const [filteredPedidos, setFilteredPedidos] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [selectedPedido, setSelectedPedido] = useState(null);
    const [pedidoItems, setPedidoItems] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchPedidos();
    }, []);

    const fetchPedidos = async () => {
        try {
            setLoading(true);
            const response = await api.get('/telaretorno_api.php');
            setPedidos(response.data);
            setFilteredPedidos(response.data);
        } catch (err) {
            setError('Erro ao carregar pedidos: ' + err.message);
            console.error('Erro ao carregar pedidos:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleSearch = (e) => {
        const term = e.target.value;
        setSearchTerm(term);
        const lowercasedTerm = term.toLowerCase();
        const filtered = pedidos.filter(pedido =>
            pedido.Pedido.toLowerCase().includes(lowercasedTerm) ||
            pedido.Nomcli.toLowerCase().includes(lowercasedTerm) ||
            pedido.Codcli.toLowerCase().includes(lowercasedTerm) ||
            pedido.Codven.toLowerCase().includes(lowercasedTerm)
        );
        setFilteredPedidos(filtered);
    };

    const handleSelectPedido = async (pedido) => {
        setSelectedPedido(pedido);
        try {
            const response = await api.get(`/telaretorno_api.php/itens/${pedido.Pedido}`);
            setPedidoItems(response.data);
        } catch (err) {
            setError('Erro ao carregar itens do pedido: ' + err.message);
            console.error('Erro ao carregar itens do pedido:', err);
            setPedidoItems([]);
        }
    };

    const handleUpdatePedido = async (updatedPedido) => {
        try {
            await api.put(`/telaretorno_api.php/${updatedPedido.Pedido}`, updatedPedido);
            setPedidos(pedidos.map(p => p.Pedido === updatedPedido.Pedido ? updatedPedido : p));
            setFilteredPedidos(filteredPedidos.map(p => p.Pedido === updatedPedido.Pedido ? updatedPedido : p));
            setSelectedPedido(updatedPedido);
            alert('Pedido atualizado com sucesso!');
        } catch (err) {
            setError('Erro ao atualizar pedido: ' + err.message);
            console.error('Erro ao atualizar pedido:', err);
            alert('Erro ao atualizar pedido.');
        }
    };

    if (loading) {
        return <div>Carregando pedidos...</div>;
    }

    if (error) {
        return <div className="error-message">{error}</div>;
    }

    return (
        <div className="telaretorno-container">
            <h1>Tela de Retorno de Pedidos</h1>

            <div className="search-filter-section">
                <input
                    type="text"
                    placeholder="Buscar por pedido, cliente, vendedor..."
                    value={searchTerm}
                    onChange={handleSearch}
                />
            </div>

            <div className="pedidos-list-section">
                <h2>Pedidos</h2>
                <table className="pedidos-table">
                    <thead>
                        <tr>
                            <th>Pedido</th>
                            <th>Cliente</th>
                            <th>Data Base</th>
                            <th>Situação</th>
                            <th>Valor Total</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {filteredPedidos.map(pedido => (
                            <tr key={pedido.Pedido} onClick={() => handleSelectPedido(pedido)} className={selectedPedido?.Pedido === pedido.Pedido ? 'selected-row' : ''}>
                                <td>{pedido.Pedido}</td>
                                <td>{pedido.Nomcli} ({pedido.Codcli})</td>
                                <td>{pedido.Base}</td>
                                <td>{pedido.Situ}</td>
                                <td>{pedido.Totped}</td>
                                <td>
                                    <button onClick={() => handleSelectPedido(pedido)}>Ver Detalhes</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            {selectedPedido && (
                <div className="pedido-details-section">
                    <h2>Detalhes do Pedido: {selectedPedido.Pedido}</h2>
                    <form onSubmit={(e) => {
                        e.preventDefault();
                        // Lógica para coletar dados do formulário e chamar handleUpdatePedido
                        // Por simplicidade, aqui está um exemplo direto de atualização de status
                        const newSitu = prompt("Nova situação do pedido:", selectedPedido.Situ);
                        if (newSitu !== null) {
                            handleUpdatePedido({ ...selectedPedido, Situ: newSitu });
                        }
                    }}>
                        <div>
                            <label>Situação:</label>
                            <input type="text" value={selectedPedido.Situ} onChange={(e) => setSelectedPedido({ ...selectedPedido, Situ: e.target.value })} />
                        </div>
                        <div>
                            <label>Valor Pago:</label>
                            <input type="number" step="0.01" value={selectedPedido.Valpag} onChange={(e) => setSelectedPedido({ ...selectedPedido, Valpag: parseFloat(e.target.value) })} />
                        </div>
                        <div>
                            <label>Resíduo:</label>
                            <input type="number" step="0.01" value={selectedPedido.Residuo} readOnly />
                        </div>
                        <button type="submit">Atualizar Pedido</button>
                    </form>

                    <h3>Itens do Pedido</h3>
                    {pedidoItems.length > 0 ? (
                        <table className="pedido-items-table">
                            <thead>
                                <tr>
                                    <th>Cód. Artigo</th>
                                    <th>Descrição</th>
                                    <th>Qtd. Saída</th>
                                    <th>Qtd. Retorno</th>
                                    <th>Preço Custo</th>
                                    <th>Preço Venda</th>
                                </tr>
                            </thead>
                            <tbody>
                                {pedidoItems.map(item => (
                                    <tr key={item.Codart}>
                                        <td>{item.Codart}</td>
                                        <td>{item.Descricao}</td>
                                        <td>{item.Qtdsai}</td>
                                        <td>{item.Qtdret}</td>
                                        <td>{item.Precus}</td>
                                        <td>{item.Preven}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    ) : (
                        <p>Nenhum item encontrado para este pedido.</p>
                    )}
                </div>
            )}
        </div>
    );
};

export default TelaretornoPage;