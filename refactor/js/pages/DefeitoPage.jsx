import React, { useState, useEffect } from 'react';
import '../../css/defeito.css';

const API_BASE_URL = 'http://localhost/rosa/refactor/php/api/movimentacoes_estoque.php';
const PRODUTO_API_URL = 'http://localhost/rosa/refactor/php/api/produtos.php';

const DefeitoPage = () => {
    const [numeroDocumento, setNumeroDocumento] = useState('');
    const [dataMovimentacao, setDataMovimentacao] = useState('');
    const [produtoId, setProdutoId] = useState('');
    const [descricaoProduto, setDescricaoProduto] = useState('');
    const [quantidade, setQuantidade] = useState('');
    const [precoCusto, setPrecoCusto] = useState('');
    const [movimentacoes, setMovimentacoes] = useState([]);
    const [totalValorNota, setTotalValorNota] = useState(0);
    const [operacao, setOperacao] = useState('Implantar'); // Implantar, Alterar, Excluir, Consultar
    const [message, setMessage] = useState({ type: '', text: '' });

    useEffect(() => {
        // Define a data atual como padrão
        setDataMovimentacao(new Date().toISOString().split('T')[0]);
        if (operacao === 'Implantar') {
            generateNewNumeroDocumento();
        }
    }, [operacao]);

    const generateNewNumeroDocumento = async () => {
        try {
            const response = await fetch(`${API_BASE_URL}?action=generateNumeroDocumento`);
            const data = await response.json();
            if (data.numero_documento) {
                setNumeroDocumento(data.numero_documento);
            } else {
                setMessage({ type: 'error', text: 'Erro ao gerar número de documento.' });
            }
        } catch (error) {
            console.error('Erro ao gerar número de documento:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao gerar número de documento.' });
        }
    };

    const fetchMovimentacoes = async (docNum) => {
        try {
            const response = await fetch(`${API_BASE_URL}?numero_documento=${docNum}`);
            const data = await response.json();
            if (response.ok) {
                setMovimentacoes(data.records || []);
                setTotalValorNota(data.total_value || 0);
                setMessage({ type: '', text: '' });
            } else {
                setMovimentacoes([]);
                setTotalValorNota(0);
                setMessage({ type: 'error', text: data.message || 'Erro ao buscar movimentações.' });
            }
        } catch (error) {
            console.error('Erro ao buscar movimentações:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao buscar movimentações.' });
        }
    };

    const fetchProduto = async (id) => {
        try {
            const response = await fetch(`${PRODUTO_API_URL}?id=${id}`);
            const data = await response.json();
            if (response.ok) {
                setDescricaoProduto(data.descricao);
                setPrecoCusto(data.preco_custo);
                setMessage({ type: '', text: '' });
            } else {
                setDescricaoProduto('');
                setPrecoCusto('');
                setMessage({ type: 'error', text: data.message || 'Produto não encontrado.' });
            }
        } catch (error) {
            console.error('Erro ao buscar produto:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao buscar produto.' });
        }
    };

    const handleNumeroDocumentoChange = (e) => {
        const value = e.target.value;
        setNumeroDocumento(value);
        if (value && operacao !== 'Implantar') {
            fetchMovimentacoes(value);
        } else if (!value) {
            setMovimentacoes([]);
            setTotalValorNota(0);
        }
    };

    const handleProdutoIdChange = (e) => {
        const value = e.target.value;
        setProdutoId(value);
        if (value) {
            fetchProduto(value);
        } else {
            setDescricaoProduto('');
            setPrecoCusto('');
        }
    };

    const handleAddItem = async () => {
        if (!numeroDocumento || !dataMovimentacao || !produtoId || !quantidade || !precoCusto) {
            setMessage({ type: 'error', text: 'Preencha todos os campos para adicionar um item.' });
            return;
        }

        const newItem = {
            numero_documento: numeroDocumento,
            data_movimentacao: dataMovimentacao,
            tipo: 'defeito',
            produto_id: produtoId,
            quantidade: parseFloat(quantidade),
            preco_custo: parseFloat(precoCusto),
        };

        try {
            const response = await fetch(API_BASE_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(newItem),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage({ type: 'success', text: data.message });
                fetchMovimentacoes(numeroDocumento); // Recarrega a lista de movimentações
                setProdutoId('');
                setDescricaoProduto('');
                setQuantidade('');
                setPrecoCusto('');
            } else {
                setMessage({ type: 'error', text: data.message || 'Erro ao adicionar item.' });
            }
        } catch (error) {
            console.error('Erro ao adicionar item:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao adicionar item.' });
        }
    };

    const handleUpdateItem = async (itemToUpdate) => {
        if (!itemToUpdate.id || !itemToUpdate.numero_documento || !itemToUpdate.produto_id || !itemToUpdate.quantidade || !itemToUpdate.preco_custo) {
            setMessage({ type: 'error', text: 'Dados incompletos para atualizar o item.' });
            return;
        }

        try {
            const response = await fetch(API_BASE_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(itemToUpdate),
            });
            const data = await response.json();
            if (response.ok) {
                setMessage({ type: 'success', text: data.message });
                fetchMovimentacoes(numeroDocumento);
            } else {
                setMessage({ type: 'error', text: data.message || 'Erro ao atualizar item.' });
            }
        } catch (error) {
            console.error('Erro ao atualizar item:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao atualizar item.' });
        }
    };

    const handleDeleteItem = async (id) => {
        try {
            const response = await fetch(`${API_BASE_URL}?id=${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                },
            });
            const data = await response.json();
            if (response.ok) {
                setMessage({ type: 'success', text: data.message });
                fetchMovimentacoes(numeroDocumento);
            } else {
                setMessage({ type: 'error', text: data.message || 'Erro ao excluir item.' });
            }
        } catch (error) {
            console.error('Erro ao excluir item:', error);
            setMessage({ type: 'error', text: 'Erro de rede ao excluir item.' });
        }
    };

    const handleFinalizarNota = async () => {
        if (operacao === 'Excluir') {
            try {
                const response = await fetch(`${API_BASE_URL}?numero_documento=${numeroDocumento}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                });
                const data = await response.json();
                if (response.ok) {
                    setMessage({ type: 'success', text: data.message });
                    handleClearForm();
                } else {
                    setMessage({ type: 'error', text: data.message || 'Erro ao excluir nota completa.' });
                }
            } catch (error) {
                console.error('Erro ao excluir nota completa:', error);
                setMessage({ type: 'error', text: 'Erro de rede ao excluir nota completa.' });
            }
        } else {
            setMessage({ type: 'success', text: `Nota de Defeito ${numeroDocumento} finalizada com sucesso!` });
            handleClearForm();
        }
    };

    const handleClearForm = () => {
        setNumeroDocumento('');
        setDataMovimentacao(new Date().toISOString().split('T')[0]);
        setProdutoId('');
        setDescricaoProduto('');
        setQuantidade('');
        setPrecoCusto('');
        setMovimentacoes([]);
        setTotalValorNota(0);
        setMessage({ type: '', text: '' });
        setOperacao('Implantar');
        generateNewNumeroDocumento();
    };

    return (
        <div className="defeito-container">
            <h2 className="defeito-header">Gestão de Notas de Defeito</h2>

            {message.text && (
                <div className={`defeito-message ${message.type}`}>
                    {message.text}
                </div>
            )}

            <div className="defeito-form-group">
                <label htmlFor="operacao">Operação:</label>
                <select
                    id="operacao"
                    value={operacao}
                    onChange={(e) => setOperacao(e.target.value)}
                    className="defeito-form-group input"
                >
                    <option value="Implantar">Implantar</option>
                    <option value="Alterar">Alterar</option>
                    <option value="Excluir">Excluir</option>
                    <option value="Consultar">Consultar</option>
                </select>
            </div>

            <div className="defeito-form-group">
                <label htmlFor="numeroDocumento">Número da Nota:</label>
                <input
                    type="text"
                    id="numeroDocumento"
                    value={numeroDocumento}
                    onChange={handleNumeroDocumentoChange}
                    maxLength="6"
                    disabled={operacao === 'Implantar'}
                />
            </div>

            <div className="defeito-form-group">
                <label htmlFor="dataMovimentacao">Data da Movimentação:</label>
                <input
                    type="date"
                    id="dataMovimentacao"
                    value={dataMovimentacao}
                    onChange={(e) => setDataMovimentacao(e.target.value)}
                    disabled={operacao === 'Consultar' || operacao === 'Excluir'}
                />
            </div>

            <div className="defeito-form-group">
                <label htmlFor="produtoId">Código do Produto:</label>
                <input
                    type="text"
                    id="produtoId"
                    value={produtoId}
                    onChange={handleProdutoIdChange}
                    disabled={operacao === 'Consultar' || operacao === 'Excluir'}
                />
            </div>

            <div className="defeito-form-group">
                <label htmlFor="descricaoProduto">Descrição do Produto:</label>
                <input
                    type="text"
                    id="descricaoProduto"
                    value={descricaoProduto}
                    readOnly
                    disabled
                />
            </div>

            <div className="defeito-form-group">
                <label htmlFor="quantidade">Quantidade:</label>
                <input
                    type="number"
                    id="quantidade"
                    value={quantidade}
                    onChange={(e) => setQuantidade(e.target.value)}
                    disabled={operacao === 'Consultar' || operacao === 'Excluir'}
                />
            </div>

            <div className="defeito-form-group">
                <label htmlFor="precoCusto">Preço de Custo:</label>
                <input
                    type="number"
                    id="precoCusto"
                    value={precoCusto}
                    onChange={(e) => setPrecoCusto(e.target.value)}
                    disabled={operacao === 'Consultar' || operacao === 'Excluir'}
                />
            </div>

            <div className="defeito-button-group">
                {operacao !== 'Consultar' && operacao !== 'Excluir' && (
                    <button className="defeito-button primary" onClick={handleAddItem}>
                        Adicionar Item
                    </button>
                )}
                <button className="defeito-button primary" onClick={handleFinalizarNota}>
                    {operacao === 'Excluir' ? 'Excluir Nota' : 'Finalizar Nota'}
                </button>
                <button className="defeito-button secondary" onClick={handleClearForm}>
                    Limpar
                </button>
            </div>

            {movimentacoes.length > 0 && (
                <div className="defeito-table-container">
                    <h3>Itens da Nota {numeroDocumento}</h3>
                    <table className="defeito-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Cód. Produto</th>
                                <th>Descrição</th>
                                <th>Quantidade</th>
                                <th className="text-right">Preço Custo</th>
                                <th className="text-right">Total Item</th>
                                {operacao !== 'Consultar' && (<th>Ações</th>)}
                            </tr>
                        </thead>
                        <tbody>
                            {movimentacoes.map((item) => (
                                <tr key={item.id}>
                                    <td>{item.id}</td>
                                    <td>{item.produto_id}</td>
                                    <td>{item.descricao_produto}</td>
                                    <td>
                                        {operacao === 'Alterar' ? (
                                            <input
                                                type="number"
                                                value={item.quantidade}
                                                onChange={(e) => {
                                                    const updatedMov = movimentacoes.map(mov =>
                                                        mov.id === item.id ? { ...mov, quantidade: parseFloat(e.target.value) } : mov
                                                    );
                                                    setMovimentacoes(updatedMov);
                                                }}
                                            />
                                        ) : (
                                            item.quantidade
                                        )}
                                    </td>
                                    <td className="text-right">
                                        {operacao === 'Alterar' ? (
                                            <input
                                                type="number"
                                                value={item.preco_custo}
                                                onChange={(e) => {
                                                    const updatedMov = movimentacoes.map(mov =>
                                                        mov.id === item.id ? { ...mov, preco_custo: parseFloat(e.target.value) } : mov
                                                    );
                                                    setMovimentacoes(updatedMov);
                                                }}
                                            />
                                        ) : (
                                            parseFloat(item.preco_custo).toFixed(2)
                                        )}
                                    </td>
                                    <td className="text-right">{(item.quantidade * item.preco_custo).toFixed(2)}</td>
                                    {operacao !== 'Consultar' && (
                                        <td>
                                            {operacao === 'Alterar' && (
                                                <button onClick={() => handleUpdateItem(item)}>Salvar</button>
                                            )}
                                            {operacao === 'Implantar' && (
                                                <button onClick={() => handleDeleteItem(item.id)}>Remover</button>
                                            )}
                                        </td>
                                    )}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                    <div className="defeito-total-summary">
                        <div>
                            <span>Total de Itens:</span>
                            <span>{movimentacoes.length}</span>
                        </div>
                        <div>
                            <span>Quantidade Total:</span>
                            <span>{movimentacoes.reduce((sum, item) => sum + item.quantidade, 0)}</span>
                        </div>
                        <div>
                            <span>Valor Total da Nota:</span>
                            <span>R$ {totalValorNota.toFixed(2)}</span>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};

export default DefeitoPage;