import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AjusteCompraPage = () => {
    const [compras, setCompras] = useState([]);
    const [fornecedores, setFornecedores] = useState([]);
    const [produtos, setProdutos] = useState([]);
    const [gruposProduto, setGruposProduto] = useState([]);
    const [selectedCompra, setSelectedCompra] = useState(null);
    const [compraItems, setCompraItems] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const API_BASE_URL = 'http://localhost/refactor/php/api'; // Ajuste conforme necessário

    useEffect(() => {
        const fetchData = async () => {
            try {
                const [
                    comprasRes,
                    fornecedoresRes,
                    produtosRes,
                    gruposProdutoRes
                ] = await Promise.all([
                    axios.get(`${API_BASE_URL}/compras.php`),
                    axios.get(`${API_BASE_URL}/fornecedores.php`),
                    axios.get(`${API_BASE_URL}/produtos.php`),
                    axios.get(`${API_BASE_URL}/produto_grupos.php`)
                ]);

                setCompras(comprasRes.data.records || []);
                setFornecedores(fornecedoresRes.data.records || []);
                setProdutos(produtosRes.data.records || []);
                setGruposProduto(gruposProdutoRes.data.records || []);
            } catch (err) {
                setError("Erro ao carregar dados iniciais: " + err.message);
                console.error("Erro ao carregar dados iniciais:", err);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    const handleSelectCompra = async (compraId) => {
        setLoading(true);
        setError(null);
        try {
            const compraRes = await axios.get(`${API_BASE_URL}/compras.php?id=${compraId}`);
            setSelectedCompra(compraRes.data);

            const itemsRes = await axios.get(`${API_BASE_URL}/compra_itens.php?compra_id=${compraId}`);
            setCompraItems(itemsRes.data.records || []);
        } catch (err) {
            setError("Erro ao carregar detalhes da compra: " + err.message);
            console.error("Erro ao carregar detalhes da compra:", err);
        } finally {
            setLoading(false);
        }
    };

    const handleAddItem = () => {
        // Lógica para adicionar um novo item à compra
        // Isso envolveria um formulário para selecionar produto, quantidade, etc.
        console.log("Adicionar item");
    };

    const handleUpdateItem = (itemId, field, value) => {
        // Lógica para atualizar um item existente
        console.log(`Atualizar item ${itemId}, campo ${field} com valor ${value}`);
    };

    const handleDeleteItem = async (itemId) => {
        // Lógica para deletar um item
        setLoading(true);
        setError(null);
        try {
            await axios.delete(`${API_BASE_URL}/compra_itens.php`, { data: { id: itemId } });
            setCompraItems(prevItems => prevItems.filter(item => item.id !== itemId));
            console.log(`Item ${itemId} deletado com sucesso.`);
        } catch (err) {
            setError("Erro ao deletar item: " + err.message);
            console.error("Erro ao deletar item:", err);
        } finally {
            setLoading(false);
        }
    };

    const handleSaveCompra = async () => {
        // Lógica para salvar a compra (cabeçalho e itens)
        // Isso pode envolver PUT para a compra e POST/PUT/DELETE para os itens
        console.log("Salvar compra");
    };

    if (loading) return <div>Carregando...</div>;
    if (error) return <div style={{ color: 'red' }}>Erro: {error}</div>;

    return (
        <div className="ajuste-compra-container">
            <h1>Ajuste de Compras</h1>

            <div className="compra-selection">
                <label htmlFor="compra-select">Selecionar Compra:</label>
                <select id="compra-select" onChange={(e) => handleSelectCompra(e.target.value)} value={selectedCompra?.id || ''}>
                    <option value="">-- Selecione uma Compra --</option>
                    {compras.map(compra => (
                        <option key={compra.id} value={compra.id}>
                            {compra.numero_pedido} - {new Date(compra.data_pedido).toLocaleDateString()}
                        </option>
                    ))}
                </select>
            </div>

            {selectedCompra && (
                <div className="compra-details">
                    <h2>Detalhes da Compra #{selectedCompra.numero_pedido}</h2>
                    <p><strong>Fornecedor:</strong> {fornecedores.find(f => f.id === selectedCompra.fornecedor_id)?.razao_social}</p>
                    <p><strong>Data do Pedido:</strong> {new Date(selectedCompra.data_pedido).toLocaleDateString()}</p>
                    <p><strong>Valor Total:</strong> R$ {parseFloat(selectedCompra.valor_total).toFixed(2)}</p>
                    {/* Outros detalhes da compra */}

                    <h3>Itens da Compra</h3>
                    <button onClick={handleAddItem}>Adicionar Item</button>
                    <table>
                        <thead>
                            <tr>
                                <th>Produto</th>
                                <th>Grupo</th>
                                <th>Quantidade</th>
                                <th>Valor Unitário</th>
                                <th>Valor Total Item</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            {compraItems.map(item => {
                                const produto = produtos.find(p => p.id === item.produto_id);
                                const grupo = gruposProduto.find(g => g.id === produto?.produto_grupo_id);
                                return (
                                    <tr key={item.id}>
                                        <td>{produto?.descricao || 'N/A'}</td>
                                        <td>{grupo?.descricao || 'N/A'}</td>
                                        <td>
                                            <input
                                                type="number"
                                                value={item.quantidade}
                                                onChange={(e) => handleUpdateItem(item.id, 'quantidade', e.target.value)}
                                            />
                                        </td>
                                        <td>
                                            <input
                                                type="number"
                                                value={item.valor_unitario}
                                                onChange={(e) => handleUpdateItem(item.id, 'valor_unitario', e.target.value)}
                                            />
                                        </td>
                                        <td>R$ {(item.quantidade * item.valor_unitario).toFixed(2)}</td>
                                        <td>
                                            <button onClick={() => handleDeleteItem(item.id)}>Excluir</button>
                                        </td>
                                    </tr>
                                );
                            })}
                        </tbody>
                    </table>
                    <button onClick={handleSaveCompra}>Salvar Alterações da Compra</button>
                </div>
            )}
        </div>
    );
};

export default AjusteCompraPage;