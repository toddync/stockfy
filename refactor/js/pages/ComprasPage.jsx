import React, { useState, useEffect } from 'react';
import Alerta from '../components/Alerta'; // Assumindo que você tem um componente de Alerta

const ComprasPage = () => {
    const [compras, setCompras] = useState([]);
    const [produtos, setProdutos] = useState([]);
    const [fornecedores, setFornecedores] = useState([]);
    const [novaCompra, setNovaCompra] = useState({
        fornecedor_id: '',
        data_pedido: '',
        data_entrega: '',
        valor_total: 0,
        desconto: 0,
        frete: 0,
        observacoes: '',
        status: 'Pendente'
    });
    const [itensCompra, setItensCompra] = useState([]);
    const [novoItem, setNovoItem] = useState({
        produto_id: '',
        quantidade: 1,
        valor_unitario: 0
    });
    const [alerta, setAlerta] = useState(null);

    const fetchCompras = async () => {
        try {
            const response = await fetch('/refactor/php/api/compras.php');
            const data = await response.json();
            if (data.records) {
                setCompras(data.records);
            }
        } catch (error) {
            console.error("Erro ao buscar compras:", error);
            setAlerta({ type: 'error', message: 'Erro ao carregar compras.' });
        }
    };

    const fetchProdutos = async () => {
        try {
            const response = await fetch('/refactor/php/api/produtos.php');
            const data = await response.json();
            if (data.records) {
                setProdutos(data.records);
            }
        } catch (error) {
            console.error("Erro ao buscar produtos:", error);
            setAlerta({ type: 'error', message: 'Erro ao carregar produtos.' });
        }
    };

    const fetchFornecedores = async () => {
        try {
            const response = await fetch('/refactor/php/api/fornecedores.php');
            const data = await response.json();
            if (data.records) {
                setFornecedores(data.records);
            }
        } catch (error) {
            console.error("Erro ao buscar fornecedores:", error);
            setAlerta({ type: 'error', message: 'Erro ao carregar fornecedores.' });
        }
    };

    useEffect(() => {
        fetchCompras();
        fetchProdutos();
        fetchFornecedores();
    }, []);

    const handleNovaCompraChange = (e) => {
        const { name, value } = e.target;
        setNovaCompra(prev => ({ ...prev, [name]: value }));
    };

    const handleNovoItemChange = (e) => {
        const { name, value } = e.target;
        setNovoItem(prev => ({ ...prev, [name]: value }));
    };

    const adicionarItemCompra = () => {
        if (novoItem.produto_id && novoItem.quantidade > 0 && novoItem.valor_unitario >= 0) {
            const produtoSelecionado = produtos.find(p => p.id === novoItem.produto_id);
            if (produtoSelecionado) {
                setItensCompra(prev => [...prev, { ...novoItem, produto_nome: produtoSelecionado.nome }]);
                setNovoItem({ produto_id: '', quantidade: 1, valor_unitario: 0 });
            }
        } else {
            setAlerta({ type: 'warning', message: 'Preencha todos os campos do item da compra.' });
        }
    };

    const removerItemCompra = (index) => {
        setItensCompra(prev => prev.filter((_, i) => i !== index));
    };

    const handleSubmitCompra = async (e) => {
        e.preventDefault();
        if (!novaCompra.fornecedor_id || !novaCompra.data_pedido || itensCompra.length === 0) {
            setAlerta({ type: 'error', message: 'Preencha os dados da compra e adicione pelo menos um item.' });
            return;
        }

        try {
            const compraResponse = await fetch('/refactor/php/api/compras.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(novaCompra)
            });
            const compraData = await compraResponse.json();

            if (compraResponse.ok) {
                const novaCompraId = compraData.id; // Assumindo que a API retorna o ID da nova compra

                for (const item of itensCompra) {
                    await fetch('/refactor/php/api/compra_itens.php', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ ...item, compra_id: novaCompraId })
                    });
                }
                setAlerta({ type: 'success', message: 'Compra e itens criados com sucesso!' });
                setNovaCompra({
                    fornecedor_id: '', data_pedido: '', data_entrega: '', valor_total: 0,
                    desconto: 0, frete: 0, observacoes: '', status: 'Pendente'
                });
                setItensCompra([]);
                fetchCompras(); // Recarrega a lista de compras
            } else {
                throw new Error(compraData.message || 'Erro ao criar compra.');
            }
        } catch (error) {
            console.error("Erro ao salvar compra:", error);
            setAlerta({ type: 'error', message: error.message || 'Erro ao salvar compra.' });
        }
    };

    return (
        <div className="compras-container">
            <h1>Gestão de Compras</h1>
            {alerta && <Alerta type={alerta.type} message={alerta.message} />}

            <div className="form-section">
                <h2>Nova Compra</h2>
                <form onSubmit={handleSubmitCompra}>
                    <div className="form-group">
                        <label>Fornecedor:</label>
                        <select name="fornecedor_id" value={novaCompra.fornecedor_id} onChange={handleNovaCompraChange} required>
                            <option value="">Selecione um fornecedor</option>
                            {fornecedores.map(forn => (
                                <option key={forn.id} value={forn.id}>{forn.nome}</option>
                            ))}
                        </select>
                    </div>
                    <div className="form-group">
                        <label>Data do Pedido:</label>
                        <input type="date" name="data_pedido" value={novaCompra.data_pedido} onChange={handleNovaCompraChange} required />
                    </div>
                    <div className="form-group">
                        <label>Data de Entrega:</label>
                        <input type="date" name="data_entrega" value={novaCompra.data_entrega} onChange={handleNovaCompraChange} />
                    </div>
                    <div className="form-group">
                        <label>Observações:</label>
                        <textarea name="observacoes" value={novaCompra.observacoes} onChange={handleNovaCompraChange}></textarea>
                    </div>

                    <h3>Itens da Compra</h3>
                    <div className="item-form">
                        <div className="form-group">
                            <label>Produto:</label>
                            <select name="produto_id" value={novoItem.produto_id} onChange={handleNovoItemChange}>
                                <option value="">Selecione um produto</option>
                                {produtos.map(prod => (
                                    <option key={prod.id} value={prod.id}>{prod.nome}</option>
                                ))}
                            </select>
                        </div>
                        <div className="form-group">
                            <label>Quantidade:</label>
                            <input type="number" name="quantidade" value={novoItem.quantidade} onChange={handleNovoItemChange} min="1" />
                        </div>
                        <div className="form-group">
                            <label>Valor Unitário:</label>
                            <input type="number" name="valor_unitario" value={novoItem.valor_unitario} onChange={handleNovoItemChange} step="0.01" min="0" />
                        </div>
                        <button type="button" onClick={adicionarItemCompra}>Adicionar Item</button>
                    </div>

                    {itensCompra.length > 0 && (
                        <div className="itens-list">
                            <h4>Itens Adicionados:</h4>
                            <ul>
                                {itensCompra.map((item, index) => (
                                    <li key={index}>
                                        {item.produto_nome} - Qtd: {item.quantidade} - Valor: R$ {item.valor_unitario}
                                        <button type="button" onClick={() => removerItemCompra(index)}>Remover</button>
                                    </li>
                                ))}
                            </ul>
                        </div>
                    )}

                    <button type="submit">Salvar Compra</button>
                </form>
            </div>

            <div className="compras-list-section">
                <h2>Compras Existentes</h2>
                {compras.length === 0 ? (
                    <p>Nenhuma compra encontrada.</p>
                ) : (
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Fornecedor</th>
                                <th>Data Pedido</th>
                                <th>Status</th>
                                <th>Valor Total</th>
                                {/* Adicionar mais colunas conforme necessário */}
                            </tr>
                        </thead>
                        <tbody>
                            {compras.map(compra => (
                                <tr key={compra.id}>
                                    <td>{compra.id}</td>
                                    <td>{fornecedores.find(f => f.id === compra.fornecedor_id)?.nome || 'N/A'}</td>
                                    <td>{compra.data_pedido}</td>
                                    <td>{compra.status}</td>
                                    <td>R$ {parseFloat(compra.valor_total).toFixed(2)}</td>
                                    {/* Renderizar mais dados da compra */}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                )}
            </div>
        </div>
    );
};

export default ComprasPage;