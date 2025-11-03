import React, { useState, useEffect } from 'react';
import '../../css/solimpa.css';

function SolimpaPage() {
    const [artigoCode, setArtigoCode] = useState('');
    const [artigoDescription, setArtigoDescription] = useState('');
    const [tempList, setTempList] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const [artigosCadastrados, setArtigosCadastrados] = useState([]);

    useEffect(() => {
        fetchTempList();
        fetchArtigosCadastrados();
    }, []);

    const fetchTempList = async () => {
        setLoading(true);
        setError('');
        try {
            const response = await fetch('/refactor/php/api/solimpa_api.php');
            const data = await response.json();
            if (response.ok) {
                setTempList(data.records || []);
            } else {
                setError(data.message || 'Erro ao carregar lista temporária.');
            }
        } catch (err) {
            setError('Erro de rede ao carregar lista temporária.');
            console.error('Erro ao carregar lista temporária:', err);
        } finally {
            setLoading(false);
        }
    };

    const fetchArtigosCadastrados = async () => {
        try {
            const response = await fetch('/refactor/php/api/artigos_api.php');
            const data = await response.json();
            if (response.ok) {
                setArtigosCadastrados(data.records || []);
            } else {
                setError(data.message || 'Erro ao carregar artigos cadastrados.');
            }
        } catch (err) {
            setError('Erro de rede ao carregar artigos cadastrados.');
            console.error('Erro ao carregar artigos cadastrados:', err);
        }
    };

    const handleArtigoCodeChange = (e) => {
        const { value } = e.target;
        setArtigoCode(value);
        const foundArtigo = artigosCadastrados.find(art => art.codigo === value);
        if (foundArtigo) {
            setArtigoDescription(foundArtigo.descricao);
        } else {
            setArtigoDescription('');
        }
    };

    const handleArtigoDescriptionChange = (e) => {
        setArtigoDescription(e.target.value);
    };

    const handleAddArtigo = async () => {
        setError('');
        if (!artigoCode || !artigoDescription) {
            setError('Código e descrição do artigo são obrigatórios.');
            return;
        }

        setLoading(true);
        try {
            const response = await fetch('/refactor/php/api/solimpa_api.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ codart: artigoCode, descricao: artigoDescription })
            });
            const data = await response.json();
            if (response.ok) {
                alert(data.message);
                setArtigoCode('');
                setArtigoDescription('');
                fetchTempList(); // Recarregar a lista após adicionar
            } else {
                setError(data.message || 'Erro ao adicionar artigo.');
            }
        } catch (err) {
            setError('Erro de rede ao adicionar artigo.');
            console.error('Erro ao adicionar artigo:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleRemoveArtigo = async (codart) => {
        setError('');
        setLoading(true);
        try {
            const response = await fetch(`/refactor/php/api/solimpa_api.php?codart=${codart}`, {
                method: 'DELETE'
            });
            const data = await response.json();
            if (response.ok) {
                alert(data.message);
                fetchTempList(); // Recarregar a lista após remover
            } else {
                setError(data.message || 'Erro ao remover artigo.');
            }
        } catch (err) {
            setError('Erro de rede ao remover artigo.');
            console.error('Erro ao remover artigo:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleClearList = async () => {
        setError('');
        if (!window.confirm('Tem certeza que deseja esvaziar a lista temporária?')) {
            return;
        }
        setLoading(true);
        try {
            const response = await fetch('/refactor/php/api/solimpa_api.php?action=empty', {
                method: 'DELETE'
            });
            const data = await response.json();
            if (response.ok) {
                alert(data.message);
                fetchTempList(); // Recarregar a lista após esvaziar
            } else {
                setError(data.message || 'Erro ao esvaziar a lista.');
            }
        } catch (err) {
            setError('Erro de rede ao esvaziar a lista.');
            console.error('Erro ao esvaziar a lista:', err);
        } finally {
            setLoading(false);
        }
    };

    const handleGenerateReport = () => {
        // Lógica para gerar relatório (FastReport no Delphi)
        // Aqui, podemos simular ou indicar que uma nova API de relatório seria necessária.
        alert('Funcionalidade de gerar relatório ainda não implementada.');
        console.log('Gerar relatório com base na lista temporária:', tempList);
    };

    return (
        <div className="solimpa-container">
            <h1>Limpeza de Solicitação</h1>
            {error && <div className="error-message">{error}</div>}

            <div className="form-section">
                <label htmlFor="artigoCode">Código do Artigo:</label>
                <input
                    type="text"
                    id="artigoCode"
                    value={artigoCode}
                    onChange={handleArtigoCodeChange}
                    list="artigos-list"
                    disabled={loading}
                />
                <datalist id="artigos-list">
                    {artigosCadastrados.map(art => (
                        <option key={art.codigo} value={art.codigo}>
                            {art.descricao}
                        </option>
                    ))}
                </datalist>
            </div>
            <div className="form-section">
                <label htmlFor="artigoDescription">Descrição do Artigo:</label>
                <input
                    type="text"
                    id="artigoDescription"
                    value={artigoDescription}
                    onChange={handleArtigoDescriptionChange}
                    readOnly
                    disabled={loading}
                />
            </div>
            <button onClick={handleAddArtigo} disabled={loading}>
                {loading ? 'Adicionando...' : 'Adicionar Artigo'}
            </button>

            <h2>Itens na Lista Temporária ({tempList.length})</h2>
            <table className="solimpa-table">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Descrição</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    {tempList.length > 0 ? (
                        tempList.map((item, index) => (
                            <tr key={index}>
                                <td>{item.codart}</td>
                                <td>{item.descricao}</td>
                                <td>
                                    <button onClick={() => handleRemoveArtigo(item.codart)} disabled={loading}>
                                        Remover
                                    </button>
                                </td>
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan="3">Nenhum item na lista temporária.</td>
                        </tr>
                    )}
                </tbody>
            </table>

            <div className="action-buttons">
                <button onClick={handleClearList} disabled={loading}>
                    Esvaziar Lista
                </button>
                <button onClick={handleGenerateReport} disabled={loading}>
                    Gerar Relatório
                </button>
            </div>
        </div>
    );
}

export default SolimpaPage;