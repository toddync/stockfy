import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom'; // Assumindo React Router para navegação

const AtivaClientePage = () => {
    const { id } = useParams(); // Pega o ID do cliente da URL
    const navigate = useNavigate();

    const [clienteId, setClienteId] = useState(id || '');
    const [ativo, setAtivo] = useState('A'); // 'A' para Ativo, 'D' para Desativado
    const [observacoes, setObservacoes] = useState('');
    const [novaObservacao, setNovaObservacao] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const [message, setMessage] = useState('');

    const API_BASE_URL = 'http://localhost/refactor/php/api/clientes.php'; // Ajuste conforme sua URL base da API

    useEffect(() => {
        if (clienteId) {
            fetchClienteData(clienteId);
        }
    }, [clienteId]);

    const fetchClienteData = async (id) => {
        setLoading(true);
        setError(null);
        try {
            const response = await fetch(`${API_BASE_URL}?id=${id}`);
            if (!response.ok) {
                throw new Error(`Erro HTTP: ${response.status}`);
            }
            const data = await response.json();
            setAtivo(data.ativo);
            setObservacoes(data.observacoes);
        } catch (err) {
            setError("Erro ao carregar dados do cliente: " + err.message);
            setObservacoes('');
            setAtivo('A');
        } finally {
            setLoading(false);
        }
    };

    const handleUpdateCliente = async () => {
        setLoading(true);
        setError(null);
        setMessage('');

        const updatedObservacoes = novaObservacao ? `${observacoes}\n${novaObservacao}`.trim() : observacoes;

        try {
            const response = await fetch(API_BASE_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    id: clienteId,
                    ativo: ativo,
                    observacoes: updatedObservacoes,
                }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.message || `Erro HTTP: ${response.status}`);
            }

            const result = await response.json();
            setMessage(result.message || "Cliente atualizado com sucesso!");
            setNovaObservacao(''); // Limpa o campo de nova observação
            fetchClienteData(clienteId); // Recarrega os dados para mostrar as observações atualizadas
        } catch (err) {
            setError("Erro ao atualizar cliente: " + err.message);
        } finally {
            setLoading(false);
        }
    };

    const handleComboBoxChange = (e) => {
        const selectedValue = e.target.value;
        setAtivo(selectedValue);
        if (selectedValue === 'A') {
            setNovaObservacao(''); // Limpa nova observação se o cliente for ativado
        }
    };

    const handleKeyDown = (e) => {
        if (e.key === 'Enter' || e.key === 'ArrowDown') {
            e.preventDefault();
            const form = e.target.form;
            const index = Array.prototype.indexOf.call(form, e.target);
            form.elements[index + 1]?.focus();
        } else if (e.key === 'ArrowUp') {
            e.preventDefault();
            const form = e.target.form;
            const index = Array.prototype.indexOf.call(form, e.target);
            form.elements[index - 1]?.focus();
        }
    };

    return (
        <div className="ativa-cliente-container">
            <h1>Ativar/Desativar Cliente</h1>
            {message && <div className="success-message">{message}</div>}
            {error && <div className="error-message">{error}</div>}

            <div className="form-group">
                <label htmlFor="clienteId">ID do Cliente:</label>
                <input
                    type="text"
                    id="clienteId"
                    value={clienteId}
                    onChange={(e) => setClienteId(e.target.value)}
                    onBlur={() => clienteId && fetchClienteData(clienteId)}
                    onKeyDown={handleKeyDown}
                    disabled={loading}
                />
            </div>

            <div className="form-group">
                <label htmlFor="status">Status:</label>
                <select
                    id="status"
                    value={ativo}
                    onChange={handleComboBoxChange}
                    onKeyDown={handleKeyDown}
                    disabled={loading}
                >
                    <option value="A">Ativo</option>
                    <option value="D">Desativado</option>
                </select>
            </div>

            <div className="form-group">
                <label htmlFor="observacoesExistentes">Observações Existentes:</label>
                <textarea
                    id="observacoesExistentes"
                    value={observacoes}
                    readOnly
                    rows="5"
                    disabled={loading}
                ></textarea>
            </div>

            {ativo === 'D' && (
                <div className="form-group">
                    <label htmlFor="novaObservacao">Nova Observação (Motivo Desativação):</label>
                    <input
                        type="text"
                        id="novaObservacao"
                        value={novaObservacao}
                        onChange={(e) => setNovaObservacao(e.target.value)}
                        onKeyDown={handleKeyDown}
                        disabled={loading}
                    />
                </div>
            )}

            <button onClick={handleUpdateCliente} disabled={loading}>
                {loading ? 'Salvando...' : 'Salvar'}
            </button>
        </div>
    );
};

export default AtivaClientePage;