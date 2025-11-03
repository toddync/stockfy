import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './manutsol.css';

function ManutsolPage() {
    const [solicitacoes, setSolicitacoes] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchField, setSearchField] = useState('VENDEDOR');
    const [selectedSolicitacao, setSelectedSolicitacao] = useState(null);

    useEffect(() => {
        fetchSolicitacoes();
    }, []);

    const fetchSolicitacoes = async () => {
        try {
            const response = await axios.get('php/api/solicitacoes_api.php');
            setSolicitacoes(response.data);
        } catch (error) {
            console.error("Erro ao buscar solicitações:", error);
            alert("Erro ao buscar solicitações.");
        }
    };

    const handleSearch = async () => {
        let url = 'php/api/solicitacoes_api.php?';
        if (searchField === 'VENDEDOR') {
            url += `vendedor=${searchTerm.padStart(3, '0')}`;
        } else if (searchField === 'CLIENTE') {
            url += `cliente=${searchTerm.padStart(4, '0')}`;
        } else if (searchField === 'NOME') {
            url += `nome_cliente=${searchTerm}`;
        } else if (searchField === 'DATA') {
            url += `data_solicitacao=${searchTerm}`;
        }

        try {
            const response = await axios.get(url);
            setSolicitacoes(response.data);
        } catch (error) {
            console.error("Erro ao pesquisar solicitações:", error);
            alert("Erro ao pesquisar solicitações.");
        }
    };

    const handleRowClick = (solicitacao) => {
        setSelectedSolicitacao(solicitacao);
    };

    const handleImplantar = () => {
        // Lógica para implantar nova solicitação
        alert("Funcionalidade de Implantar ainda não implementada.");
    };

    const handleAlterar = () => {
        if (!selectedSolicitacao) {
            alert("Selecione uma solicitação para alterar.");
            return;
        }
        // Lógica para alterar solicitação
        alert(`Funcionalidade de Alterar solicitação ${selectedSolicitacao.numero} ainda não implementada.`);
    };

    const handleConsultar = () => {
        if (!selectedSolicitacao) {
            alert("Selecione uma solicitação para consultar.");
            return;
        }
        // Lógica para consultar solicitação
        alert(`Funcionalidade de Consultar solicitação ${selectedSolicitacao.numero} ainda não implementada.`);
    };

    const handleExcluir = async () => {
        if (!selectedSolicitacao) {
            alert("Selecione uma solicitação para excluir.");
            return;
        }
        if (window.confirm(`Tem certeza que deseja excluir a solicitação ${selectedSolicitacao.numero}?`)) {
            try {
                await axios.delete(`php/api/solicitacoes_api.php?vendedor=${selectedSolicitacao.vendedor}&numero=${selectedSolicitacao.numero}`);
                alert("Solicitação excluída com sucesso!");
                fetchSolicitacoes();
            } catch (error) {
                console.error("Erro ao excluir solicitação:", error);
                alert("Erro ao excluir solicitação.");
            }
        }
    };

    const handleTabularArtigos = async () => {
        const vendedor = prompt("Informe o vendedor ou 999 para geral:");
        if (!vendedor) return;

        const dataInicio = prompt("Informe a data de início do período (DD/MM/AAAA):");
        if (!dataInicio) return;

        const dataFim = prompt("Informe a data final do período (DD/MM/AAAA):");
        if (!dataFim) return;

        try {
            // Limpar tabela AUXTABULA
            await axios.delete('php/api/aux_tabula_api.php');

            // Buscar solicitações e itens para popular AUXITSOLICIT e AUXTABULA
            const response = await axios.get(`php/api/solicitacoes_api.php?vendedor=${vendedor}&dataInicio=${dataInicio}&dataFim=${dataFim}`);
            const solicitacoesParaTabular = response.data;

            for (const sol of solicitacoesParaTabular) {
                const itensResponse = await axios.get(`php/api/item_solicitacoes_api.php?vendedor=${sol.vendedor}&numero=${sol.numero}`);
                const itens = itensResponse.data;

                for (const item of itens) {
                    await axios.post('php/api/aux_tabula_api.php', {
                        artigo: item.artigo,
                        descricao: item.descricao,
                        pequeno: item.pequeno,
                        medio: item.medio,
                        grande: item.grande,
                        xgrande: item.xgrande,
                        total: item.pequeno + item.medio + item.grande + item.xgrande
                    });
                }
            }
            alert("Tabulação de artigos concluída. Relatório pronto para visualização.");
            // Aqui você pode adicionar a lógica para exibir o relatório, talvez abrindo uma nova janela ou componente.
        } catch (error) {
            console.error("Erro ao tabular artigos:", error);
            alert("Erro ao tabular artigos.");
        }
    };

    const handleSolicLimpa = () => {
        alert("Funcionalidade de Solic. Limpa ainda não implementada.");
    };

    return (
        <div className="manutsol-container">
            <div className="panel">
                <label className="label-pesquisar">PESQUISAR</label>
                <select className="combobox" value={searchField} onChange={(e) => setSearchField(e.target.value)}>
                    <option value="VENDEDOR">VENDEDOR</option>
                    <option value="CLIENTE">CLIENTE</option>
                    <option value="NOME">NOME</option>
                    <option value="DATA">DATA</option>
                </select>
                <label className="label-conteudo">CONTEUDO</label>
                <input type="text" className="edit-conteudo" value={searchTerm} onChange={(e) => setSearchTerm(e.target.value)} onKeyPress={(e) => { if (e.key === 'Enter') handleSearch(); }} />
                <button onClick={handleSearch}>Buscar</button>
            </div>

            <div className="main-content">
                <div className="groupbox-operacoes">
                    <label className="label-operacoes">OPERAÇÕES</label>
                    <button className="button-operacao" onClick={handleImplantar}>IMPLANTAR</button>
                    <button className="button-operacao" onClick={handleAlterar}>ALTERAR</button>
                    <button className="button-operacao" onClick={handleConsultar}>CONSULTAR</button>
                    <button className="button-operacao" onClick={handleExcluir}>EXCLUIR</button>
                    <button className="button-operacao" onClick={handleTabularArtigos}>TABULAR ART.</button>
                    <label className="label-relatorios">RELATÓRIOS</label>
                    <button className="button-operacao" onClick={handleSolicLimpa}>SOLIC.LIMPA</button>
                </div>

                <div className="dbgrid-container">
                    <table className="dbgrid">
                        <thead>
                            <tr>
                                <th>DATA</th>
                                <th>VEND</th>
                                <th>NÚMERO</th>
                                <th>CLIENTE</th>
                                <th>NOME DO CLIENTE</th>
                                <th>SITU</th>
                            </tr>
                        </thead>
                        <tbody>
                            {solicitacoes.map((solicitacao) => (
                                <tr key={`${solicitacao.vendedor}-${solicitacao.numero}`} onClick={() => handleRowClick(solicitacao)} className={selectedSolicitacao === solicitacao ? 'selected-row' : ''}>
                                    <td>{solicitacao.dataSolicitacao}</td>
                                    <td>{solicitacao.vendedor}</td>
                                    <td>{solicitacao.numero}</td>
                                    <td>{solicitacao.cliente}</td>
                                    <td>{solicitacao.nomeCliente}</td>
                                    <td>{solicitacao.situacao}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ManutsolPage;