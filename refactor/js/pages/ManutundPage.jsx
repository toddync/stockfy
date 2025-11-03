import React, { useState, useEffect } from 'react';
import axios from 'axios';

const API_URL = 'http://localhost/refactor/php/api/unidades_api.php';

const ManutundPage = () => {
    const [unidades, setUnidades] = useState([]);
    const [currentUnidade, setCurrentUnidade] = useState({ id: null, codigo: '', descricao: '' });
    const [isEditing, setIsEditing] = useState(false);
    const [operation, setOperation] = useState(''); // 'I' for Insert, 'A' for Alter, 'E' for Delete

    useEffect(() => {
        fetchUnidades();
    }, []);

    const fetchUnidades = async () => {
        try {
            const response = await axios.get(API_URL);
            if (response.data.records) {
                setUnidades(response.data.records);
            } else {
                setUnidades([]);
            }
        } catch (error) {
            console.error("Erro ao buscar unidades:", error);
            setUnidades([]);
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCurrentUnidade({ ...currentUnidade, [name]: value });
    };

    const handleNewClick = () => {
        setCurrentUnidade({ id: null, codigo: '', descricao: '' });
        setIsEditing(true);
        setOperation('I');
    };

    const handleEditClick = (unidade) => {
        setCurrentUnidade({ ...unidade });
        setIsEditing(true);
        setOperation('A');
    };

    const handleDeleteClick = async (id) => {
        if (window.confirm("Tem certeza que deseja excluir esta unidade?")) {
            try {
                await axios.delete(`${API_URL}?id=${id}`);
                fetchUnidades();
            } catch (error) {
                console.error("Erro ao deletar unidade:", error);
            }
        }
    };

    const handleSaveClick = async () => {
        try {
            if (operation === 'I') {
                await axios.post(API_URL, currentUnidade);
            } else if (operation === 'A') {
                await axios.put(API_URL, currentUnidade);
            }
            setIsEditing(false);
            setOperation('');
            fetchUnidades();
        } catch (error) {
            console.error("Erro ao salvar unidade:", error);
        }
    };

    const handleCancelClick = () => {
        setIsEditing(false);
        setOperation('');
        setCurrentUnidade({ id: null, codigo: '', descricao: '' });
    };

    return (
        <div className="manutund-container">
            <h2>Manutenção de Unidades</h2>

            <div className="actions">
                <button onClick={handleNewClick}>Novo</button>
            </div>

            {isEditing && (
                <div className="form-container">
                    <h3>{operation === 'I' ? 'Nova Unidade' : 'Editar Unidade'}</h3>
                    <div className="form-group">
                        <label>Código:</label>
                        <input
                            type="text"
                            name="codigo"
                            value={currentUnidade.codigo}
                            onChange={handleInputChange}
                            maxLength="3"
                        />
                    </div>
                    <div className="form-group">
                        <label>Descrição:</label>
                        <input
                            type="text"
                            name="descricao"
                            value={currentUnidade.descricao}
                            onChange={handleInputChange}
                            maxLength="25"
                        />
                    </div>
                    <div className="form-actions">
                        <button onClick={handleSaveClick}>Salvar</button>
                        <button onClick={handleCancelClick}>Cancelar</button>
                    </div>
                </div>
            )}

            <table className="unidades-table">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Descrição</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    {unidades.length > 0 ? (
                        unidades.map((unidade) => (
                            <tr key={unidade.id}>
                                <td>{unidade.codigo}</td>
                                <td>{unidade.descricao}</td>
                                <td>
                                    <button onClick={() => handleEditClick(unidade)}>Editar</button>
                                    <button onClick={() => handleDeleteClick(unidade.id)}>Excluir</button>
                                </td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan="3">Nenhuma unidade encontrada.</td>
                        </tr>
                    )}
                </tbody>
            </table>
        </div>
    );
};

export default ManutundPage;