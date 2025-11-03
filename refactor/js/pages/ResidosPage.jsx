import React, { useState, useEffect } from 'react';
import '../../css/residos.css';

const ResidosPage = () => {
    const [residos, setResidos] = useState([]);
    const [currentResido, setCurrentResido] = useState({
        Datmov: '',
        Item: '',
        Numdoc: '',
        Valpag: ''
    });
    const [isEditing, setIsEditing] = useState(false);
    const [message, setMessage] = useState('');
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        fetchResidos();
    }, []);

    const fetchResidos = async () => {
        try {
            const response = await fetch('http://localhost/api/residos_api.php');
            const data = await response.json();
            if (response.ok) {
                setResidos(data);
            } else {
                setMessage(data.message || 'Erro ao buscar resíduos.');
            }
        } catch (error) {
            setMessage('Erro de rede ao buscar resíduos.');
            console.error('Erro ao buscar resíduos:', error);
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCurrentResido({ ...currentResido, [name]: value });
    };

    const handleSearch = async () => {
        if (!searchTerm) {
            fetchResidos();
            return;
        }
        try {
            const [datmov, item] = searchTerm.split(',');
            if (!datmov || !item) {
                setMessage('Formato de busca inválido. Use "YYYY-MM-DD,ITEM".');
                return;
            }
            const response = await fetch(`http://localhost/api/residos_api.php?Datmov=${datmov}&Item=${item}`);
            const data = await response.json();
            if (response.ok) {
                setResidos([data]);
            } else {
                setMessage(data.message || 'Resido não encontrado.');
                setResidos([]);
            }
        } catch (error) {
            setMessage('Erro de rede ao buscar resido.');
            console.error('Erro ao buscar resido:', error);
        }
    };

    const handleCreate = async () => {
        try {
            const response = await fetch('http://localhost/api/residos_api.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentResido),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                resetForm();
                fetchResidos();
            } else {
                setMessage(data.message || 'Erro ao criar resido.');
            }
        } catch (error) {
            setMessage('Erro de rede ao criar resido.');
            console.error('Erro ao criar resido:', error);
        }
    };

    const handleEdit = (resido) => {
        setCurrentResido(resido);
        setIsEditing(true);
    };

    const handleUpdate = async () => {
        try {
            const response = await fetch('http://localhost/api/residos_api.php', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentResido),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                resetForm();
                fetchResidos();
            } else {
                setMessage(data.message || 'Erro ao atualizar resido.');
            }
        } catch (error) {
            setMessage('Erro de rede ao atualizar resido.');
            console.error('Erro ao atualizar resido:', error);
        }
    };

    const handleDelete = async (datmov, item) => {
        try {
            const response = await fetch('http://localhost/api/residos_api.php', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ Datmov: datmov, Item: item }),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                fetchResidos();
            } else {
                setMessage(data.message || 'Erro ao excluir resido.');
            }
        } catch (error) {
            setMessage('Erro de rede ao excluir resido.');
            console.error('Erro ao excluir resido:', error);
        }
    };

    const resetForm = () => {
        setCurrentResido({
            Datmov: '',
            Item: '',
            Numdoc: '',
            Valpag: ''
        });
        setIsEditing(false);
    };

    return (
        <div className="residos-container">
            <h1>Gerenciamento de Resíduos</h1>
            {message && <div className="message">{message}</div>}

            <div className="form-section">
                <h2>{isEditing ? 'Editar Resido' : 'Novo Resido'}</h2>
                <input
                    type="date"
                    name="Datmov"
                    placeholder="Data Movimento (YYYY-MM-DD)"
                    value={currentResido.Datmov}
                    onChange={handleInputChange}
                    required
                    disabled={isEditing}
                />
                <input
                    type="text"
                    name="Item"
                    placeholder="Item"
                    value={currentResido.Item}
                    onChange={handleInputChange}
                    required
                    disabled={isEditing}
                />
                <input
                    type="text"
                    name="Numdoc"
                    placeholder="Número Documento"
                    value={currentResido.Numdoc}
                    onChange={handleInputChange}
                />
                <input
                    type="number"
                    name="Valpag"
                    placeholder="Valor Pagamento"
                    value={currentResido.Valpag}
                    onChange={handleInputChange}
                    step="0.01"
                    required
                />
                {isEditing ? (
                    <>
                        <button onClick={handleUpdate}>Atualizar Resido</button>
                        <button onClick={resetForm}>Cancelar</button>
                    </>
                ) : (
                    <button onClick={handleCreate}>Adicionar Resido</button>
                )}
            </div>

            <div className="search-section">
                <input
                    type="text"
                    placeholder="Buscar por Data Movimento,Item (YYYY-MM-DD,ITEM)"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                />
                <button onClick={handleSearch}>Buscar</button>
            </div>

            <div className="list-section">
                <h2>Resíduos Cadastrados</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Data Mov.</th>
                            <th>Item</th>
                            <th>Num. Doc.</th>
                            <th>Valor Pag.</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {residos.map((resido) => (
                            <tr key={`${resido.Datmov}-${resido.Item}`}>
                                <td>{resido.Datmov}</td>
                                <td>{resido.Item}</td>
                                <td>{resido.Numdoc}</td>
                                <td>{resido.Valpag}</td>
                                <td>
                                    <button onClick={() => handleEdit(resido)}>Editar</button>
                                    <button onClick={() => handleDelete(resido.Datmov, resido.Item)}>Excluir</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ResidosPage;