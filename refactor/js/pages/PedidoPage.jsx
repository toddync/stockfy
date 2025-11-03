import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';
import '../../css/pedido.css';

const PedidoPage = () => {
    const [pedidoId, setPedidoId] = useState('');
    const [codVendedor, setCodVendedor] = useState('');
    const [nomeVendedor, setNomeVendedor] = useState('');
    const [codCliente, setCodCliente] = useState('');
    const [nomeCliente, setNomeCliente] = useState('');
    const [statusPedido, setStatusPedido] = useState('');
    const [dataBase, setDataBase] = useState('');
    const [dataRecolhimento, setDataRecolhimento] = useState('');
    const [dataCobranca, setDataCobranca] = useState('');
    const [retorno, setRetorno] = useState('');
    const [situacaoCliente, setSituacaoCliente] = useState('');
    const [codArtigo, setCodArtigo] = useState('');
    const [descricaoArtigo, setDescricaoArtigo] = useState('');
    const [qtdArtigo, setQtdArtigo] = useState(1);
    const [precoCusto, setPrecoCusto] = useState(0);
    const [precoVenda, setPrecoVenda] = useState(0);
    const [ultimoArtigoAdd, setUltimoArtigoAdd] = useState('');
    const [ultimaQtdAdd, setUltimaQtdAdd] = useState(0);
    const [totalItens, setTotalItens] = useState(0);
    const [totalQuantidade, setTotalQuantidade] = useState(0);
    const [totalPedido, setTotalPedido] = useState(0);
    const [operacao, setOperacao] = useState('Implantar'); // Implantar, Alterar, Excluir, Consultar

    const [itensPedido, setItensPedido] = useState([]);
    const [clientes, setClientes] = useState([]);
    const [produtos, setProdutos] = useState([]);
    const [showClienteGrid, setShowClienteGrid] = useState(false);
    const [showProdutoGrid, setShowProdutoGrid] = useState(false);

    const API_BASE_URL = 'http://localhost/refactor/php/api';

    // Funções de formatação
    const formatDate = (dateString) => {
        if (!dateString) return '';
        const date = new Date(dateString);
        return date.toLocaleDateString('pt-BR');
    };

    const formatCurrency = (value) => {
        return new Intl.NumberFormat('pt-BR', {
            style: 'currency',
            currency: 'BRL',
        }).format(value);
    };

    const clearForm = useCallback(() => {
        setPedidoId('');
        setCodVendedor('');
        setNomeVendedor('');
        setCodCliente('');
        setNomeCliente('');
        setStatusPedido('');
        setDataBase(formatDate(new Date()));
        setDataRecolhimento('');
        setDataCobranca('');
        setRetorno('');
        setSituacaoCliente('');
        setCodArtigo('');
        setDescricaoArtigo('');
        setQtdArtigo(1);
        setPrecoCusto(0);
        setPrecoVenda(0);
        setUltimoArtigoAdd('');
        setUltimaQtdAdd(0);
        setTotalItens(0);
        setTotalQuantidade(0);
        setTotalPedido(0);
        setItensPedido([]);
        setOperacao('Implantar');
        setShowClienteGrid(false);
        setShowProdutoGrid(false);
    }, []);

    useEffect(() => {
        const today = new Date();
        setDataBase(formatDate(today));
        const recolhimentoDate = new Date(today);
        recolhimentoDate.setDate(today.getDate() + 19);
        setDataRecolhimento(formatDate(recolhimentoDate));
    }, []);

    const fetchPedido = useCallback(async (id) => {
        try {
            const response = await axios.get(`${API_BASE_URL}/pedidos_api.php?id=${id}`);
            const data = response.data;
            setPedidoId(data.id);
            setCodVendedor(data.vendedor_id || '');
            setCodCliente(data.cliente_id || '');
            setNomeCliente(data.cliente_nome || '');
            setDataBase(formatDate(data.data_emissao));
            setDataRecolhimento(formatDate(data.data_entrega)); // Mapeado para data_entrega
            // dataCobranca não tem mapeamento direto no novo esquema
            setRetorno(data.observacoes || ''); // Mapeado para observacoes
            setStatusPedido(data.status);
            setTotalPedido(data.valor_total);

            // Fetch vendedor name
            if (data.vendedor_id) {
                const vendResponse = await axios.get(`${API_BASE_URL}/vendedores_api.php?id=${data.vendedor_id}`);
                setNomeVendedor(vendResponse.data.nome);
            }

            // Fetch cliente situation
            if (data.cliente_id) {
                const cliResponse = await axios.get(`${API_BASE_URL}/clientes_api.php?id=${data.cliente_id}`);
                setSituacaoCliente(cliResponse.data.ativo ? 'Ativo' : 'Inativo');
            }

            if (data.itens) {
                setItensPedido(data.itens);
                const totalQtd = data.itens.reduce((sum, item) => sum + parseFloat(item.quantidade), 0);
                setTotalQuantidade(totalQtd);
                setTotalItens(data.itens.length);
            }
            setOperacao('Alterar'); // Se encontrou, é alteração
        } catch (error) {
            console.error("Erro ao buscar pedido:", error);
            clearForm();
            alert("Pedido não encontrado ou erro ao buscar.");
            setOperacao('Implantar');
        }
    }, [clearForm]);

    const handlePedidoIdExit = async () => {
        if (pedidoId === '') {
            alert('Número do pedido é obrigatório!');
            clearForm();
            return;
        }
        // Preencher com zeros à esquerda (simulação, React não altera o input diretamente)
        const paddedPedidoId = pedidoId.padStart(6, '0');
        setPedidoId(paddedPedidoId);

        await fetchPedido(paddedPedidoId);
    };

    const handleCodVendedorExit = async () => {
        if (codVendedor === '') {
            alert('Identifique o vendedor!');
            return;
        }
        const paddedCodVendedor = codVendedor.padStart(3, '0');
        setCodVendedor(paddedCodVendedor);

        try {
            const response = await axios.get(`${API_BASE_URL}/vendedores_api.php?id=${paddedCodVendedor}`);
            setNomeVendedor(response.data.nome);
        } catch (error) {
            alert('Vendedor não cadastrado!');
            setCodVendedor('');
            setNomeVendedor('');
        }
    };

    const handleCodClienteExit = async () => {
        if (codCliente === '') {
            alert('Identifique o Cliente!');
            return;
        }
        const paddedCodCliente = codCliente.padStart(4, '0');
        setCodCliente(paddedCodCliente);

        try {
            const response = await axios.get(`${API_BASE_URL}/clientes_api.php?id=${paddedCodCliente}`);
            setNomeCliente(response.data.nome);
            setSituacaoCliente(response.data.ativo ? 'Ativo' : 'Inativo');
        } catch (error) {
            alert('Cliente não cadastrado!');
            setCodCliente('');
            setNomeCliente('');
            setSituacaoCliente('');
        }
    };

    const handleCodClienteKeyDown = async (e) => {
        if (e.key === 'F2') {
            e.preventDefault();
            try {
                const response = await axios.get(`${API_BASE_URL}/clientes_api.php`);
                setClientes(response.data.records);
                setShowClienteGrid(true);
            } catch (error) {
                console.error("Erro ao buscar clientes:", error);
                alert("Erro ao buscar clientes.");
            }
        }
    };

    const handleClienteGridDblClick = (cliente) => {
        setCodCliente(String(cliente.id).padStart(4, '0'));
        setNomeCliente(cliente.nome);
        setSituacaoCliente(cliente.ativo ? 'Ativo' : 'Inativo');
        setShowClienteGrid(false);
    };

    const handleCodArtigoExit = async () => {
        if (codArtigo === '') {
            return;
        }

        // Verificar se o artigo já está nos itens do pedido
        const existingItem = itensPedido.find(item => item.produto_id === parseInt(codArtigo));
        if (existingItem) {
            setDescricaoArtigo(existingItem.produto_descricao);
            setPrecoCusto(existingItem.preco_unitario); // No Delphi era precus
            setPrecoVenda(existingItem.preco_unitario); // No Delphi era preven
            setQtdArtigo(existingItem.quantidade);
            setUltimoArtigoAdd(String(existingItem.produto_id));
            setUltimaQtdAdd(existingItem.quantidade);
            setOperacao('AlterarItem'); // Indica que está alterando um item existente
        } else {
            try {
                const response = await axios.get(`${API_BASE_URL}/produtos_api.php?id=${codArtigo}`);
                const produtoData = response.data;
                setDescricaoArtigo(produtoData.descricao);
                setPrecoCusto(produtoData.preco_custo);
                setPrecoVenda(produtoData.preco_venda);
                setQtdArtigo(1); // Default para 1 ao adicionar novo
                setOperacao('IncluirItem'); // Indica que está incluindo um novo item
            } catch (error) {
                alert('Produto não cadastrado!');
                setCodArtigo('');
                setDescricaoArtigo('');
                setPrecoCusto(0);
                setPrecoVenda(0);
                setQtdArtigo(1);
            }
        }
    };

    const handleAddOrUpdateItem = () => {
        if (!codArtigo || !descricaoArtigo || qtdArtigo <= 0) {
            alert('Preencha todos os campos do artigo corretamente.');
            return;
        }

        const newItem = {
            produto_id: parseInt(codArtigo),
            produto_descricao: descricaoArtigo,
            quantidade: parseFloat(qtdArtigo),
            preco_unitario: parseFloat(precoVenda), // Usar preço de venda como unitário
            valor_total: parseFloat(qtdArtigo) * parseFloat(precoVenda),
        };

        let updatedItens;
        if (operacao === 'AlterarItem') {
            updatedItens = itensPedido.map(item =>
                item.produto_id === newItem.produto_id ? { ...item, ...newItem } : item
            );
        } else {
            updatedItens = [...itensPedido, newItem];
        }

        setItensPedido(updatedItens);
        calculateTotals(updatedItens);
        
        // Limpar campos do artigo
        setCodArtigo('');
        setDescricaoArtigo('');
        setQtdArtigo(1);
        setPrecoCusto(0);
        setPrecoVenda(0);
        setOperacao(pedidoId ? 'Alterar' : 'Implantar'); // Volta para operação de pedido
    };

    const handleDeleteItem = (produtoIdToDelete) => {
        const updatedItens = itensPedido.filter(item => item.produto_id !== produtoIdToDelete);
        setItensPedido(updatedItens);
        calculateTotals(updatedItens);
    };

    const calculateTotals = (items) => {
        const totalQtd = items.reduce((sum, item) => sum + parseFloat(item.quantidade), 0);
        const totalVal = items.reduce((sum, item) => sum + parseFloat(item.valor_total), 0);
        setTotalItens(items.length);
        setTotalQuantidade(totalQtd);
        setTotalPedido(totalVal);
    };

    const handleConfirm = async () => {
        if (itensPedido.length === 0) {
            alert('O pedido deve ter pelo menos um item!');
            return;
        }

        const pedidoData = {
            cliente_id: parseInt(codCliente),
            vendedor_id: codVendedor ? parseInt(codVendedor) : null,
            data_emissao: dataBase,
            data_entrega: dataRecolhimento,
            valor_total: totalPedido,
            status: statusPedido || 'emitido', // Default status
            observacoes: retorno,
            itens: itensPedido.map(item => ({
                produto_id: item.produto_id,
                quantidade: item.quantidade,
                preco_unitario: item.preco_unitario,
            })),
        };

        try {
            let response;
            if (operacao === 'Implantar') {
                response = await axios.post(`${API_BASE_URL}/pedidos_api.php`, pedidoData);
                alert(response.data.message);
                setPedidoId(response.data.id); // Atualiza com o ID do novo pedido
                setOperacao('Alterar'); // Muda para modo de alteração após implantar
            } else if (operacao === 'Alterar') {
                pedidoData.id = parseInt(pedidoId);
                response = await axios.put(`${API_BASE_URL}/pedidos_api.php`, pedidoData);
                alert(response.data.message);
            } else if (operacao === 'Excluir') {
                response = await axios.delete(`${API_BASE_URL}/pedidos_api.php`, { data: { id: parseInt(pedidoId) } });
                alert(response.data.message);
                clearForm();
            } else if (operacao === 'Consultar') {
                // No Delphi, consultar apenas exibia. Aqui já foi feito no handlePedidoIdExit
                alert('Modo de consulta. Nenhuma alteração será salva.');
            }
            // Após sucesso, pode-se recarregar o pedido ou limpar o formulário
            // fetchPedido(pedidoId); // Recarregar para garantir consistência
        } catch (error) {
            console.error("Erro ao processar pedido:", error);
            alert(`Erro ao processar pedido: ${error.response?.data?.message || error.message}`);
        }
    };

    const handleCancel = () => {
        clearForm();
    };

    // Teclas de atalho (simulação)
    useEffect(() => {
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
            } else if (e.key === 'F3') {
                e.preventDefault();
                // Lógica para F3 (chvff='1' no Delphi) - talvez para forçar quantidade
                // Por enquanto, não implementado diretamente, pois a quantidade é editável
            } else if (e.key === 'F5') {
                e.preventDefault();
                // Lógica para F5 (chvext='1' no Delphi) - talvez para excluir item
                // Implementado via botão de exclusão para clareza
            }
        };

        document.addEventListener('keydown', handleKeyDown);
        return () => {
            document.removeEventListener('keydown', handleKeyDown);
        };
    }, []);

    return (
        <div className="pedido-container">
            <h2>Cadastro de Pedidos</h2>
            <form>
                <div className="form-group">
                    <label>Pedido:</label>
                    <input type="text" value={pedidoId} onChange={(e) => setPedidoId(e.target.value)} onBlur={handlePedidoIdExit} maxLength="6" />
                    <label>Operação:</label>
                    <input type="text" value={operacao} readOnly />
                </div>

                <fieldset className="form-section">
                    <legend>Dados do Vendedor</legend>
                    <div className="form-group">
                        <label>Cód. Vendedor:</label>
                        <input type="text" value={codVendedor} onChange={(e) => setCodVendedor(e.target.value)} onBlur={handleCodVendedorExit} maxLength="3" />
                        <label>Nome Vendedor:</label>
                        <input type="text" value={nomeVendedor} readOnly />
                    </div>
                </fieldset>

                <fieldset className="form-section">
                    <legend>Dados do Cliente</legend>
                    <div className="form-group">
                        <label>Cód. Cliente:</label>
                        <input type="text" value={codCliente} onChange={(e) => setCodCliente(e.target.value)} onBlur={handleCodClienteExit} onKeyDown={handleCodClienteKeyDown} maxLength="4" />
                        <label>Nome Cliente:</label>
                        <input type="text" value={nomeCliente} readOnly />
                    </div>
                    <div className="form-group">
                        <label>Situação Cliente:</label>
                        <input type="text" value={situacaoCliente} readOnly />
                    </div>
                    {showClienteGrid && (
                        <div className="grid-overlay">
                            <div className="grid-container">
                                <h3>Selecionar Cliente</h3>
                                <table className="data-grid">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>CPF/CNPJ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {clientes.map(cli => (
                                            <tr key={cli.id} onDoubleClick={() => handleClienteGridDblClick(cli)}>
                                                <td>{cli.id}</td>
                                                <td>{cli.nome}</td>
                                                <td>{cli.cpf_cnpj}</td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                                <button onClick={() => setShowClienteGrid(false)}>Fechar</button>
                            </div>
                        </div>
                    )}
                </fieldset>

                <fieldset className="form-section">
                    <legend>Datas do Pedido</legend>
                    <div className="form-group">
                        <label>Base:</label>
                        <input type="text" value={dataBase} onChange={(e) => setDataBase(e.target.value)} />
                        <label>Recolhimento:</label>
                        <input type="text" value={dataRecolhimento} onChange={(e) => setDataRecolhimento(e.target.value)} />
                        <label>Cobrança:</label>
                        <input type="text" value={dataCobranca} onChange={(e) => setDataCobranca(e.target.value)} />
                        <label>Retorno:</label>
                        <input type="text" value={retorno} onChange={(e) => setRetorno(e.target.value)} />
                    </div>
                </fieldset>

                <fieldset className="form-section">
                    <legend>Itens do Pedido</legend>
                    <div className="form-group">
                        <label>Cód. Artigo:</label>
                        <input type="text" value={codArtigo} onChange={(e) => setCodArtigo(e.target.value)} onBlur={handleCodArtigoExit} />
                        <label>Descrição:</label>
                        <input type="text" value={descricaoArtigo} readOnly />
                    </div>
                    <div className="form-group">
                        <label>Qtd:</label>
                        <input type="number" value={qtdArtigo} onChange={(e) => setQtdArtigo(e.target.value)} />
                        <label>Preço Custo:</label>
                        <input type="text" value={formatCurrency(precoCusto)} readOnly />
                        <label>Preço Venda:</label>
                        <input type="text" value={formatCurrency(precoVenda)} readOnly />
                        <button type="button" onClick={handleAddOrUpdateItem}>Adicionar/Atualizar Item</button>
                    </div>

                    <div className="itens-grid-container">
                        <h3>Itens Atuais</h3>
                        <table className="data-grid">
                            <thead>
                                <tr>
                                    <th>Cód. Artigo</th>
                                    <th>Descrição</th>
                                    <th>Quantidade</th>
                                    <th>Preço Unit.</th>
                                    <th>Total Item</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {itensPedido.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.produto_id}</td>
                                        <td>{item.produto_descricao}</td>
                                        <td>{item.quantidade}</td>
                                        <td>{formatCurrency(item.preco_unitario)}</td>
                                        <td>{formatCurrency(item.valor_total)}</td>
                                        <td>
                                            <button type="button" onClick={() => handleDeleteItem(item.produto_id)}>Excluir</button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </fieldset>

                <fieldset className="form-section">
                    <legend>Resumo do Pedido</legend>
                    <div className="form-group">
                        <label>Total Itens:</label>
                        <input type="text" value={totalItens} readOnly />
                        <label>Total Quantidade:</label>
                        <input type="text" value={totalQuantidade} readOnly />
                        <label>Total Pedido:</label>
                        <input type="text" value={formatCurrency(totalPedido)} readOnly />
                    </div>
                </fieldset>

                <div className="form-actions">
                    <button type="button" onClick={handleConfirm}>Confirmar</button>
                    <button type="button" onClick={handleCancel}>Cancelar</button>
                </div>
            </form>
        </div>
    );
};

export default PedidoPage;