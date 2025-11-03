import React, { useState, useEffect } from 'react';
import '../../css/voltaret.css';

const VoltaretPage = () => {
    const [password, setPassword] = useState('');
    const [pedidoNumber, setPedidoNumber] = useState('');
    const [pedidoDetails, setPedidoDetails] = useState(null);
    const [items, setItems] = useState([]);
    const [totals, setTotals] = useState({ totalPedido: 0, totalRetornado: 0 });
    const [returnDate, setReturnDate] = useState('');
    const [statusMessage, setStatusMessage] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    useEffect(() => {
        const today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
        const yyyy = today.getFullYear();
        setReturnDate(`${dd}/${mm}/${yyyy}`);
        handleClearClick(); // Limpa os campos ao iniciar
    }, []);

    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
    };

    const handlePedidoNumberChange = (e) => {
        setPedidoNumber(e.target.value);
        if (statusMessage) setStatusMessage(''); // Limpa a mensagem de status ao digitar
    };

    const handlePedidoNumberBlur = async () => {
        if (!pedidoNumber) {
            setPedidoDetails(null);
            setItems([]);
            setTotals({ totalPedido: 0, totalRetornado: 0 });
            return;
        }

        setIsLoading(true);
        setStatusMessage('Buscando detalhes do pedido...');
        try {
            const response = await fetch(`http://localhost/rosa/refactor/php/api/voltaret_api.php?numeroPedido=${pedidoNumber}`);
            const data = await response.json();

            if (response.ok) {
                setPedidoDetails(data.pedido);
                setItems(data.itens);

                const totalPedido = data.itens.reduce((sum, item) => sum + (parseFloat(item.Qtdsai) * parseFloat(item.Preven)), 0);
                const totalRetornado = data.itens.reduce((sum, item) => sum + (parseFloat(item.Qtdret) * parseFloat(item.Preven)), 0);
                setTotals({ totalPedido, totalRetornado });
                setStatusMessage('');
            } else {
                setPedidoDetails(null);
                setItems([]);
                setTotals({ totalPedido: 0, totalRetornado: 0 });
                setStatusMessage(data.message || 'Erro ao buscar pedido.');
            }
        } catch (error) {
            console.error('Erro ao buscar pedido:', error);
            setStatusMessage('Erro de conexão ao buscar pedido.');
            setPedidoDetails(null);
            setItems([]);
            setTotals({ totalPedido: 0, totalRetornado: 0 });
        } finally {
            setIsLoading(false);
        }
    };

    const handleRestoreClick = async () => {
        if (!pedidoNumber) {
            setStatusMessage('Por favor, informe o número do pedido.');
            return;
        }
        if (!password) {
            setStatusMessage('Por favor, informe a senha.');
            return;
        }

        if (!window.confirm(`Confirma o desfazimento do retorno do pedido ${pedidoNumber}?`)) {
            return;
        }

        setIsLoading(true);
        setStatusMessage('Restaurando pedido...');
        try {
            const response = await fetch('http://localhost/rosa/refactor/php/api/voltaret_api.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ numeroPedido: pedidoNumber, password: password }),
            });
            const data = await response.json();

            if (response.ok) {
                setStatusMessage(data.message);
                handleClearClick(); // Limpa os campos após sucesso
            } else {
                setStatusMessage(data.message || 'Erro ao restaurar pedido.');
            }
        } catch (error) {
            console.error('Erro ao restaurar pedido:', error);
            setStatusMessage('Erro de conexão ao restaurar pedido.');
        } finally {
            setIsLoading(false);
        }
    };

    const handleClearClick = () => {
        setPassword('');
        setPedidoNumber('');
        setPedidoDetails(null);
        setItems([]);
        setTotals({ totalPedido: 0, totalRetornado: 0 });
        setStatusMessage('');
        setIsLoading(false);
    };

    return (
        <div className="voltaret-container">
            <h2>Desfazer Retorno de Pedido</h2>
            <div className="form-group">
                <label htmlFor="password">Senha:</label>
                <input
                    type="password"
                    id="password"
                    value={password}
                    onChange={handlePasswordChange}
                    disabled={isLoading}
                />
            </div>
            <div className="form-group">
                <label htmlFor="pedidoNumber">Número do Pedido:</label>
                <input
                    type="text"
                    id="pedidoNumber"
                    value={pedidoNumber}
                    onChange={handlePedidoNumberChange}
                    onBlur={handlePedidoNumberBlur}
                    disabled={isLoading}
                />
                <button onClick={handleRestoreClick} disabled={isLoading || !pedidoDetails}>
                    Restaurar Pedido
                </button>
                <button onClick={handleClearClick} disabled={isLoading}>
                    Limpar
                </button>
            </div>

            {statusMessage && <p className="status-message">{statusMessage}</p>}
            {isLoading && <p>Carregando...</p>}

            {pedidoDetails && (
                <div className="pedido-details">
                    <h3>Detalhes do Pedido {pedidoDetails.Pedido}</h3>
                    <p><strong>Cliente:</strong> {pedidoDetails.Nomcli}</p>
                    <p><strong>Data do Pedido:</strong> {pedidoDetails.Datped}</p>
                    <p><strong>Situação:</strong> {pedidoDetails.Situ}</p>
                    <p><strong>Total Pedido:</strong> R$ {totals.totalPedido.toFixed(2)}</p>
                    <p><strong>Total Retornado:</strong> R$ {totals.totalRetornado.toFixed(2)}</p>
                    <p><strong>Data de Retorno:</strong> {returnDate}</p>

                    <h4>Itens do Pedido:</h4>
                    {items.length > 0 ? (
                        <table className="items-table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descrição</th>
                                    <th>Qtd Saída</th>
                                    <th>Qtd Retornada</th>
                                    <th>Preço Venda</th>
                                </tr>
                            </thead>
                            <tbody>
                                {items.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.Codart}</td>
                                        <td>{item.Descricao}</td>
                                        <td>{parseFloat(item.Qtdsai).toFixed(2)}</td>
                                        <td>{parseFloat(item.Qtdret).toFixed(2)}</td>
                                        <td>R$ {parseFloat(item.Preven).toFixed(2)}</td>
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

export default VoltaretPage;