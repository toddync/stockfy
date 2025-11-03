import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';

const ManutgruPage = () => {
    const [grupos, setGrupos] = useState([]);
    const [selectedGrupo, setSelectedGrupo] = useState({ id: null, descricao: '' });
    const [searchTerm, setSearchTerm] = useState('');
    const [isEditing, setIsEditing] = useState(false);
    const [isCreating, setIsCreating] = useState(false);

    const API_URL = 'http://localhost/rosa/refactor/php/api/produto_grupos.php';

    const fetchGrupos = useCallback(async () => {
        try {
            const response = await axios.get(API_URL);
            if (response.data.records) {
                setGrupos(response.data.records);
            } else {
                setGrupos([]);
            }
        } catch (error) {
            console.error("Erro ao buscar grupos:", error);
            setGrupos([]);
        }
    }, []);

    useEffect(() => {
        fetchGrupos();
    }, [fetchGrupos]);

    const handleSelectGrupo = (grupo) => {
        setSelectedGrupo(grupo);
        setIsEditing(false);
        setIsCreating(false);
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setSelectedGrupo({ ...selectedGrupo, [name]: value });
    };

    const handleSearchChange = (e) => {
        setSearchTerm(e.target.value);
    };

    const resetForm = () => {
        setSelectedGrupo({ id: null, descricao: '' });
        setIsEditing(false);
        setIsCreating(false);
    };

    const handleNew = () => {
        setSelectedGrupo({ id: null, descricao: '' });
        setIsCreating(true);
        setIsEditing(false);
    };

    const handleEdit = () => {
        if (selectedGrupo.id) {
            setIsEditing(true);
            setIsCreating(false);
        } else {
            alert("Selecione um grupo para editar.");
        }
    };

    const handleDelete = async () => {
        if (!selectedGrupo.id) {
            alert("Selecione um grupo para excluir.");
            return;
        }

        if (window.confirm(`Tem certeza que deseja excluir o grupo "${selectedGrupo.descricao}"?`)) {
            try {
                await axios.delete(API_URL, { data: { id: selectedGrupo.id } });
                alert("Grupo excluído com sucesso!");
                resetForm();
                fetchGrupos();
            } catch (error) {
                console.error("Erro ao excluir grupo:", error);
                alert("Erro ao excluir grupo.");
            }
        }
    };

    const handleSave = async () => {
        if (!selectedGrupo.descricao) {
            alert("A descrição do grupo é obrigatória.");
            return;
        }

        const method = isCreating ? 'post' : 'put';
        const payload = {
            descricao: selectedGrupo.descricao
        };
        if (!isCreating) {
            payload.id = selectedGrupo.id;
        }

        try {
            await axios[method](API_URL, payload);
            alert(`Grupo ${isCreating ? 'criado' : 'atualizado'} com sucesso!`);
            resetForm();
            fetchGrupos();
        } catch (error) {
            console.error("Erro ao salvar grupo:", error);
            alert("Erro ao salvar grupo.");
        }
    };

    const filteredGrupos = grupos.filter(grupo =>
        grupo.descricao.toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <div className="container">
            <h1>Manutenção de Grupos de Produtos</h1>

            <div className="form-container">
                <div className="form-group">
                    <label htmlFor="grupo-id">Código:</label>
                    <input
                        type="text"
                        id="grupo-id"
                        name="id"
                        value={selectedGrupo.id || ''}
                        disabled
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="grupo-descricao">Descrição:</label>
                    <input
                        type="text"
                        id="grupo-descricao"
                        name="descricao"
                        value={selectedGrupo.descricao}
                        onChange={handleInputChange}
                        disabled={!isEditing && !isCreating}
                    />
                </div>
            </div>

            <div className="button-panel">
                <button onClick={handleNew} className="btn-new">Novo</button>
                <button onClick={handleEdit} className="btn-edit">Alterar</button>
                <button onClick={handleDelete} className="btn-delete">Excluir</button>
                <button onClick={handleSave} className="btn-save" disabled={!isEditing && !isCreating}>Gravar</button>
                <button onClick={resetForm} className="btn-cancel">Cancelar</button>
            </div>

            <div className="search-container">
                <input
                    type="text"
                    placeholder="Pesquisar por descrição..."
                    value={searchTerm}
                    onChange={handleSearchChange}
                />
            </div>

            <div className="grid-container">
                <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Descrição</th>
                        </tr>
                    </thead>
                    <tbody>
                        {filteredGrupos.length > 0 ? (
                            filteredGrupos.map(grupo => (
                                <tr
                                    key={grupo.id}
                                    onClick={() => handleSelectGrupo(grupo)}
                                    className={selectedGrupo.id === grupo.id ? 'selected' : ''}
                                >
                                    <td>{grupo.id}</td>
                                    <td>{grupo.descricao}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="2">Nenhum grupo encontrado.</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ManutgruPage;