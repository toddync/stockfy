import React, { useState, useEffect } from 'react';
import '../../css/filial-retorno.css';

const FilialRetornoPage = () => {
    const [clientes, setClientes] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [filterBy, setFilterBy] = useState('id'); // Default filter by CODCLI (id)

    const API_URL = 'http://localhost/refactor/php/api/clientes.php'; // Ajuste a URL da sua API PHP

    useEffect(() => {
        fetchClientes();
    }, [searchTerm, filterBy]);

    const fetchClientes = async () => {
        setLoading(true);
        setError(null);
        try {
            let url = API_URL;
            if (searchTerm) {
                url += `?s=${searchTerm}`;
            }
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setClientes(data.records || []);
        } catch (e) {
            setError("Falha ao carregar clientes: " + e.message);
            setClientes([]);
        } finally {
            setLoading(false);
        }
    };

    const handleSearchChange = (e) => {
        setSearchTerm(e.target.value);
    };

    const handleFilterChange = (e) => {
        setFilterBy(e.target.value);
    };

    const handleArqIntClick = () => {
        alert('Funcionalidade "ARQ.INT" (Arquivo Interno) a ser implementada.');
    };

    const handleClienteClick = () => {
        alert('Funcionalidade "CLIENTE" (Importar Cliente) a ser implementada.');
    };

    const handleLimparArqClick = () => {
        alert('Funcionalidade "LIMP.ARQ." (Limpar Arquivo) a ser implementada.');
    };

    return (
        <div className="filial-retorno-container">
            <div className="filial-retorno-header">
                <h1>IMPORTAÇÃO DE RETORNO DAS FILIAIS</h1>
            </div>

            <div className="filial-retorno-filters">
                <div className="filial-retorno-filter-group">
                    <label htmlFor="filterBy">FILTRO</label>
                    <select id="filterBy" value={filterBy} onChange={handleFilterChange}>
                        <option value="id">CODCLI</option>
                        <option value="nome">NOME</option>
                        <option value="cpf_cnpj">CPF</option>
                        <option value="ie_rg">IDENT</option>
                    </select>
                </div>
                <div className="filial-retorno-filter-group">
                    <label htmlFor="searchTerm">PROCURAR</label>
                    <input
                        type="text"
                        id="searchTerm"
                        value={searchTerm}
                        onChange={handleSearchChange}
                        placeholder="Digite para procurar..."
                    />
                </div>
            </div>

            <div className="filial-retorno-content">
                <div className="filial-retorno-buttons">
                    <button className="filial-retorno-button" onClick={handleArqIntClick}>ARQ.INT</button>
                    <button className="filial-retorno-button importar" onClick={handleClienteClick}>CLIENTE</button>
                    <button className="filial-retorno-button limpar" onClick={handleLimparArqClick}>LIMP.ARQ.</button>
                </div>

                <div className="filial-retorno-grid-container">
                    {loading && <p className="filial-retorno-loading">Carregando clientes...</p>}
                    {error && <p className="filial-retorno-error">{error}</p>}
                    {!loading && !error && clientes.length === 0 && (
                        <p className="filial-retorno-loading">Nenhum cliente encontrado.</p>
                    )}
                    {!loading && !error && clientes.length > 0 && (
                        <table className="filial-retorno-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome</th>
                                    <th>CPF/CNPJ</th>
                                    <th>IE/RG</th>
                                    <th>Endereço</th>
                                    <th>Cidade</th>
                                    <th>Estado</th>
                                    <th>Telefone</th>
                                    <th>Email</th>
                                </tr>
                            </thead>
                            <tbody>
                                {clientes.map((cliente) => (
                                    <tr key={cliente.id}>
                                        <td>{cliente.id}</td>
                                        <td>{cliente.nome}</td>
                                        <td>{cliente.cpf_cnpj}</td>
                                        <td>{cliente.ie_rg}</td>
                                        <td>{cliente.endereco}</td>
                                        <td>{cliente.cidade}</td>
                                        <td>{cliente.estado}</td>
                                        <td>{cliente.telefone}</td>
                                        <td>{cliente.email}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>
            </div>
        </div>
    );
};

export default FilialRetornoPage;