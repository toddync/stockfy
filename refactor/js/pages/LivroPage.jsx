import React, { useState, useEffect } from 'react';
import '../../css/livro.css';

const LivroPage = () => {
    const [livros, setLivros] = useState([]);
    const [currentLivro, setCurrentLivro] = useState({
        Datmov: '',
        Item: '',
        Histor: '',
        Observ: '',
        Oripag: '',
        Tippag: '',
        Numpag: '',
        Valpag: '',
        Sinal: '',
        Tipdoc: '',
        Numdoc: '',
        Parcel: ''
    });
    const [isEditing, setIsEditing] = useState(false);
    const [message, setMessage] = useState('');
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        fetchLivros();
    }, []);

    const fetchLivros = async () => {
        try {
            const response = await fetch('http://localhost/api/livros_api.php');
            const data = await response.json();
            if (response.ok) {
                setLivros(data);
            } else {
                setMessage(data.message || 'Erro ao buscar livros.');
            }
        } catch (error) {
            setMessage('Erro de rede ao buscar livros.');
            console.error('Erro ao buscar livros:', error);
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCurrentLivro({ ...currentLivro, [name]: value });
    };

    const handleSearch = async () => {
        if (!searchTerm) {
            fetchLivros();
            return;
        }
        try {
            const [datmov, item] = searchTerm.split(',');
            if (!datmov || !item) {
                setMessage('Formato de busca inválido. Use "YYYY-MM-DD,ITEM".');
                return;
            }
            const response = await fetch(`http://localhost/api/livros_api.php?Datmov=${datmov}&Item=${item}`);
            const data = await response.json();
            if (response.ok) {
                setLivros([data]);
            } else {
                setMessage(data.message || 'Livro não encontrado.');
                setLivros([]);
            }
        } catch (error) {
            setMessage('Erro de rede ao buscar livro.');
            console.error('Erro ao buscar livro:', error);
        }
    };

    const handleCreate = async () => {
        try {
            const response = await fetch('http://localhost/api/livros_api.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentLivro),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                resetForm();
                fetchLivros();
            } else {
                setMessage(data.message || 'Erro ao criar livro.');
            }
        } catch (error) {
            setMessage('Erro de rede ao criar livro.');
            console.error('Erro ao criar livro:', error);
        }
    };

    const handleEdit = (livro) => {
        setCurrentLivro(livro);
        setIsEditing(true);
    };

    const handleUpdate = async () => {
        try {
            const response = await fetch('http://localhost/api/livros_api.php', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(currentLivro),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                resetForm();
                fetchLivros();
            } else {
                setMessage(data.message || 'Erro ao atualizar livro.');
            }
        } catch (error) {
            setMessage('Erro de rede ao atualizar livro.');
            console.error('Erro ao atualizar livro:', error);
        }
    };

    const handleDelete = async (datmov, item) => {
        try {
            const response = await fetch('http://localhost/api/livros_api.php', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ Datmov: datmov, Item: item }),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                fetchLivros();
            } else {
                setMessage(data.message || 'Erro ao excluir livro.');
            }
        } catch (error) {
            setMessage('Erro de rede ao excluir livro.');
            console.error('Erro ao excluir livro:', error);
        }
    };

    const resetForm = () => {
        setCurrentLivro({
            Datmov: '',
            Item: '',
            Histor: '',
            Observ: '',
            Oripag: '',
            Tippag: '',
            Numpag: '',
            Valpag: '',
            Sinal: '',
            Tipdoc: '',
            Numdoc: '',
            Parcel: ''
        });
        setIsEditing(false);
    };

    return (
        <div className="livro-container">
            <h1>Gerenciamento de Livros</h1>
            {message && <div className="message">{message}</div>}

            <div className="form-section">
                <h2>{isEditing ? 'Editar Livro' : 'Novo Livro'}</h2>
                <input
                    type="date"
                    name="Datmov"
                    placeholder="Data Movimento (YYYY-MM-DD)"
                    value={currentLivro.Datmov}
                    onChange={handleInputChange}
                    required
                    disabled={isEditing}
                />
                <input
                    type="text"
                    name="Item"
                    placeholder="Item"
                    value={currentLivro.Item}
                    onChange={handleInputChange}
                    required
                    disabled={isEditing}
                />
                <input
                    type="text"
                    name="Histor"
                    placeholder="Histórico"
                    value={currentLivro.Histor}
                    onChange={handleInputChange}
                    required
                />
                <input
                    type="text"
                    name="Observ"
                    placeholder="Observação"
                    value={currentLivro.Observ}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Oripag"
                    placeholder="Origem Pagamento"
                    value={currentLivro.Oripag}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Tippag"
                    placeholder="Tipo Pagamento"
                    value={currentLivro.Tippag}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Numpag"
                    placeholder="Número Pagamento"
                    value={currentLivro.Numpag}
                    onChange={handleInputChange}
                />
                <input
                    type="number"
                    name="Valpag"
                    placeholder="Valor Pagamento"
                    value={currentLivro.Valpag}
                    onChange={handleInputChange}
                    step="0.01"
                    required
                />
                <input
                    type="text"
                    name="Sinal"
                    placeholder="Sinal"
                    value={currentLivro.Sinal}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Tipdoc"
                    placeholder="Tipo Documento"
                    value={currentLivro.Tipdoc}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Numdoc"
                    placeholder="Número Documento"
                    value={currentLivro.Numdoc}
                    onChange={handleInputChange}
                />
                <input
                    type="text"
                    name="Parcel"
                    placeholder="Parcela"
                    value={currentLivro.Parcel}
                    onChange={handleInputChange}
                />
                {isEditing ? (
                    <>
                        <button onClick={handleUpdate}>Atualizar Livro</button>
                        <button onClick={resetForm}>Cancelar</button>
                    </>
                ) : (
                    <button onClick={handleCreate}>Adicionar Livro</button>
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
                <h2>Livros Cadastrados</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Data Mov.</th>
                            <th>Item</th>
                            <th>Histórico</th>
                            <th>Observação</th>
                            <th>Origem Pag.</th>
                            <th>Tipo Pag.</th>
                            <th>Num. Pag.</th>
                            <th>Valor Pag.</th>
                            <th>Sinal</th>
                            <th>Tipo Doc.</th>
                            <th>Num. Doc.</th>
                            <th>Parcela</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {livros.map((livro) => (
                            <tr key={`${livro.Datmov}-${livro.Item}`}>
                                <td>{livro.Datmov}</td>
                                <td>{livro.Item}</td>
                                <td>{livro.Histor}</td>
                                <td>{livro.Observ}</td>
                                <td>{livro.Oripag}</td>
                                <td>{livro.Tippag}</td>
                                <td>{livro.Numpag}</td>
                                <td>{livro.Valpag}</td>
                                <td>{livro.Sinal}</td>
                                <td>{livro.Tipdoc}</td>
                                <td>{livro.Numdoc}</td>
                                <td>{livro.Parcel}</td>
                                <td>
                                    <button onClick={() => handleEdit(livro)}>Editar</button>
                                    <button onClick={() => handleDelete(livro.Datmov, livro.Item)}>Excluir</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default LivroPage;