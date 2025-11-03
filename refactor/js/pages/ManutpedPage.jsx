import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../../css/manutped.css'; // Importa o CSS específico para esta página

function ManutpedPage() {
    const [pedidos, setPedidos] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('CODIGO'); // Default search field
    const [message, setMessage] = useState('');

    useEffect(() => {
        fetchPedidos();
    }, []);

    const fetchPedidos = async () => {
        try {
            const response = await axios.get('http://localhost/api/pedidos_api.php');
            setPedidos(response.data.records);
        } catch (error) {
            console.error('Erro ao buscar pedidos:', error);
            setMessage('Erro ao carregar pedidos.');
        }
    };

    const handleSearch = async () => {
        try {
            const response = await axios.get(`http://localhost/api/pedidos_api.php?search_term=${searchTerm}&search_field=${searchField}`);
            setPedidos(response.data.records);
            setMessage('');
        } catch (error) {
            console.error('Erro ao pesquisar pedidos:', error);
            setPedidos([]);
            setMessage('Nenhum pedido encontrado com os critérios de pesquisa.');
        }
    };

    const handleInputChange = (e) => {
        setSearchTerm(e.target.value);
    };

    const handleSelectChange = (e) => {
        setSearchField(e.target.value);
    };

    const handleNewPedido = () => {
        // Lógica para abrir formulário de novo pedido
        setMessage('Funcionalidade de "Implantar" pedido a ser implementada.');
    };

    const handleEditPedido = (pedidoId) => {
        // Lógica para abrir formulário de edição de pedido
        setMessage(`Funcionalidade de "Alterar" pedido ${pedidoId} a ser implementada.`);
    };

    const handleViewPedido = (pedidoId) => {
        // Lógica para abrir formulário de consulta de pedido
        setMessage(`Funcionalidade de "Consultar" pedido ${pedidoId} a ser implementada.`);
    };

    const handleDeletePedido = (pedidoId) => {
        // Lógica para excluir pedido
        setMessage(`Funcionalidade de "Excluir" pedido ${pedidoId} a ser implementada.`);
    };

    const handleReturnDevVen = (pedidoId) => {
        // Lógica para retorno/devolução/venda
        setMessage(`Funcionalidade de "Ret/Dev/Ven" para pedido ${pedidoId} a ser implementada.`);
    };

    const handleUndoReturn = (pedidoId) => {
        // Lógica para desfazer retorno
        setMessage(`Funcionalidade de "Desfaz Ret" para pedido ${pedidoId} a ser implementada.`);
    };

    const handleBaixar = (pedidoId) => {
        // Lógica para baixar pedido
        setMessage(`Funcionalidade de "Baixar" pedido ${pedidoId} a ser implementada.`);
    };

    const handlePerdido = (pedidoId) => {
        // Lógica para pedido perdido
        setMessage(`Funcionalidade de "Perdido" para pedido ${pedidoId} a ser implementada.`);
    };

    const handlePedRetorno = (pedidoId) => {
        // Lógica para pedido de retorno
        setMessage(`Funcionalidade de "Ped.Retorno" para pedido ${pedidoId} a ser implementada.`);
    };

    const handleEtiqueta = (pedidoId) => {
        // Lógica para etiqueta
        setMessage(`Funcionalidade de "Etiqueta" para pedido ${pedidoId} a ser implementada.`);
    };

    const handlePedFaixa = () => {
        // Lógica para pedido por faixa
        setMessage('Funcionalidade de "Ped./Faixa" a ser implementada.');
    };

    const handleCriaEtiq = () => {
        // Lógica para criar etiqueta
        setMessage('Funcionalidade de "Cria Etiq" a ser implementada.');
    };

    return (
        <div className="manutped-container">
            <div className="sidebar">
                <div className="button-group">
                    <label className="group-label">PEDIDOS</label>
                    <button onClick={handleNewPedido}>IMPLANTAR</button>
                    <button onClick={() => handleEditPedido(pedidos.length > 0 ? pedidos[0].pedido : '')}>ALTERAR</button>
                    <button onClick={() => handleViewPedido(pedidos.length > 0 ? pedidos[0].pedido : '')}>CONSULTAR</button>
                    <button onClick={() => handleDeletePedido(pedidos.length > 0 ? pedidos[0].pedido : '')}>EXCLUIR</button>
                </div>
                <div className="button-group">
                    <label className="group-label">RETORNO</label>
                    <button onClick={() => handleReturnDevVen(pedidos.length > 0 ? pedidos[0].pedido : '')}>RET/DEV/VEN</button>
                    <button onClick={() => handleUndoReturn(pedidos.length > 0 ? pedidos[0].pedido : '')}>DESFAZ RET</button>
                </div>
                <div className="button-group">
                    <label className="group-label">RESIDUO</label>
                    <button onClick={() => handleBaixar(pedidos.length > 0 ? pedidos[0].pedido : '')}>BAIXAR</button>
                    <button onClick={() => handlePerdido(pedidos.length > 0 ? pedidos[0].pedido : '')}>PERDIDO</button>
                </div>
                <div className="button-group">
                    <label className="group-label">EMISSÕES</label>
                    <button onClick={() => handlePedRetorno(pedidos.length > 0 ? pedidos[0].pedido : '')}>PED.RETOR.</button>
                    <button onClick={() => handleEtiqueta(pedidos.length > 0 ? pedidos[0].pedido : '')}>ETIQUETA</button>
                    <button onClick={handlePedFaixa}>PED./FAIXA</button>
                </div>
                <button className="cria-etiq-button" onClick={handleCriaEtiq}>CRIA ETIQ</button>
            </div>

            <div className="main-content">
                <div className="search-panel">
                    <label>PESQUISAR</label>
                    <select value={searchField} onChange={handleSelectChange}>
                        <option value="CODIGO">CÓDIGO</option>
                        <option value="DATPED">DATA</option>
                        <option value="NOMCLI">NOME</option>
                        <option value="CODVEN">VENDEDOR</option>
                    </select>
                    <label>CONTEÚDO</label>
                    <input type="text" value={searchTerm} onChange={handleInputChange} onKeyPress={(e) => { if (e.key === 'Enter') handleSearch(); }} />
                    <button onClick={handleSearch}>Buscar</button>
                </div>

                {message && <div className="message">{message}</div>}

                <div className="grid-container">
                    <table className="data-grid">
                        <thead>
                            <tr>
                                <th>PEDIDO</th>
                                <th>EMISSÃO</th>
                                <th>CODCLI</th>
                                <th>NOME DO CLIENTE</th>
                                <th>TOTPED</th>
                                <th>SITU</th>
                                <th>VEND</th>
                            </tr>
                        </thead>
                        <tbody>
                            {pedidos.map((pedido) => (
                                <tr key={pedido.pedido}>
                                    <td>{pedido.pedido}</td>
                                    <td>{pedido.base}</td>
                                    <td>{pedido.codcli}</td>
                                    <td>{pedido.nomcli}</td>
                                    <td>{parseFloat(pedido.totped).toFixed(2)}</td>
                                    <td>{pedido.situ}</td>
                                    <td>{pedido.codven}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ManutpedPage;