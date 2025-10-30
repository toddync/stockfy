import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../../css/devolucao.css'; // Assumindo que você criará este arquivo CSS

const API_URL = 'http://localhost/rosa/refactor/php/api/devolucoes.php'; // Ajuste conforme sua configuração

const DevolucaoPage = () => {
    const [devolucao, setDevolucao] = useState({
        id: '',
        dataNota: '',
        valorNota: 0,
        romaneioNota: '',
        vendedorId: '',
        dataBase: '',
        clienteId: '',
        itens: []
    });
    const [itemAtual, setItemAtual] = useState({
        artigoId: '',
        descricao: '',
        quantidade: 0,
        precoCusto: 0
    });
    const [vendedorNome, setVendedorNome] = useState('');
    const [clienteNome, setClienteNome] = useState('');
    const [operacao, setOperacao] = useState('Implantar'); // Implantar, Alterar, Consultar, Excluir
    const [mensagem, setMensagem] = useState('');

    useEffect(() => {
        if (operacao === 'Implantar') {
            gerarNovoCodigoDevolucao();
            setDevolucao(prev => ({ ...prev, dataNota: new Date().toISOString().slice(0, 10) }));
        }
    }, [operacao]);

    const gerarNovoCodigoDevolucao = async () => {
        try {
            const response = await axios.get(`${API_URL}?action=generateNextId`); // Supondo um endpoint para gerar ID
            setDevolucao(prev => ({ ...prev, id: response.data.nextId }));
        } catch (error) {
            console.error("Erro ao gerar código de devolução:", error);
            setMensagem("Erro ao gerar código de devolução.");
        }
    };

    const handleDevolucaoChange = (e) => {
        const { name, value } = e.target;
        setDevolucao(prev => ({ ...prev, [name]: value }));
    };

    const handleItemChange = (e) => {
        const { name, value } = e.target;
        setItemAtual(prev => ({ ...prev, [name]: value }));
    };

    const buscarPedido = async () => {
        if (!devolucao.romaneioNota) {
            setMensagem("Número do Pedido é obrigatório!");
            return;
        }
        try {
            // Supondo que você tenha uma API para buscar pedidos
            const response = await axios.get(`http://localhost/rosa/refactor/php/api/pedidos.php?id=${devolucao.romaneioNota}`);
            const pedido = response.data;
            setDevolucao(prev => ({
                ...prev,
                dataBase: pedido.dataBase,
                vendedorId: pedido.vendedorId,
                clienteId: pedido.clienteId
            }));
            // Buscar nome do vendedor e cliente
            const vendedorRes = await axios.get(`http://localhost/rosa/refactor/php/api/vendedores.php?id=${pedido.vendedorId}`);
            setVendedorNome(vendedorRes.data.nome);
            const clienteRes = await axios.get(`http://localhost/rosa/refactor/php/api/clientes.php?id=${pedido.clienteId}`);
            setClienteNome(clienteRes.data.nome);
        } catch (error) {
            console.error("Erro ao buscar pedido:", error);
            setMensagem("Pedido não encontrado.");
            setDevolucao(prev => ({ ...prev, romaneioNota: '' }));
        }
    };

    const buscarDevolucao = async () => {
        if (!devolucao.id) {
            setMensagem("Número da nota é obrigatório!");
            return;
        }
        try {
            const response = await axios.get(`${API_URL}?id=${devolucao.id}`);
            const data = response.data;
            setDevolucao({
                id: data.id,
                dataNota: data.dataNota,
                valorNota: data.valorNota,
                romaneioNota: data.romaneioNota,
                vendedorId: data.vendedorId,
                dataBase: data.dataBase,
                clienteId: data.clienteId,
                itens: data.itens || []
            });
            // Buscar nome do vendedor e cliente
            const vendedorRes = await axios.get(`http://localhost/rosa/refactor/php/api/vendedores.php?id=${data.vendedorId}`);
            setVendedorNome(vendedorRes.data.nome);
            const clienteRes = await axios.get(`http://localhost/rosa/refactor/php/api/clientes.php?id=${data.clienteId}`);
            setClienteNome(clienteRes.data.nome);
        } catch (error) {
            console.error("Erro ao buscar devolução:", error);
            setMensagem("Devolução não encontrada.");
            setDevolucao(prev => ({ ...prev, id: '' }));
        }
    };

    const buscarArtigo = async () => {
        if (!itemAtual.artigoId) {
            setMensagem("Identifique o artigo!");
            return;
        }
        try {
            // Supondo que você tenha uma API para buscar artigos
            const response = await axios.get(`http://localhost/rosa/refactor/php/api/artigos.php?codigo=${itemAtual.artigoId}`);
            const artigo = response.data;
            setItemAtual(prev => ({
                ...prev,
                descricao: artigo.descricao,
                precoCusto: artigo.precoCusto
            }));
        } catch (error) {
            console.error("Erro ao buscar artigo:", error);
            setMensagem("Artigo não encontrado no pedido ou no cadastro.");
            setItemAtual(prev => ({ ...prev, artigoId: '', descricao: '', precoCusto: 0 }));
        }
    };

    const adicionarOuAtualizarItem = () => {
        if (!itemAtual.artigoId || !itemAtual.quantidade || !itemAtual.precoCusto) {
            setMensagem("Preencha todos os campos do item!");
            return;
        }

        const itemExistenteIndex = devolucao.itens.findIndex(item => item.artigoId === itemAtual.artigoId);

        let novosItens;
        if (itemExistenteIndex > -1) {
            novosItens = devolucao.itens.map((item, index) =>
                index === itemExistenteIndex ? { ...itemAtual } : item
            );
        } else {
            novosItens = [...devolucao.itens, itemAtual];
        }

        setDevolucao(prev => ({
            ...prev,
            itens: novosItens,
            valorNota: novosItens.reduce((acc, item) => acc + (item.quantidade * item.precoCusto), 0)
        }));
        setItemAtual({ artigoId: '', descricao: '', quantidade: 0, precoCusto: 0 });
        setMensagem("Item adicionado/atualizado.");
    };

    const removerItem = (artigoId) => {
        const novosItens = devolucao.itens.filter(item => item.artigoId !== artigoId);
        setDevolucao(prev => ({
            ...prev,
            itens: novosItens,
            valorNota: novosItens.reduce((acc, item) => acc + (item.quantidade * item.precoCusto), 0)
        }));
        setMensagem("Item removido.");
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (devolucao.itens.length === 0) {
            setMensagem("Adicione itens à devolução antes de salvar!");
            return;
        }

        try {
            let response;
            if (operacao === 'Implantar') {
                response = await axios.post(API_URL, devolucao);
            } else if (operacao === 'Alterar') {
                response = await axios.put(API_URL, devolucao);
            } else if (operacao === 'Excluir') {
                response = await axios.delete(`${API_URL}?id=${devolucao.id}`);
            }
            setMensagem(response.data.message);
            limparFormulario();
        } catch (error) {
            console.error("Erro ao processar devolução:", error);
            setMensagem(error.response?.data?.message || "Erro ao processar devolução.");
        }
    };

    const limparFormulario = () => {
        setDevolucao({
            id: '',
            dataNota: '',
            valorNota: 0,
            romaneioNota: '',
            vendedorId: '',
            dataBase: '',
            clienteId: '',
            itens: []
        });
        setItemAtual({ artigoId: '', descricao: '', quantidade: 0, precoCusto: 0 });
        setVendedorNome('');
        setClienteNome('');
        setOperacao('Implantar');
        setMensagem('');
        if (operacao === 'Implantar') {
            gerarNovoCodigoDevolucao();
            setDevolucao(prev => ({ ...prev, dataNota: new Date().toISOString().slice(0, 10) }));
        }
    };

    return (
        <div className="devolucao-container">
            <h2>Registro de Devolução</h2>
            {mensagem && <div className="mensagem-alerta">{mensagem}</div>}

            <div className="form-group">
                <label>Operação:</label>
                <select name="operacao" value={operacao} onChange={(e) => setOperacao(e.target.value)}>
                    <option value="Implantar">Implantar</option>
                    <option value="Alterar">Alterar</option>
                    <option value="Consultar">Consultar</option>
                    <option value="Excluir">Excluir</option>
                </select>
            </div>

            <fieldset>
                <legend>Dados da Devolução</legend>
                <div className="form-row">
                    <div className="form-group">
                        <label>Nº da Nota:</label>
                        <input
                            type="text"
                            name="id"
                            value={devolucao.id}
                            onChange={handleDevolucaoChange}
                            onBlur={operacao !== 'Implantar' ? buscarDevolucao : null}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir' || operacao === 'Implantar'}
                        />
                    </div>
                    <div className="form-group">
                        <label>Data da Nota:</label>
                        <input
                            type="date"
                            name="dataNota"
                            value={devolucao.dataNota}
                            onChange={handleDevolucaoChange}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir'}
                        />
                    </div>
                    <div className="form-group">
                        <label>Valor Total:</label>
                        <input
                            type="text"
                            name="valorNota"
                            value={devolucao.valorNota.toFixed(2)}
                            readOnly
                        />
                    </div>
                </div>
                <div className="form-row">
                    <div className="form-group">
                        <label>Nº do Pedido (Romaneio):</label>
                        <input
                            type="text"
                            name="romaneioNota"
                            value={devolucao.romaneioNota}
                            onChange={handleDevolucaoChange}
                            onBlur={buscarPedido}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir'}
                        />
                    </div>
                    <div className="form-group">
                        <label>Data Base:</label>
                        <input
                            type="date"
                            name="dataBase"
                            value={devolucao.dataBase}
                            readOnly
                        />
                    </div>
                </div>
                <div className="form-row">
                    <div className="form-group">
                        <label>Vendedor:</label>
                        <input
                            type="text"
                            name="vendedorNome"
                            value={vendedorNome}
                            readOnly
                        />
                    </div>
                    <div className="form-group">
                        <label>Cliente:</label>
                        <input
                            type="text"
                            name="clienteNome"
                            value={clienteNome}
                            readOnly
                        />
                    </div>
                </div>
            </fieldset>

            <fieldset>
                <legend>Itens da Devolução</legend>
                <div className="form-row">
                    <div className="form-group">
                        <label>Cód. Artigo:</label>
                        <input
                            type="text"
                            name="artigoId"
                            value={itemAtual.artigoId}
                            onChange={handleItemChange}
                            onBlur={buscarArtigo}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir'}
                        />
                    </div>
                    <div className="form-group">
                        <label>Descrição:</label>
                        <input
                            type="text"
                            name="descricao"
                            value={itemAtual.descricao}
                            readOnly
                        />
                    </div>
                </div>
                <div className="form-row">
                    <div className="form-group">
                        <label>Quantidade:</label>
                        <input
                            type="number"
                            name="quantidade"
                            value={itemAtual.quantidade}
                            onChange={handleItemChange}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir'}
                        />
                    </div>
                    <div className="form-group">
                        <label>Preço Custo:</label>
                        <input
                            type="number"
                            name="precoCusto"
                            value={itemAtual.precoCusto}
                            onChange={handleItemChange}
                            readOnly={operacao === 'Consultar' || operacao === 'Excluir'}
                        />
                    </div>
                    <div className="form-group">
                        <button
                            type="button"
                            onClick={adicionarOuAtualizarItem}
                            disabled={operacao === 'Consultar' || operacao === 'Excluir'}
                        >
                            {devolucao.itens.some(item => item.artigoId === itemAtual.artigoId) ? 'Atualizar Item' : 'Adicionar Item'}
                        </button>
                    </div>
                </div>

                <h3>Itens Adicionados</h3>
                {devolucao.itens.length === 0 ? (
                    <p>Nenhum item adicionado.</p>
                ) : (
                    <table className="itens-table">
                        <thead>
                            <tr>
                                <th>Cód. Artigo</th>
                                <th>Descrição</th>
                                <th>Quantidade</th>
                                <th>Preço Custo</th>
                                <th>Total</th>
                                {operacao !== 'Consultar' && operacao !== 'Excluir' && <th>Ações</th>}
                            </tr>
                        </thead>
                        <tbody>
                            {devolucao.itens.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.artigoId}</td>
                                    <td>{item.descricao}</td>
                                    <td>{item.quantidade}</td>
                                    <td>{item.precoCusto.toFixed(2)}</td>
                                    <td>{(item.quantidade * item.precoCusto).toFixed(2)}</td>
                                    {operacao !== 'Consultar' && operacao !== 'Excluir' && (
                                        <td>
                                            <button type="button" onClick={() => removerItem(item.artigoId)}>Remover</button>
                                        </td>
                                    )}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                )}
            </fieldset>

            <div className="form-actions">
                <button type="submit" onClick={handleSubmit} disabled={operacao === 'Consultar'}>
                    {operacao === 'Implantar' ? 'Salvar Devolução' : operacao === 'Alterar' ? 'Atualizar Devolução' : 'Excluir Devolução'}
                </button>
                <button type="button" onClick={limparFormulario}>Limpar</button>
            </div>
        </div>
    );
};

export default DevolucaoPage;