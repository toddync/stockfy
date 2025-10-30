import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { format } from 'date-fns';

const ContagemPage = () => {
    const [dataContagem, setDataContagem] = useState(format(new Date(), 'yyyy-MM-dd'));
    const [contagens, setContagens] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const fetchContagens = async (date, type = null) => {
        setLoading(true);
        setError(null);
        try {
            let url = `/refactor/php/api/contagens_estoque.php?data_contagem=${date}`;
            if (type) {
                url += `&tipo=${type}`;
            }
            const response = await axios.get(url);
            setContagens(response.data);
        } catch (err) {
            console.error("Erro ao buscar contagens:", err);
            setError(err.response?.data?.message || "Erro ao carregar contagens.");
            setContagens([]);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchContagens(dataContagem, '1'); // Carrega contagens do tipo '1' (ajuste) ao iniciar
    }, [dataContagem]);

    const handleDateChange = (e) => {
        setDataContagem(e.target.value);
    };

    const handleAjustarContagem = () => {
        // Lógica para ajustar contagem (equivalente a FrmAjuscontg)
        // Isso pode envolver um modal ou navegação para outra página
        alert("Funcionalidade de Ajustar Contagem a ser implementada.");
    };

    const handleGerarRelatorio = async () => {
        // Lógica para gerar relatório (equivalente a frxRepcontg.ShowReport)
        // Isso pode envolver uma nova requisição à API para dados de relatório
        alert("Funcionalidade de Gerar Relatório a ser implementada.");
    };

    return (
        <div className="contagem-container">
            <h1>Contagem de Estoque</h1>

            <div className="form-group">
                <label htmlFor="dataContagem">Data da Contagem:</label>
                <input
                    type="date"
                    id="dataContagem"
                    value={dataContagem}
                    onChange={handleDateChange}
                    className="form-control"
                />
            </div>

            <div className="button-group">
                <button onClick={handleAjustarContagem} className="btn btn-primary">
                    Ajustar Contagem
                </button>
                <button onClick={handleGerarRelatorio} className="btn btn-secondary">
                    Gerar Relatório
                </button>
            </div>

            {loading && <p>Carregando contagens...</p>}
            {error && <p className="error-message">{error}</p>}

            {!loading && !error && contagens.length > 0 && (
                <div className="table-responsive">
                    <table className="contagem-table">
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
                                <th>Data Registro</th>
                            </tr>
                        </thead>
                        <tbody>
                            {contagens.map((contagem) => (
                                <tr key={contagem.id}>
                                    <td>{contagem.id}</td>
                                    <td>{format(new Date(contagem.data_contagem), 'dd/MM/yyyy')}</td>
                                    <td>{contagem.tipo}</td>
                                    <td>{contagem.produto_id}</td>
                                    <td>{contagem.descricao_produto}</td>
                                    <td>{contagem.grupo_produto}</td>
                                    <td>{contagem.quantidade_inicial}</td>
                                    <td>{contagem.quantidade_sacol}</td>
                                    <td>{parseFloat(contagem.preco_custo_contagem).toFixed(2)}</td>
                                    <td>{format(new Date(contagem.data_registro), 'dd/MM/yyyy HH:mm:ss')}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}
            {!loading && !error && contagens.length === 0 && <p>Nenhuma contagem encontrada para a data selecionada.</p>}
        </div>
    );
};

export default ContagemPage;