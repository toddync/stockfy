import React, { useState, useEffect } from 'react';
import Alerta from '../components/Alerta'; // Assumindo que existe um componente Alerta

const FilialSolPage = () => {
    const [filiais, setFiliais] = useState([]);
    const [currentFilial, setCurrentFilial] = useState({ id: null, nome: '', endereco: '', telefone: '' });
    const [isEditing, setIsEditing] = useState(false);
    const [message, setMessage] = useState(null);
    const [messageType, setMessageType] = useState(null);

    const API_URL = 'http://localhost/refactor/php/api/filial_sol.php'; // Ajuste a URL conforme necessário

    useEffect(() => {
        fetchFiliais();
    }, []);

    const fetchFiliais = async () => {
        try {
            const response = await fetch(API_URL);
            const data = await response.json();
            if (data.records) {
                setFiliais(data.records);
            } else {
                setFiliais([]);
            }
        } catch (error) {
            console.error("Erro ao buscar filiais:", error);
            showMessage("Erro ao carregar filiais.", "error");
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCurrentFilial({ ...currentFilial, [name]: value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (isEditing) {
            await updateFilial();
        } else {
            await createFilial();
        }
    };

    const createFilial = async () => {
        try {
            const response = await fetch(API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentFilial),
            });
            const data = await response.json();
            if (response.ok) {
                showMessage(data.message, "success");
                setCurrentFilial({ id: null, nome: '', endereco: '', telefone: '' });
                fetchFiliais();
            } else {
                showMessage(data.message, "error");
            }
        } catch (error) {
            console.error("Erro ao criar filial:", error);
            showMessage("Erro ao criar filial.", "error");
        }
    };

    const updateFilial = async () => {
        try {
            const response = await fetch(API_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentFilial),
            });
            const data = await response.json();
            if (response.ok) {
                showMessage(data.message, "success");
                setCurrentFilial({ id: null, nome: '', endereco: '', telefone: '' });
                setIsEditing(false);
                fetchFiliais();
            } else {
                showMessage(data.message, "error");
            }
        } catch (error) {
            console.error("Erro ao atualizar filial:", error);
            showMessage("Erro ao atualizar filial.", "error");
        }
    };

    const editFilial = (filial) => {
        setCurrentFilial(filial);
        setIsEditing(true);
    };

    const deleteFilial = async (id) => {
        if (window.confirm("Tem certeza que deseja deletar esta filial?")) {
            try {
                const response = await fetch(API_URL, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ id: id }),
                });
                const data = await response.json();
                if (response.ok) {
                    showMessage(data.message, "success");
                    fetchFiliais();
                } else {
                    showMessage(data.message, "error");
                }
            } catch (error) {
                console.error("Erro ao deletar filial:", error);
                showMessage("Erro ao deletar filial.", "error");
            }
        }
    };

    const showMessage = (msg, type) => {
        setMessage(msg);
        setMessageType(type);
        setTimeout(() => {
            setMessage(null);
            setMessageType(null);
        }, 3000);
    };

    return (
        <div className="filial-sol-container">
            <h1>Gerenciamento de Filiais</h1>

            {message && <Alerta message={message} type={messageType} />}

            <form onSubmit={handleSubmit} className="filial-form">
                <input
                    type="text"
                    name="nome"
                    placeholder="Nome da Filial"
                    value={currentFilial.nome}
                    onChange={handleInputChange}
                    required
                />
                <input
                    type="text"
                    name="endereco"
                    placeholder="Endereço"
                    value={currentFilial.endereco}
                    onChange={handleInputChange}
                    required
                />
                <input
                    type="text"
                    name="telefone"
                    placeholder="Telefone"
                    value={currentFilial.telefone}
                    onChange={handleInputChange}
                    required
                />
                <button type="submit">{isEditing ? 'Atualizar Filial' : 'Adicionar Filial'}</button>
                {isEditing && <button type="button" onClick={() => { setIsEditing(false); setCurrentFilial({ id: null, nome: '', endereco: '', telefone: '' }); }}>Cancelar</button>}
            </form>

            <div className="filial-list">
                <h2>Lista de Filiais</h2>
                {filiais.length > 0 ? (
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Endereço</th>
                                <th>Telefone</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            {filiais.map((filial) => (
                                <tr key={filial.id}>
                                    <td>{filial.id}</td>
                                    <td>{filial.nome}</td>
                                    <td>{filial.endereco}</td>
                                    <td>{filial.telefone}</td>
                                    <td>
                                        <button onClick={() => editFilial(filial)}>Editar</button>
                                        <button onClick={() => deleteFilial(filial.id)}>Deletar</button>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <p>Nenhuma filial cadastrada.</p>
                )}
            </div>
        </div>
    );
};

export default FilialSolPage;