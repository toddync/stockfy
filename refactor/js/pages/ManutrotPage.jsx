import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ManutrotPage = () => {
    const [rotas, setRotas] = useState([]);
    const [currentRota, setCurrentRota] = useState({
        id: null,
        codigo_rota: '',
        nome_bairro: '',
        vendedor_id: ''
    });
    const [isEditing, setIsEditing] = useState(false);
    const [searchTerm, setSearchTerm] = useState('');

    const API_URL = 'http://localhost/rosa/refactor/php/api/rotas_api.php'; // Ajuste a URL conforme necessário

    useEffect(() => {
        fetchRotas();
    }, []);

    const fetchRotas = async () => {
        try {
            const response = await axios.get(API_URL);
            setRotas(response.data.records || []);
        } catch (error) {
            console.error("Erro ao buscar rotas:", error);
            setRotas([]);
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCurrentRota({ ...currentRota, [name]: value });
    };

    const handleSearchChange = (e) => {
        setSearchTerm(e.target.value);
    };

    const handleSearch = async () => {
        try {
            const response = await axios.get(`${API_URL}?search=${searchTerm}`);
            setRotas(response.data.records || []);
        } catch (error) {
            console.error("Erro ao pesquisar rotas:", error);
            setRotas([]);
        }
    };

    const handleAdd = () => {
        setIsEditing(false);
        setCurrentRota({
            id: null,
            codigo_rota: '',
            nome_bairro: '',
            vendedor_id: ''
        });
    };

    const handleEdit = (rota) => {
        setIsEditing(true);
        setCurrentRota({ ...rota });
    };

    const handleDelete = async (id) => {
        if (window.confirm('Tem certeza que deseja excluir esta rota?')) {
            try {
                await axios.delete(API_URL, { data: { id: id } });
                fetchRotas();
            } catch (error) {
                console.error("Erro ao excluir rota:", error);
            }
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            if (isEditing) {
                await axios.put(API_URL, currentRota);
            } else {
                await axios.post(API_URL, currentRota);
            }
            fetchRotas();
            handleAdd(); // Limpa o formulário após salvar
        } catch (error) {
            console.error("Erro ao salvar rota:", error);
        }
    };

    const handleCancel = () => {
        handleAdd(); // Volta para o estado de adicionar e limpa o formulário
    };

    return (
        <div className="container">
            <h1>Manutenção de Rotas</h1>

            <div className="search-section">
                <input
                    type="text"
                    placeholder="Pesquisar por código ou bairro"
                    value={searchTerm}
                    onChange={handleSearchChange}
                />
                <button onClick={handleSearch}>Pesquisar</button>
                <button onClick={fetchRotas}>Listar Todos</button>
            </div>

            <div className="form-section">
                <h2>{isEditing ? 'Editar Rota' : 'Adicionar Nova Rota'}</h2>
                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label>Código:</label>
                        <input
                            type="text"
                            name="codigo_rota"
                            value={currentRota.codigo_rota}
                            onChange={handleInputChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>Bairro/Nome:</label>
                        <input
                            type="text"
                            name="nome_bairro"
                            value={currentRota.nome_bairro}
                            onChange={handleInputChange}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label>ID Vendedor:</label>
                        <input
                            type="text"
                            name="vendedor_id"
                            value={currentRota.vendedor_id}
                            onChange={handleInputChange}
                        />
                    </div>
                    <div className="form-actions">
                        <button type="submit">{isEditing ? 'Atualizar' : 'Adicionar'}</button>
                        <button type="button" onClick={handleCancel}>Cancelar</button>
                    </div>
                </form>
            </div>

            <div className="table-section">
                <h2>Rotas Cadastradas</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Código</th>
                            <th>Bairro/Nome</th>
                            <th>ID Vendedor</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {rotas.map((rota) => (
                            <tr key={rota.id}>
                                <td>{rota.id}</td>
                                <td>{rota.codigo_rota}</td>
                                <td>{rota.nome_bairro}</td>
                                <td>{rota.vendedor_id}</td>
                                <td>
                                    <button onClick={() => handleEdit(rota)}>Editar</button>
                                    <button onClick={() => handleDelete(rota.id)}>Excluir</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ManutrotPage;