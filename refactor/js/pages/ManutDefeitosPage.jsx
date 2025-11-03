import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client';
import '../../css/manut-defeitos.css';

function ManutDefeitosPage() {
    const [dataInicio, setDataInicio] = useState('');
    const [dataFim, setDataFim] = useState('');
    const [tipoPesquisa, setTipoPesquisa] = useState('Numnot'); // Default to search by Numnot
    const [termoPesquisa, setTermoPesquisa] = useState('');
    const [defeitos, setDefeitos] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const [message, setMessage] = useState(null);
    const [showFormModal, setShowFormModal] = useState(false);
    const [currentDefeito, setCurrentDefeito] = useState(null); // Para edição/consulta

    useEffect(() => {
        fetchDefeitos();
    }, []);

    const fetchDefeitos = async (filters = {}) => {
        setLoading(true);
        setError(null);
        setMessage(null);
        try {
            const queryParams = new URLSearchParams(filters).toString();
            const response = await fetch(`../php/api/defeitos_api.php?${queryParams}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const result = await response.json();
            if (result.success) {
                setDefeitos(result.data);
            } else {
                setError(result.message || 'Erro ao buscar defeitos.');
            }
        } catch (e) {
            setError('Falha ao conectar com a API: ' + e.message);
        } finally {
            setLoading(false);
        }
    };

    const handleFilter = () => {
        // Lógica para filtrar por período de datas (Button10Click)
        if (!dataInicio || !dataFim) {
            setMessage({ type: 'error', text: 'Por favor, informe as datas de início e fim para filtrar.' });
            return;
        }
        fetchDefeitos({ dataInicio, dataFim });
    };

    const handleSearch = () => {
        // Lógica para pesquisa geral (Edit1Exit)
        if (!termoPesquisa) {
            setMessage({ type: 'error', text: 'Por favor, informe o termo de pesquisa.' });
            return;
        }
        fetchDefeitos({ tipoPesquisa, termoPesquisa });
    };

    const handleImplantar = () => {
        setCurrentDefeito(null); // Limpa para um novo registro
        setShowFormModal(true);
    };

    const handleAlterar = (defeito) => {
        setCurrentDefeito(defeito);
        setShowFormModal(true);
    };

    const handleConsultar = (defeito) => {
        setCurrentDefeito(defeito);
        // Poderíamos ter um modal de visualização separado ou usar o mesmo modal em modo somente leitura
        setMessage({ type: 'info', text: `Consultando defeito Numnot: ${defeito.Numnot}` });
        // Por enquanto, apenas exibe a mensagem. A implementação completa pode abrir um modal de detalhes.
    };

    const handleExcluir = async (numnot) => {
        if (!window.confirm(`Tem certeza que deseja excluir o defeito ${numnot}?`)) {
            return;
        }
        setLoading(true);
        setError(null);
        setMessage(null);
        try {
            const response = await fetch(`../php/api/defeitos_api.php?Numnot=${numnot}`, {
                method: 'DELETE',
            });
            const result = await response.json();
            if (result.success) {
                setMessage({ type: 'success', text: result.message });
                fetchDefeitos(); // Recarrega a lista
            } else {
                setError(result.message || 'Erro ao excluir defeito.');
            }
        } catch (e) {
            setError('Falha ao conectar com a API para exclusão: ' + e.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container">
            <h1>Manutenção de Defeitos</h1>

            {message && (
                <div className={`message ${message.type}`}>
                    {message.text}
                </div>
            )}
            {loading && <div className="message info">Carregando...</div>}
            {error && <div className="message error">{error}</div>}

            <div className="filter-section">
                <div className="filter-group">
                    <label htmlFor="dataInicio">Data Início:</label>
                    <input
                        type="date"
                        id="dataInicio"
                        value={dataInicio}
                        onChange={(e) => setDataInicio(e.target.value)}
                    />
                </div>
                <div className="filter-group">
                    <label htmlFor="dataFim">Data Fim:</label>
                    <input
                        type="date"
                        id="dataFim"
                        value={dataFim}
                        onChange={(e) => setDataFim(e.target.value)}
                    />
                </div>
                <button className="primary" onClick={handleFilter}>Filtrar por Período</button>
            </div>

            <div className="filter-section">
                <div className="filter-group">
                    <label htmlFor="tipoPesquisa">Pesquisar por:</label>
                    <select
                        id="tipoPesquisa"
                        value={tipoPesquisa}
                        onChange={(e) => setTipoPesquisa(e.target.value)}
                    >
                        <option value="Numnot">Número da Nota</option>
                        <option value="Codart">Código do Artigo</option>
                        <option value="Descricao">Descrição</option>
                    </select>
                </div>
                <div className="filter-group">
                    <label htmlFor="termoPesquisa">Termo:</label>
                    <input
                        type="text"
                        id="termoPesquisa"
                        value={termoPesquisa}
                        onChange={(e) => setTermoPesquisa(e.target.value)}
                        onKeyPress={(e) => { if (e.key === 'Enter') handleSearch(); }}
                    />
                </div>
                <button className="primary" onClick={handleSearch}>Pesquisar</button>
            </div>

            <div className="button-group">
                <button className="primary" onClick={handleImplantar}>Implantar</button>
                <button className="secondary" onClick={handleAlterar}>Alterar</button>
                <button className="secondary" onClick={handleConsultar}>Consultar</button>
                <button className="secondary" onClick={handleExcluir}>Excluir</button>
            </div>

            <table className="data-table">
                <thead>
                    <tr>
                        <th>Número da Nota</th>
                        <th>Data da Nota</th>
                        <th>Valor da Nota</th>
                        {(tipoPesquisa === 'Codart' || tipoPesquisa === 'Descricao') && (
                            <>
                                <th>Código do Artigo</th>
                                <th>Descrição</th>
                                <th>Quantidade</th>
                                <th>Preço Custo</th>
                            </>
                        )}
                    </tr>
                </thead>
                <tbody>
                    {defeitos.length > 0 ? (
                        defeitos.map((defeito, index) => (
                            <tr key={index}>
                                <td>{defeito.Numnot}</td>
                                <td>{defeito.Datnot}</td>
                                <td>{defeito.Valnot}</td>
                                {(tipoPesquisa === 'Codart' || tipoPesquisa === 'Descricao') && (
                                    <>
                                        <td>{defeito.Codart}</td>
                                        <td>{defeito.Descricao}</td>
                                        <td>{defeito.Quant}</td>
                                        <td>{defeito.Precus}</td>
                                    </>
                                )}
                            </tr>
                        ))
                    ) : (
                        <tr>
                            <td colSpan={tipoPesquisa === 'Codart' || tipoPesquisa === 'Descricao' ? 7 : 3}>Nenhum defeito encontrado.</td>
                        </tr>
                    )}
                </tbody>
            </table>

            {showFormModal && (
                <DefeitoFormModal
                    defeito={currentDefeito}
                    onClose={() => setShowFormModal(false)}
                    onSave={() => {
                        setShowFormModal(false);
                        fetchDefeitos(); // Recarrega a lista após salvar
                    }}
                />
            )}
        </div>
    );
}

// Componente de Modal de Formulário para Defeitos
function DefeitoFormModal({ defeito, onClose, onSave }) {
    const [numnot, setNumnot] = useState(defeito ? defeito.Numnot : '');
    const [datnot, setDatnot] = useState(defeito ? defeito.Datnot : '');
    const [valnot, setValnot] = useState(defeito ? defeito.Valnot : '');
    const [formMessage, setFormMessage] = useState(null);
    const [formLoading, setFormLoading] = useState(false);

    const isEditing = defeito !== null;

    const handleSubmit = async (e) => {
        e.preventDefault();
        setFormLoading(true);
        setFormMessage(null);

        const method = isEditing ? 'PUT' : 'POST';
        const url = `../php/api/defeitos_api.php${isEditing ? `?Numnot=${numnot}` : ''}`;
        const body = { Numnot: numnot, Datnot: datnot, Valnot: parseFloat(valnot) };

        try {
            const response = await fetch(url, {
                method: method,
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(body),
            });
            const result = await response.json();
            if (result.success) {
                setFormMessage({ type: 'success', text: result.message });
                onSave();
            } else {
                setFormMessage({ type: 'error', text: result.message || 'Erro ao salvar defeito.' });
            }
        } catch (e) {
            setFormMessage({ type: 'error', text: 'Falha ao conectar com a API: ' + e.message });
        } finally {
            setFormLoading(false);
        }
    };

    return (
        <div className="modal-overlay">
            <div className="modal-content">
                <h2>{isEditing ? 'Alterar Defeito' : 'Implantar Novo Defeito'}</h2>
                {formMessage && (
                    <div className={`message ${formMessage.type}`}>
                        {formMessage.text}
                    </div>
                )}
                {formLoading && <div className="message info">Salvando...</div>}
                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="numnot">Número da Nota:</label>
                        <input
                            type="text"
                            id="numnot"
                            value={numnot}
                            onChange={(e) => setNumnot(e.target.value)}
                            required
                            readOnly={isEditing} // Numnot não pode ser alterado na edição
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="datnot">Data da Nota:</label>
                        <input
                            type="date"
                            id="datnot"
                            value={datnot}
                            onChange={(e) => setDatnot(e.target.value)}
                            required
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="valnot">Valor da Nota:</label>
                        <input
                            type="number"
                            id="valnot"
                            value={valnot}
                            onChange={(e) => setValnot(e.target.value)}
                            step="0.01"
                            required
                        />
                    </div>
                    <div className="form-actions">
                        <button type="submit" className="primary" disabled={formLoading}>Salvar</button>
                        <button type="button" className="secondary" onClick={onClose} disabled={formLoading}>Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    );
}

ReactDOM.createRoot(document.getElementById('root')).render(<ManutDefeitosPage />);