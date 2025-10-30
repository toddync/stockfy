import React, { useState, useEffect } from 'react';
import axios from 'axios';

const AjusteContagemPage = () => {
    const [dataContagem, setDataContagem] = useState('');
    const [contagens, setContagens] = useState([]);
    const [produtoCodigo, setProdutoCodigo] = useState('');
    const [produtoDescricao, setProdutoDescricao] = useState('');
    const [quantidadeInicial, setQuantidadeInicial] = useState('');
    const [precoCusto, setPrecoCusto] = useState('');
    const [message, setMessage] = useState('');

    const API_URL = '/refactor/php/api/contagens_estoque.php';

    const formatarData = (data) => {
        const [ano, mes, dia] = data.split('-');
        return `${dia}/${mes}/${ano}`;
    };

    const handleDataContagemChange = (e) => {
        setDataContagem(e.target.value);
        setMessage('');
    };

    const handleProdutoCodigoChange = (e) => {
        setProdutoCodigo(e.target.value);
        setMessage('');
    };

    const handleQuantidadeInicialChange = (e) => {
        setQuantidadeInicial(e.target.value);
        setMessage('');
    };

    const handlePrecoCustoChange = (e) => {
        setPrecoCusto(e.target.value);
        setMessage('');
    };

    const buscarContagens = async () => {
        if (!dataContagem) {
            setMessage('Por favor, insira a data da contagem.');
            return;
        }
        try {
            const response = await axios.get(`${API_URL}?data_contagem=${dataContagem}`);
            setContagens(response.data);
            setMessage('Contagens carregadas com sucesso.');
        } catch (error) {
            if (error.response && error.response.status === 404) {
                setMessage(error.response.data.message);
                setContagens([]);
            } else {
                setMessage('Erro ao buscar contagens: ' + (error.response?.data?.message || error.message));
            }
        }
    };

    const criarNovaContagem = async () => {
        if (!dataContagem) {
            setMessage('Por favor, insira a data para criar a contagem.');
            return;
        }
        try {
            const response = await axios.post(API_URL, { data_contagem: dataContagem });
            setMessage(response.data.message);
            buscarContagens(); // Recarrega a lista após criar
        } catch (error) {
            setMessage('Erro ao criar nova contagem: ' + (error.response?.data?.message || error.message));
        }
    };

    const excluirContagem = async () => {
        if (!dataContagem) {
            setMessage('Por favor, insira a data para excluir a contagem.');
            return;
        }
        if (window.confirm(`Tem certeza que deseja excluir a contagem da data ${formatarData(dataContagem)}?`)) {
            try {
                const response = await axios.delete(`${API_URL}?data_contagem=${dataContagem}`);
                setMessage(response.data.message);
                setContagens([]);
            } catch (error) {
                setMessage('Erro ao excluir contagem: ' + (error.response?.data?.message || error.message));
            }
        }
    };

    const verificarArtigoEPreencher = async () => {
        if (!dataContagem || !produtoCodigo) {
            setMessage('Data da contagem e Código do Artigo são obrigatórios.');
            return;
        }
        try {
            const response = await axios.get(`${API_URL}?data_contagem=${dataContagem}&produto_codigo=${produtoCodigo}`);
            if (response.data && response.data.length > 0) {
                const artigoContagem = response.data[0];
                setProdutoDescricao(`${artigoContagem.descricao_produto}`);
                setQuantidadeInicial(artigoContagem.quantidade_inicial);
                setPrecoCusto(artigoContagem.preco_custo_contagem);
                setMessage('Artigo encontrado na contagem.');
            } else {
                setMessage('Artigo não está na contagem!');
                setProdutoDescricao('');
                setQuantidadeInicial('');
                setPrecoCusto('');
            }
        } catch (error) {
            setMessage('Erro ao verificar artigo: ' + (error.response?.data?.message || error.message));
            setProdutoDescricao('');
            setQuantidadeInicial('');
            setPrecoCusto('');
        }
    };

    const atualizarContagem = async () => {
        if (!dataContagem || !produtoCodigo || !quantidadeInicial || !precoCusto) {
            setMessage('Todos os campos (Data, Código, Qtd Inicial, Preço Custo) são obrigatórios para atualizar.');
            return;
        }
        try {
            // Encontrar o ID da contagem para o produto e data
            const contagemParaAtualizar = contagens.find(c => c.produto_id === produtoCodigo && c.data_contagem === dataContagem);
            if (!contagemParaAtualizar) {
                setMessage('Artigo não encontrado na contagem para atualização.');
                return;
            }

            const response = await axios.put(API_URL, {
                id: contagemParaAtualizar.id,
                data_contagem: dataContagem,
                produto_id: produtoCodigo,
                quantidade_inicial: parseFloat(quantidadeInicial),
                preco_custo_contagem: parseFloat(precoCusto)
            });
            setMessage(response.data.message);
            buscarContagens(); // Recarrega a lista após atualizar
            setProdutoCodigo('');
            setProdutoDescricao('');
            setQuantidadeInicial('');
            setPrecoCusto('');
        } catch (error) {
            setMessage('Erro ao atualizar contagem: ' + (error.response?.data?.message || error.message));
        }
    };

    useEffect(() => {
        // Pode-se adicionar lógica para carregar a contagem inicial ao montar o componente
        // ou deixar para o usuário buscar manualmente.
    }, []);

    return (
        <div className="ajuste-contagem-container">
            <h1>Ajuste de Contagem</h1>
            {message && <div className="message">{message}</div>}

            <div className="form-group">
                <label htmlFor="dataContagem">Data da Contagem:</label>
                <input
                    type="date"
                    id="dataContagem"
                    value={dataContagem}
                    onChange={handleDataContagemChange}
                />
                <button onClick={buscarContagens}>Buscar Contagem</button>
                <button onClick={criarNovaContagem}>Nova Contagem</button>
                <button onClick={excluirContagem}>Excluir Contagem</button>
            </div>

            <div className="form-group">
                <label htmlFor="produtoCodigo">Código do Artigo:</label>
                <input
                    type="text"
                    id="produtoCodigo"
                    value={produtoCodigo}
                    onChange={handleProdutoCodigoChange}
                    onBlur={verificarArtigoEPreencher}
                />
                <input
                    type="text"
                    id="produtoDescricao"
                    value={produtoDescricao}
                    readOnly
                    placeholder="Descrição do Artigo"
                />
            </div>

            <div className="form-group">
                <label htmlFor="quantidadeInicial">Quantidade Inicial:</label>
                <input
                    type="number"
                    id="quantidadeInicial"
                    value={quantidadeInicial}
                    onChange={handleQuantidadeInicialChange}
                />
            </div>

            <div className="form-group">
                <label htmlFor="precoCusto">Preço de Custo:</label>
                <input
                    type="number"
                    id="precoCusto"
                    value={precoCusto}
                    onChange={handlePrecoCustoChange}
                />
                <button onClick={atualizarContagem}>Atualizar Contagem</button>
            </div>

            <h2>Itens da Contagem</h2>
            <div className="contagem-grid">
                {contagens.length > 0 ? (
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Data</th>
                                <th>Tipo</th>
                                <th>Produto ID</th>
                                <th>Descrição</th>
                                <th>Grupo</th>
                                <th>Qtd Inicial</th>
                                <th>Qtd Sacol</th>
                                <th>Preço Custo</th>
                            </tr>
                        </thead>
                        <tbody>
                            {contagens.map((item) => (
                                <tr key={item.id}>
                                    <td>{item.id}</td>
                                    <td>{formatarData(item.data_contagem)}</td>
                                    <td>{item.tipo}</td>
                                    <td>{item.produto_id}</td>
                                    <td>{item.descricao_produto}</td>
                                    <td>{item.grupo_produto}</td>
                                    <td>{item.quantidade_inicial}</td>
                                    <td>{item.quantidade_sacol}</td>
                                    <td>{item.preco_custo_contagem}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <p>Nenhum item na contagem para a data selecionada.</p>
                )}
            </div>
        </div>
    );
};

export default AjusteContagemPage;