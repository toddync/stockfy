import React, { useState, useEffect } from 'react';
import '../../css/artigo.css'; // Importa o CSS

function ArtigoPage() {
    const [artigos, setArtigos] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [filterGrupo, setFilterGrupo] = useState('');
    const [filterFornecedor, setFilterFornecedor] = useState('');
    const [filterReferencia, setFilterReferencia] = useState('');
    const [filterAtivo, setFilterAtivo] = useState('');
    const [filterEstoqueZero, setFilterEstoqueZero] = useState(false);
    const [filterEstoqueNegativo, setFilterEstoqueNegativo] = useState(false);
    const [filterEstoqueAbaixoMinimo, setFilterEstoqueAbaixoMinimo] = useState(false);
    const [filterEstoqueAcimaMaximo, setFilterEstoqueAcimaMaximo] = useState(false);

    const API_URL = 'http://localhost/refactor/php/api/artigos.php'; // Ajuste conforme sua configuração

    const fetchArtigos = async () => {
        setLoading(true);
        setError(null);
        try {
            const params = new URLSearchParams();
            if (searchTerm) params.append('descricao', searchTerm);
            if (filterGrupo) params.append('grupo_id', filterGrupo);
            if (filterFornecedor) params.append('fornecedor_id', filterFornecedor);
            if (filterReferencia) params.append('referencia', filterReferencia);
            if (filterAtivo) params.append('ativo', filterAtivo);
            if (filterEstoqueZero) params.append('estoque_zero', '1');
            if (filterEstoqueNegativo) params.append('estoque_negativo', '1');
            if (filterEstoqueAbaixoMinimo) params.append('estoque_abaixo_minimo', '1');
            if (filterEstoqueAcimaMaximo) params.append('estoque_acima_maximo', '1');

            const response = await fetch(`${API_URL}?${params.toString()}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setArtigos(data.records || []);
        } catch (e) {
            setError(e.message);
            setArtigos([]);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchArtigos();
    }, [searchTerm, filterGrupo, filterFornecedor, filterReferencia, filterAtivo, filterEstoqueZero, filterEstoqueNegativo, filterEstoqueAbaixoMinimo, filterEstoqueAcimaMaximo]);

    const handleSearchChange = (e) => {
        setSearchTerm(e.target.value);
    };

    const handleFilterGrupoChange = (e) => {
        setFilterGrupo(e.target.value);
    };

    const handleFilterFornecedorChange = (e) => {
        setFilterFornecedor(e.target.value);
    };

    const handleFilterReferenciaChange = (e) => {
        setFilterReferencia(e.target.value);
    };

    const handleFilterAtivoChange = (e) => {
        setFilterAtivo(e.target.value);
    };

    const handleFilterEstoqueZeroChange = (e) => {
        setFilterEstoqueZero(e.target.checked);
    };

    const handleFilterEstoqueNegativoChange = (e) => {
        setFilterEstoqueNegativo(e.target.checked);
    };

    const handleFilterEstoqueAbaixoMinimoChange = (e) => {
        setFilterEstoqueAbaixoMinimo(e.target.checked);
    };

    const handleFilterEstoqueAcimaMaximoChange = (e) => {
        setFilterEstoqueAcimaMaximo(e.target.checked);
    };

    if (loading) return <div>Carregando artigos...</div>;
    if (error) return <div>Erro: {error}</div>;

    return (
        <div className="artigo-page">
            <h1>Gestão de Artigos</h1>

            <div className="filters">
                <input
                    type="text"
                    placeholder="Buscar por descrição..."
                    value={searchTerm}
                    onChange={handleSearchChange}
                />
                <input
                    type="text"
                    placeholder="Filtrar por Grupo ID..."
                    value={filterGrupo}
                    onChange={handleFilterGrupoChange}
                />
                <input
                    type="text"
                    placeholder="Filtrar por Fornecedor ID..."
                    value={filterFornecedor}
                    onChange={handleFilterFornecedorChange}
                />
                <input
                    type="text"
                    placeholder="Filtrar por Referência..."
                    value={filterReferencia}
                    onChange={handleFilterReferenciaChange}
                />
                <select value={filterAtivo} onChange={handleFilterAtivoChange}>
                    <option value="">Status Ativo</option>
                    <option value="1">Ativo</option>
                    <option value="0">Inativo</option>
                </select>
                <label>
                    <input
                        type="checkbox"
                        checked={filterEstoqueZero}
                        onChange={handleFilterEstoqueZeroChange}
                    />
                    Estoque Zero
                </label>
                <label>
                    <input
                        type="checkbox"
                        checked={filterEstoqueNegativo}
                        onChange={handleFilterEstoqueNegativoChange}
                    />
                    Estoque Negativo
                </label>
                <label>
                    <input
                        type="checkbox"
                        checked={filterEstoqueAbaixoMinimo}
                        onChange={handleFilterEstoqueAbaixoMinimoChange}
                    />
                    Abaixo do Mínimo
                </label>
                <label>
                    <input
                        type="checkbox"
                        checked={filterEstoqueAcimaMaximo}
                        onChange={handleFilterEstoqueAcimaMaximoChange}
                    />
                    Acima do Máximo
                </label>
            </div>

            <table className="artigo-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                        <th>Grupo</th>
                        <th>Fornecedor</th>
                        <th>Referência</th>
                        <th>Ativo</th>
                        <th>Est. Mín.</th>
                        <th>Est. Máx.</th>
                        <th>Est. Atual</th>
                        <th>Custo</th>
                        <th>Preço Venda</th>
                    </tr>
                </thead>
                <tbody>
                    {artigos.map(artigo => (
                        <tr key={artigo.id}>
                            <td>{artigo.id}</td>
                            <td>{artigo.descricao}</td>
                            <td>{artigo.grupo_id}</td>
                            <td>{artigo.fornecedor_id}</td>
                            <td>{artigo.referencia}</td>
                            <td>{artigo.ativo ? 'Sim' : 'Não'}</td>
                            <td>{artigo.estoque_minimo}</td>
                            <td>{artigo.estoque_maximo}</td>
                            <td>{artigo.estoque_atual}</td>
                            <td>{parseFloat(artigo.custo).toFixed(2)}</td>
                            <td>{parseFloat(artigo.preco_venda).toFixed(2)}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default ArtigoPage;