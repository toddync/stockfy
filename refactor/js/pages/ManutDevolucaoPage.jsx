import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client'; // Importar ReactDOM
import '../../css/manut-devolucao.css';

const ManutDevolucaoPage = () => {
    const [movimentacoes, setMovimentacoes] = useState([]);
    const [vendedores, setVendedores] = useState([]);
    const [filtroVendedor, setFiltroVendedor] = useState('');
    const [filtroDataInicio, setFiltroDataInicio] = useState('');
    const [filtroDataFim, setFiltroDataFim] = useState('');
    const [termoBusca, setTermoBusca] = useState('');
    const [tipoBusca, setTipoBusca] = useState('numero_documento'); // 'numero_documento' ou 'data_movimentacao'
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const API_URL = 'http://localhost/refactor/php/api/movimentacoes_estoque.php'; // Assumindo que a API está rodando localmente
    const VENDEDORES_API_URL = 'http://localhost/refactor/php/api/vendedores.php'; // API para vendedores

    useEffect(() => {
        fetchMovimentacoes();
        fetchVendedores();
    }, []);

    const fetchMovimentacoes = async (params = {}) => {
        setLoading(true);
        setError(null);
        try {
            const queryParams = new URLSearchParams(params).toString();
            const response = await fetch(`${API_URL}?${queryParams}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setMovimentacoes(data.records || []);
        } catch (e) {
            setError(e.message);
            setMovimentacoes([]);
        } finally {
            setLoading(false);
        }
    };

    const fetchVendedores = async () => {
        try {
            const response = await fetch(VENDEDORES_API_URL);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setVendedores(data.records || []);
        } catch (e) {
            console.error("Erro ao buscar vendedores:", e.message);
        }
    };

    const handleFilter = () => {
        const params = {
            startDate: filtroDataInicio,
            endDate: filtroDataFim,
            vendorId: filtroVendedor === '999' ? null : filtroVendedor // '999' para todos os vendedores
        };
        fetchMovimentacoes(params);
    };

    const handleSearch = () => {
        const params = {
            search: termoBusca,
            type: tipoBusca // Pode ser 'numero_documento' ou 'data_movimentacao'
        };
        fetchMovimentacoes(params);
    };

    const handleCrudAction = (action, id = null) => {
        // Implementar a lógica para abrir um modal ou navegar para uma página de detalhes
        // para Implantar, Alterar, Consultar, Excluir.
        // Por enquanto, apenas um console.log
        console.log(`Ação: ${action}, ID: ${id}`);
        // Em uma aplicação real, você usaria React Router para navegar ou um modal para formulários.
    };

    return (
        <div className="manut-devolucao-container">
            <h1>Manutenção de Devoluções</h1>

            <div className="filter-section">
                <div className="filter-group">
                    <label htmlFor="vendedor">Vendedor:</label>
                    <select
                        id="vendedor"
                        value={filtroVendedor}
                        onChange={(e) => setFiltroVendedor(e.target.value)}
                    >
                        <option value="">Selecione um vendedor</option>
                        <option value="999">Todos</option>
                        {vendedores.map(vendedor => (
                            <option key={vendedor.id} value={vendedor.id}>{vendedor.nome}</option>
                        ))}
                    </select>
                </div>
                <div className="filter-group">
                    <label htmlFor="dataInicio">Data Início:</label>
                    <input
                        type="date"
                        id="dataInicio"
                        value={filtroDataInicio}
                        onChange={(e) => setFiltroDataInicio(e.target.value)}
                    />
                </div>
                <div className="filter-group">
                    <label htmlFor="dataFim">Data Fim:</label>
                    <input
                        type="date"
                        id="dataFim"
                        value={filtroDataFim}
                        onChange={(e) => setFiltroDataFim(e.target.value)}
                    />
                </div>
                <button onClick={handleFilter}>Filtrar</button>
            </div>

            <div className="search-section">
                <div className="search-group">
                    <label htmlFor="tipoBusca">Buscar por:</label>
                    <select
                        id="tipoBusca"
                        value={tipoBusca}
                        onChange={(e) => setTipoBusca(e.target.value)}
                    >
                        <option value="numero_documento">Número Documento</option>
                        <option value="data_movimentacao">Data Movimentação</option>
                    </select>
                </div>
                <div className="search-group">
                    <input
                        type="text"
                        value={termoBusca}
                        onChange={(e) => setTermoBusca(e.target.value)}
                        placeholder="Digite o termo de busca"
                    />
                </div>
                <button onClick={handleSearch}>Buscar</button>
            </div>

            <div className="crud-actions">
                <button onClick={() => handleCrudAction('Implantar')}>Implantar</button>
                <button onClick={() => handleCrudAction('Alterar', movimentacoes.length > 0 ? movimentacoes[0].id : null)} disabled={movimentacoes.length === 0}>Alterar</button>
                <button onClick={() => handleCrudAction('Consultar', movimentacoes.length > 0 ? movimentacoes[0].id : null)} disabled={movimentacoes.length === 0}>Consultar</button>
                <button onClick={() => handleCrudAction('Excluir', movimentacoes.length > 0 ? movimentacoes[0].id : null)} disabled={movimentacoes.length === 0}>Excluir</button>
            </div>

            {loading && <p>Carregando movimentações...</p>}
            {error && <p className="error-message">Erro: {error}</p>}

            <div className="table-responsive">
                <table className="movimentacoes-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Número Documento</th>
                            <th>Data Movimentação</th>
                            <th>Tipo</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Preço Custo</th>
                            <th>Data Registro</th>
                            <th>Vendedor</th>
                        </tr>
                    </thead>
                    <tbody>
                        {movimentacoes.length > 0 ? (
                            movimentacoes.map((mov) => (
                                <tr key={mov.id}>
                                    <td>{mov.id}</td>
                                    <td>{mov.numero_documento}</td>
                                    <td>{new Date(mov.data_movimentacao).toLocaleDateString()}</td>
                                    <td>{mov.tipo}</td>
                                    <td>{mov.descricao_produto}</td>
                                    <td>{mov.quantidade}</td>
                                    <td>{parseFloat(mov.preco_custo).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</td>
                                    <td>{new Date(mov.data_registro).toLocaleDateString()}</td>
                                    <td>{mov.nome_vendedor || 'N/A'}</td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan={9}>Nenhuma movimentação encontrada.</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ManutDevolucaoPage;

// Renderiza o componente React no elemento 'root' do HTML
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <ManutDevolucaoPage />
  </React.StrictMode>
);