import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../../css/filial-cli.css'; // Importa o CSS específico

const API_URL = 'http://localhost/refactor/php/api/aux_clientes.php'; // URL da sua API PHP

const FilialCliPage = () => {
    const [clientes, setClientes] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchBy, setSearchBy] = useState('codcli'); // Default search by 'codcli'
    const [statusMessage, setStatusMessage] = useState({ text: '', color: 'green' });

    useEffect(() => {
        fetchClientes();
    }, []);

    const fetchClientes = async () => {
        try {
            const response = await axios.get(API_URL);
            setClientes(response.data.records || []);
            setStatusMessage({ text: 'Clientes carregados com sucesso.', color: 'green' });
        } catch (error) {
            console.error('Erro ao buscar clientes:', error);
            setStatusMessage({ text: 'Erro ao carregar clientes.', color: 'red' });
            setClientes([]);
        }
    };

    const handleSearch = async () => {
        if (searchTerm.trim() === '') {
            setStatusMessage({ text: 'Informe o elemento de procura.', color: 'red' });
            return;
        }
        setStatusMessage({ text: 'Pesquisando...', color: 'red' });
        try {
            const response = await axios.get(`${API_URL}?search_by=${searchBy}&keywords=${searchTerm}`);
            setClientes(response.data.records || []);
            setStatusMessage({ text: 'Pesquisa concluída.', color: 'green' });
        } catch (error) {
            console.error('Erro ao pesquisar clientes:', error);
            setStatusMessage({ text: 'Erro ao pesquisar clientes.', color: 'red' });
            setClientes([]);
        }
    };

    const handleImportClientes = async () => {
        setStatusMessage({ text: 'Importando clientes...', color: 'red' });
        // Simula a leitura de um arquivo e envio para a API.
        // Em um cenário real, você teria um input de arquivo ou outra forma de obter os dados.
        // Por simplicidade, vamos simular alguns dados para envio.
        const dummyData = [
            {
                codcli: '0001', ncpf: '11111111111', nifp: '11111111111', bair: 'Centro', cida: 'Cidade A', esta: 'SP',
                ncep: '11111-111', ntel: '11987654321', conta: 'Conta A', vend: 'V01', lcred: 1000.00, datimp: '2023-01-01',
                nommae: 'Mae A', nompai: 'Pai A', datnasc: '1990-01-01', natu: 'BR', rota: 'R01', praca: 'P01',
                refer: 'Referencia A', oldcli: '0001', situ: 'I', nome: 'Cliente Teste 1', ende: 'Rua A, 123'
            },
            {
                codcli: '0002', ncpf: '22222222222', nifp: '22222222222', bair: 'Bairro B', cida: 'Cidade B', esta: 'RJ',
                ncep: '22222-222', ntel: '21987654321', conta: 'Conta B', vend: 'V02', lcred: 2000.00, datimp: '2023-01-02',
                nommae: 'Mae B', nompai: 'Pai B', datnasc: '1991-02-02', natu: 'BR', rota: 'R02', praca: 'P02',
                refer: 'Referencia B', oldcli: '0002', situ: 'I', nome: 'Cliente Teste 2', ende: 'Rua B, 456'
            }
        ];

        try {
            // Primeiro, limpar a tabela como no Delphi
            await axios.delete(API_URL);
            // Em seguida, importar os novos dados
            const response = await axios.post(API_URL, dummyData);
            setStatusMessage({ text: response.data.message, color: 'green' });
            fetchClientes(); // Recarrega a lista após a importação
        } catch (error) {
            console.error('Erro ao importar clientes:', error);
            setStatusMessage({ text: 'Erro ao importar clientes.', color: 'red' });
        }
    };

    const handleClearClientes = async () => {
        if (!window.confirm('Tem certeza que deseja limpar todos os clientes das filiais?')) {
            return;
        }
        setStatusMessage({ text: 'Limpando clientes...', color: 'red' });
        try {
            const response = await axios.delete(API_URL);
            setStatusMessage({ text: response.data.message, color: 'green' });
            fetchClientes(); // Recarrega a lista após a limpeza
        } catch (error) {
            console.error('Erro ao limpar clientes:', error);
            setStatusMessage({ text: 'Erro ao limpar clientes.', color: 'red' });
        }
    };

    return (
        <div className="filial-cli-container">
            <h1>Gerenciamento de Clientes por Filial</h1>

            <div className="panel">
                <div className="form-group">
                    <label htmlFor="searchComboBox">Pesquisar por:</label>
                    <select
                        id="searchComboBox"
                        value={searchBy}
                        onChange={(e) => setSearchBy(e.target.value)}
                        className="combo-box"
                    >
                        <option value="codcli">Código do Cliente</option>
                        <option value="nome">Nome</option>
                        <option value="ncpf">CPF</option>
                        <option value="nifp">CNPJ/IE</option>
                    </select>
                </div>

                <div className="form-group">
                    <label htmlFor="searchTerm">Termo de Busca:</label>
                    <input
                        type="text"
                        id="searchTerm"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                        onKeyPress={(e) => { if (e.key === 'Enter') handleSearch(); }}
                        className="text-input"
                    />
                    <button onClick={handleSearch} className="button primary">Buscar</button>
                </div>

                <div className="status-message" style={{ color: statusMessage.color }}>
                    {statusMessage.text}
                </div>

                <div className="button-group">
                    <button onClick={handleImportClientes} className="button secondary">Importar Clientes</button>
                    <button onClick={handleClearClientes} className="button danger">Limpar Clientes</button>
                </div>
            </div>

            <div className="table-container">
                <table className="db-grid">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cód. Cliente</th>
                            <th>Nome</th>
                            <th>CPF</th>
                            <th>CNPJ/IE</th>
                            <th>Bairro</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>CEP</th>
                            <th>Telefone</th>
                            <th>Conta</th>
                            <th>Vendedor</th>
                            <th>L. Crédito</th>
                            <th>Data Imp.</th>
                            <th>Mãe</th>
                            <th>Pai</th>
                            <th>Nasc.</th>
                            <th>Natu.</th>
                            <th>Rota</th>
                            <th>Praça</th>
                            <th>Refer.</th>
                            <th>Old Cli</th>
                            <th>Situação</th>
                            <th>Endereço</th>
                            <th>Hora In.</th>
                            <th>Hora Fin.</th>
                            <th>Visita</th>
                            <th>Ativo</th>
                            <th>Esped.</th>
                            <th>Obs.</th>
                        </tr>
                    </thead>
                    <tbody>
                        {clientes.length > 0 ? (
                            clientes.map((cliente) => (
                                <tr key={cliente.id}>
                                    <td>{cliente.id}</td>
                                    <td>{cliente.codcli}</td>
                                    <td>{cliente.nome}</td>
                                    <td>{cliente.ncpf}</td>
                                    <td>{cliente.nifp}</td>
                                    <td>{cliente.bair}</td>
                                    <td>{cliente.cida}</td>
                                    <td>{cliente.esta}</td>
                                    <td>{cliente.ncep}</td>
                                    <td>{cliente.ntel}</td>
                                    <td>{cliente.conta}</td>
                                    <td>{cliente.vend}</td>
                                    <td>{cliente.lcred}</td>
                                    <td>{cliente.datimp}</td>
                                    <td>{cliente.nommae}</td>
                                    <td>{cliente.nompai}</td>
                                    <td>{cliente.datnasc}</td>
                                    <td>{cliente.natu}</td>
                                    <td>{cliente.rota}</td>
                                    <td>{cliente.praca}</td>
                                    <td>{cliente.refer}</td>
                                    <td>{cliente.oldcli}</td>
                                    <td>{cliente.situ}</td>
                                    <td>{cliente.ende}</td>
                                    <td>{cliente.horain}</td>
                                    <td>{cliente.horafin}</td>
                                    <td>{cliente.visita}</td>
                                    <td>{cliente.ativo}</td>
                                    <td>{cliente.esped}</td>
                                    <td>{cliente.obsv}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="30">Nenhum cliente encontrado.</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default FilialCliPage;