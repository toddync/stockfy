import React, { useState, useEffect } from 'react';
import '../../css/solicitacao.css';

function SolicitacaoPage() {
    const [solicitacao, setSolicitacao] = useState({
        vendedor: '',
        numero: '',
        cliente: '',
        nomcli: '',
        datsol: '',
        situ: '',
        items: []
    });
    const [currentItem, setCurrentItem] = useState({
        artigo: '',
        descricao: '',
        pequeno: 0,
        medio: 0,
        grande: 0,
        xgrande: 0,
        obser: ''
    });
    const [clientes, setClientes] = useState([]);
    const [vendedores, setVendedores] = useState([]);
    const [artigos, setArtigos] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');

    useEffect(() => {
        // Carregar clientes, vendedores e artigos ao montar o componente
        fetchClientes();
        fetchVendedores();
        fetchArtigos();
    }, []);

    const fetchClientes = async () => {
        try {
            const response = await fetch('/refactor/php/api/clientes_api.php/clientes');
            const data = await response.json();
            if (response.ok) {
                setClientes(data.records || []);
            } else {
                setError(data.message || 'Erro ao carregar clientes.');
            }
        } catch (err) {
            setError('Erro de rede ao carregar clientes.');
            console.error('Erro ao carregar clientes:', err);
        }
    };

    const fetchVendedores = async () => {
        try {
            const response = await fetch('/refactor/php/api/vendedores.php');
            const data = await response.json();
            if (response.ok) {
                setVendedores(data.records || []);
            } else {
                setError(data.message || 'Erro ao carregar vendedores.');
            }
        } catch (err) {
            setError('Erro de rede ao carregar vendedores.');
            console.error('Erro ao carregar vendedores:', err);
        }
    };

    const fetchArtigos = async () => {
        try {
            const response = await fetch('/refactor/php/api/artigos_api.php');
            const data = await response.json();
            if (response.ok) {
                setArtigos(data.records || []);
            } else {
                setError(data.message || 'Erro ao carregar artigos.');
            }
        } catch (err) {
            setError('Erro de rede ao carregar artigos.');
            console.error('Erro ao carregar artigos:', err);
        }
    };

    const handleSolicitacaoChange = (e) => {
        const { name, value } = e.target;
        setSolicitacao(prev => ({ ...prev, [name]: value }));

        if (name === 'cliente' && value) {
            const selectedCliente = clientes.find(c => c.idcli === value);
            if (selectedCliente) {
                setSolicitacao(prev => ({ ...prev, nomcli: selectedCliente.nome }));
            }
        }
        if (name === 'vendedor' && value) {
            generateNewNumero(value);
        }
    };

    const handleItemChange = (e) => {
        const { name, value } = e.target;
        setCurrentItem(prev => ({ ...prev, [name]: value }));

        if (name === 'artigo' && value) {
            const selectedArtigo = artigos.find(a => a.codigo === value);
            if (selectedArtigo) {
                setCurrentItem(prev => ({ ...prev, descricao: selectedArtigo.descricao }));
            }
        }
    };

    const generateNewNumero = async (vendedorId) => {
        try {
            const response = await fetch(`/refactor/php/api/solicitacoes_api.php?vendedor=${vendedorId}&action=generate_numero`);
            const data = await response.json();
            if (response.ok) {
                setSolicitacao(prev => ({ ...prev, numero: data.new_numero }));
            } else {
                setError(data.message || 'Erro ao gerar novo número de solicitação.');
            }
        } catch (err) {
            setError('Erro de rede ao gerar número de solicitação.');
            console.error('Erro ao gerar número de solicitação:', err);
        }
    };

    const addItem = () => {
        if (currentItem.artigo && currentItem.descricao) {
            setSolicitacao(prev => ({
                ...prev,
                items: [...prev.items, currentItem]
            }));
            setCurrentItem({
                artigo: '',
                descricao: '',
                pequeno: 0,
                medio: 0,
                grande: 0,
                xgrande: 0,
                obser: ''
            });
        } else {
            setError('Artigo e descrição são obrigatórios para adicionar um item.');
        }
    };

    const removeItem = (index) => {
        setSolicitacao(prev => ({
            ...prev,
            items: prev.items.filter((_, i) => i !== index)
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError('');

        const method = solicitacao.numero ? 'PUT' : 'POST';
        const url = '/refactor/php/api/solicitacoes_api.php';

        try {
            const response = await fetch(url, {
                method: method,
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(solicitacao)
            });
            const data = await response.json();
            if (response.ok) {
                alert(data.message);
                // Limpar formulário ou recarregar dados
                setSolicitacao({
                    vendedor: '',
                    numero: '',
                    cliente: '',
                    nomcli: '',
                    datsol: '',
                    situ: '',
                    items: []
                });
            } else {
                setError(data.message || 'Erro na operação.');
            }
        } catch (err) {
            setError('Erro de rede na operação.');
            console.error('Erro na operação:', err);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="solicitacao-container">
            <h1>Solicitação de Artigos</h1>
            {error && <div className="error-message">{error}</div>}
            <form onSubmit={handleSubmit}>
                <div className="form-section">
                    <label>Vendedor:</label>
                    <select name="vendedor" value={solicitacao.vendedor} onChange={handleSolicitacaoChange} required>
                        <option value="">Selecione o Vendedor</option>
                        {vendedores.map(vend => (
                            <option key={vend.codven} value={vend.codven}>{vend.nome}</option>
                        ))}
                    </select>
                </div>
                <div className="form-section">
                    <label>Número da Solicitação:</label>
                    <input type="text" name="numero" value={solicitacao.numero} readOnly />
                </div>
                <div className="form-section">
                    <label>Cliente:</label>
                    <select name="cliente" value={solicitacao.cliente} onChange={handleSolicitacaoChange} required>
                        <option value="">Selecione o Cliente</option>
                        {clientes.map(cli => (
                            <option key={cli.idcli} value={cli.idcli}>{cli.nome}</option>
                        ))}
                    </select>
                </div>
                <div className="form-section">
                    <label>Nome do Cliente:</label>
                    <input type="text" name="nomcli" value={solicitacao.nomcli} readOnly />
                </div>
                <div className="form-section">
                    <label>Data da Solicitação:</label>
                    <input type="date" name="datsol" value={solicitacao.datsol} onChange={handleSolicitacaoChange} required />
                </div>
                <div className="form-section">
                    <label>Situação:</label>
                    <input type="text" name="situ" value={solicitacao.situ} onChange={handleSolicitacaoChange} />
                </div>

                <h2>Itens da Solicitação</h2>
                <div className="item-form">
                    <div className="form-section">
                        <label>Artigo:</label>
                        <select name="artigo" value={currentItem.artigo} onChange={handleItemChange}>
                            <option value="">Selecione o Artigo</option>
                            {artigos.map(art => (
                                <option key={art.codigo} value={art.codigo}>{art.codigo} - {art.descricao}</option>
                            ))}
                        </select>
                    </div>
                    <div className="form-section">
                        <label>Descrição:</label>
                        <input type="text" name="descricao" value={currentItem.descricao} readOnly />
                    </div>
                    <div className="form-section">
                        <label>Pequeno:</label>
                        <input type="number" name="pequeno" value={currentItem.pequeno} onChange={handleItemChange} />
                    </div>
                    <div className="form-section">
                        <label>Médio:</label>
                        <input type="number" name="medio" value={currentItem.medio} onChange={handleItemChange} />
                    </div>
                    <div className="form-section">
                        <label>Grande:</label>
                        <input type="number" name="grande" value={currentItem.grande} onChange={handleItemChange} />
                    </div>
                    <div className="form-section">
                        <label>X-Grande:</label>
                        <input type="number" name="xgrande" value={currentItem.xgrande} onChange={handleItemChange} />
                    </div>
                    <div className="form-section">
                        <label>Observação:</label>
                        <input type="text" name="obser" value={currentItem.obser} onChange={handleItemChange} />
                    </div>
                    <button type="button" onClick={addItem}>Adicionar Item</button>
                </div>

                <table className="items-table">
                    <thead>
                        <tr>
                            <th>Artigo</th>
                            <th>Descrição</th>
                            <th>P</th>
                            <th>M</th>
                            <th>G</th>
                            <th>GG</th>
                            <th>Observação</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {solicitacao.items.map((item, index) => (
                            <tr key={index}>
                                <td>{item.artigo}</td>
                                <td>{item.descricao}</td>
                                <td>{item.pequeno}</td>
                                <td>{item.medio}</td>
                                <td>{item.grande}</td>
                                <td>{item.xgrande}</td>
                                <td>{item.obser}</td>
                                <td>
                                    <button type="button" onClick={() => removeItem(index)}>Remover</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>

                <button type="submit" disabled={loading}>
                    {loading ? 'Salvando...' : 'Salvar Solicitação'}
                </button>
            </form>
        </div>
    );
}

export default SolicitacaoPage;