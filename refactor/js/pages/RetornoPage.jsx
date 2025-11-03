import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../css/retorno.css';

const RetornoPage = () => {
    const [pedidoNumero, setPedidoNumero] = useState('');
    const [operacao, setOperacao] = useState('');
    const [produtoCodigo, setProdutoCodigo] = useState('');
    const [quantidadeDevolvida, setQuantidadeDevolvida] = useState('');
    const [pedidoInfo, setPedidoInfo] = useState(null);
    const [itensPedido, setItensPedido] = useState([]);
    const [mensagem, setMensagem] = useState('');
    const [showTotais, setShowTotais] = useState(false);

    useEffect(() => {
        // Carregar informações iniciais, se houver
    }, []);

    const handlePedidoNumeroChange = (e) => {
        setPedidoNumero(e.target.value);
    };

    const handleOperacaoChange = (e) => {
        setOperacao(e.target.value);
    };

    const handleProdutoCodigoChange = (e) => {
        setProdutoCodigo(e.target.value);
    };

    const handleQuantidadeDevolvidaChange = (e) => {
        setQuantidadeDevolvida(e.target.value);
    };

    const buscarPedido = async () => {
        if (!pedidoNumero) {
            setMensagem('Número do Pedido é obrigatório!');
            return;
        }
        try {
            const response = await axios.get(`/refactor/php/api/retorno_api.php?action=getPedido&pedido=${pedidoNumero}`);
            if (response.data.success) {
                setPedidoInfo(response.data.pedidoInfo);
                setItensPedido(response.data.itensPedido);
                setMensagem('');
            } else {
                setMensagem(response.data.message);
                setPedidoInfo(null);
                setItensPedido([]);
            }
        } catch (error) {
            setMensagem('Erro ao buscar pedido.');
            console.error('Erro ao buscar pedido:', error);
        }
    };

    const registrarRetornoItem = async () => {
        if (!pedidoNumero || !produtoCodigo || !quantidadeDevolvida) {
            setMensagem('Todos os campos de item são obrigatórios.');
            return;
        }
        try {
            const response = await axios.post('/refactor/php/api/retorno_api.php', {
                action: 'registrarRetornoItem',
                pedido: pedidoNumero,
                codart: produtoCodigo,
                qtdret: quantidadeDevolvida
            });
            if (response.data.success) {
                setMensagem('Item de retorno registrado com sucesso!');
                // Atualizar a lista de itens do pedido após o registro
                buscarPedido();
                setProdutoCodigo('');
                setQuantidadeDevolvida('');
            } else {
                setMensagem(response.data.message);
            }
        } catch (error) {
            setMensagem('Erro ao registrar item de retorno.');
            console.error('Erro ao registrar item de retorno:', error);
        }
    };

    const fecharRetorno = async () => {
        if (!pedidoNumero || !operacao) {
            setMensagem('Número do Pedido e Operação são obrigatórios para fechar.');
            return;
        }
        try {
            const response = await axios.post('/refactor/php/api/retorno_api.php', {
                action: 'fecharRetorno',
                pedido: pedidoNumero,
                operacao: operacao
            });
            if (response.data.success) {
                setMensagem('Retorno fechado com sucesso!');
                resetForm();
            } else {
                setMensagem(response.data.message);
            }
        } catch (error) {
            setMensagem('Erro ao fechar retorno.');
            console.error('Erro ao fechar retorno:', error);
        }
    };

    const restaurarPedido = async () => {
        if (!pedidoNumero) {
            setMensagem('Número do Pedido é obrigatório para restaurar.');
            return;
        }
        try {
            const response = await axios.post('/refactor/php/api/retorno_api.php', {
                action: 'restaurarPedido',
                pedido: pedidoNumero
            });
            if (response.data.success) {
                setMensagem('Pedido restaurado com sucesso!');
                resetForm();
            } else {
                setMensagem(response.data.message);
            }
        } catch (error) {
            setMensagem('Erro ao restaurar pedido.');
            console.error('Erro ao restaurar pedido:', error);
        }
    };

    const resetForm = () => {
        setPedidoNumero('');
        setOperacao('');
        setProdutoCodigo('');
        setQuantidadeDevolvida('');
        setPedidoInfo(null);
        setItensPedido([]);
        setMensagem('');
        setShowTotais(false);
    };

    const calcularTotais = () => {
        let totalItens = 0;
        let totalQtdSai = 0;
        let totalQtdRet = 0;
        let totalQtdVend = 0;
        let totalValorPed = 0;
        let totalValorRet = 0;
        let totalValorVend = 0;

        itensPedido.forEach(item => {
            totalItens++;
            totalQtdSai += item.QTDSAI;
            totalQtdRet += item.QTDRET;
            totalQtdVend += (item.QTDSAI - item.QTDRET);
            totalValorPed += (item.QTDSAI * item.PRECUS);
            totalValorRet += (item.QTDRET * item.PRECUS);
            totalValorVend += ((item.QTDSAI - item.QTDRET) * item.PRECUS);
        });

        return {
            totalItens,
            totalQtdSai,
            totalQtdRet,
            totalQtdVend,
            totalValorPed,
            totalValorRet,
            totalValorVend
        };
    };

    const totais = calcularTotais();

    return (
        <div className="retorno-container">
            <h1>Manutenção do Retorno de Artigo no Pedido</h1>

            <div className="form-section">
                <div className="input-group">
                    <label>Número do Pedido:</label>
                    <input
                        type="text"
                        value={pedidoNumero}
                        onChange={handlePedidoNumeroChange}
                        onBlur={buscarPedido}
                    />
                    <button onClick={restaurarPedido}>Restaurar</button>
                </div>

                {pedidoInfo && (
                    <div className="pedido-info">
                        <p>Cliente: {pedidoInfo.NOMCLI} - {pedidoInfo.CODCLI}</p>
                        <p>Emissão: {pedidoInfo.BASE} Devolução: {pedidoInfo.RECOL} Vencimento: {pedidoInfo.COBRAN}</p>
                    </div>
                )}

                <div className="input-group">
                    <label>Operação (D/V/R):</label>
                    <input
                        type="text"
                        value={operacao}
                        onChange={handleOperacaoChange}
                    />
                    <button onClick={fecharRetorno}>Fechar Retorno</button>
                </div>

                <div className="input-group">
                    <label>Produto:</label>
                    <input
                        type="text"
                        value={produtoCodigo}
                        onChange={handleProdutoCodigoChange}
                    />
                    <label>Quantidade Devolvida:</label>
                    <input
                        type="number"
                        value={quantidadeDevolvida}
                        onChange={handleQuantidadeDevolvidaChange}
                    />
                    <button onClick={registrarRetornoItem}>Registrar Item</button>
                </div>
            </div>

            {mensagem && <p className="mensagem">{mensagem}</p>}

            <div className="table-section">
                <h2>Itens do Pedido</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ART</th>
                            <th>DESCRIÇÃO</th>
                            <th>SAIU</th>
                            <th>RET</th>
                            <th>VEND</th>
                            <th>VALOR</th>
                        </tr>
                    </thead>
                    <tbody>
                        {itensPedido.map((item, index) => (
                            <tr key={index}>
                                <td>{item.CODART}</td>
                                <td>{item.DESCRICAO}</td>
                                <td>{item.QTDSAI}</td>
                                <td>{item.QTDRET}</td>
                                <td>{item.QTDSAI - item.QTDRET}</td>
                                <td>{(item.PRECUS * (item.QTDSAI - item.QTDRET)).toFixed(2)}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            <div className="totais-section">
                <button onClick={() => setShowTotais(!showTotais)}>
                    {showTotais ? 'Ocultar Totais' : 'Mostrar Totais'}
                </button>

                {showTotais && (
                    <div className="totais-box">
                        <p>Artigos: {totais.totalItens}</p>
                        <p>Total Saída: {totais.totalQtdSai}</p>
                        <p>Total Retorno: {totais.totalQtdRet}</p>
                        <p>Total Vendido: {totais.totalQtdVend}</p>
                        <p>Valor Pedido: {totais.totalValorPed.toFixed(2)}</p>
                        <p>Valor Retorno: {totais.totalValorRet.toFixed(2)}</p>
                        <p>Valor Venda: {totais.totalValorVend.toFixed(2)}</p>
                    </div>
                )}
            </div>
        </div>
    );
};

export default RetornoPage;