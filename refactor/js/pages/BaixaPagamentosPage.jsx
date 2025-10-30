// refactor/js/pages/BaixaPagamentosPage.jsx
import React, { useState, useEffect } from 'react';
import '../../css/baixa-pagamentos.css';

const BaixaPagamentosPage = () => {
    const [pagamentos, setPagamentos] = useState([]);
    const [filtroTipoDoc, setFiltroTipoDoc] = useState('');
    const [filtroNumDoc, setFiltroNumDoc] = useState('');
    const [filtroParcela, setFiltroParcela] = useState('');
    const [filtroDataInicio, setFiltroDataInicio] = useState('');
    const [filtroDataFim, setFiltroDataFim] = useState('');
    const [dataPagamento, setDataPagamento] = useState('');
    const [valorPagamento, setValorPagamento] = useState('');

    useEffect(() => {
        // Carregar pagamentos ao montar o componente
        fetchPagamentos();
    }, []);

    const fetchPagamentos = async () => {
        try {
            // TODO: Implementar a chamada à API PHP para buscar pagamentos
            // Exemplo: const response = await fetch('/api/baixa_pagamentos.php');
            // const data = await response.json();
            // setPagamentos(data);
            setPagamentos([
                { id: 1, tipoDoc: 'NF', numDoc: '001', parcela: '1/3', dataVencimento: '2025-11-01', valor: 150.00, status: 'Pendente' },
                { id: 2, tipoDoc: 'BO', numDoc: '002', parcela: '1/1', dataVencimento: '2025-11-15', valor: 200.50, status: 'Pendente' },
                { id: 3, tipoDoc: 'NF', numDoc: '003', parcela: '2/3', dataVencimento: '2025-11-20', valor: 150.00, status: 'Pendente' },
            ]);
        } catch (error) {
            console.error('Erro ao buscar pagamentos:', error);
        }
    };

    const handleRestaurar = () => {
        // TODO: Implementar lógica de restauração de pagamentos
        alert('Funcionalidade de Restaurar ainda não implementada.');
    };

    const handleSair = () => {
        // TODO: Implementar lógica para sair da página ou navegar
        alert('Saindo da página de Baixa de Pagamentos.');
        // Exemplo: window.history.back();
    };

    const handleBaixarPagamento = () => {
        // TODO: Implementar lógica para baixar o pagamento selecionado
        alert('Funcionalidade de Baixar Pagamento ainda não implementada.');
    };

    return (
        <div className="baixa-pagamentos-container">
            <div className="baixa-pagamentos-header">
                <h1>PAGAMENTOS</h1>
            </div>

            <div className="baixa-pagamentos-form-group">
                <fieldset className="baixa-pagamentos-fieldset green">
                    <legend>Filtro por Data</legend>
                    <label htmlFor="dataInicio">INICIO</label>
                    <input
                        type="text"
                        id="dataInicio"
                        value={filtroDataInicio}
                        onChange={(e) => setFiltroDataInicio(e.target.value)}
                        placeholder="DD/MM/AAAA"
                    />
                    <label htmlFor="dataFim">FIM</label>
                    <input
                        type="text"
                        id="dataFim"
                        value={filtroDataFim}
                        onChange={(e) => setFiltroDataFim(e.target.value)}
                        placeholder="DD/MM/AAAA"
                    />
                </fieldset>
            </div>

            <div className="baixa-pagamentos-grid">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tipo Doc.</th>
                            <th>Num. Doc.</th>
                            <th>Parcela</th>
                            <th>Data Vencimento</th>
                            <th>Valor</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        {pagamentos.map((pagamento) => (
                            <tr key={pagamento.id}>
                                <td>{pagamento.id}</td>
                                <td>{pagamento.tipoDoc}</td>
                                <td>{pagamento.numDoc}</td>
                                <td>{pagamento.parcela}</td>
                                <td>{pagamento.dataVencimento}</td>
                                <td>{pagamento.valor.toFixed(2)}</td>
                                <td>{pagamento.status}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            <div className="baixa-pagamentos-form-group">
                <fieldset className="baixa-pagamentos-fieldset">
                    <legend>Detalhes do Documento</legend>
                    <label htmlFor="tipoDoc">TIP.DOC.</label>
                    <input
                        type="text"
                        id="tipoDoc"
                        value={filtroTipoDoc}
                        onChange={(e) => setFiltroTipoDoc(e.target.value)}
                    />
                    <label htmlFor="numDoc">NUM.DOC</label>
                    <input
                        type="text"
                        id="numDoc"
                        value={filtroNumDoc}
                        onChange={(e) => setFiltroNumDoc(e.target.value)}
                    />
                    <label htmlFor="parcela">PARCEL.</label>
                    <input
                        type="text"
                        id="parcela"
                        value={filtroParcela}
                        onChange={(e) => setFiltroParcela(e.target.value)}
                    />
                </fieldset>

                <fieldset className="baixa-pagamentos-fieldset green">
                    <legend>Baixa de Pagamento</legend>
                    <label htmlFor="dataPagamento">DATA</label>
                    <input
                        type="text"
                        id="dataPagamento"
                        value={dataPagamento}
                        onChange={(e) => setDataPagamento(e.target.value)}
                        placeholder="DD/MM/AAAA"
                    />
                    <label htmlFor="valorPagamento">VALOR</label>
                    <input
                        type="text"
                        id="valorPagamento"
                        value={valorPagamento}
                        onChange={(e) => setValorPagamento(e.target.value)}
                    />
                    <button onClick={handleBaixarPagamento}>Baixar Pagamento</button>
                </fieldset>
            </div>

            <div className="baixa-pagamentos-actions">
                <button className="restore" onClick={handleRestaurar}>RESTAURA</button>
                <button className="exit" onClick={handleSair}>SAIR</button>
            </div>
        </div>
    );
};

export default BaixaPagamentosPage;