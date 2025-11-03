import React, { useState } from 'react';
import '../../css/relartigos.css'; // Importa o CSS específico

const RelartigosPage = () => {
    const [dataInicial, setDataInicial] = useState('');
    const [dataFinal, setDataFinal] = useState('');
    const [reportData, setReportData] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    const [reportType, setReportType] = useState(''); // Estado para o tipo de relatório

    const API_BASE_URL = 'http://localhost/rosa/refactor/php/api/relartigos_api.php'; // Ajuste conforme sua configuração

    const fetchReport = async (type) => {
        if (!dataInicial || !dataFinal) {
            setError('Por favor, selecione as datas inicial e final.');
            return;
        }

        setLoading(true);
        setError(null);
        setReportType(type); // Define o tipo de relatório atual

        try {
            const response = await fetch(`${API_BASE_URL}?report_type=${type}&data_inicial=${dataInicial}&data_final=${dataFinal}`);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setReportData(data);
        } catch (e) {
            setError('Falha ao carregar o relatório: ' + e.message);
            setReportData([]);
        } finally {
            setLoading(false);
        }
    };

    const renderTable = () => {
        if (reportData.length === 0) {
            return <p>Nenhum dado para exibir.</p>;
        }

        const headers = Object.keys(reportData[0]);

        return (
            <div className="table-responsive">
                <table className="report-table">
                    <thead>
                        <tr>
                            {headers.map(header => (
                                <th key={header}>{header.replace(/_/g, ' ')}</th>
                            ))}
                        </tr>
                    </thead>
                    <tbody>
                        {reportData.map((row, index) => (
                            <tr key={index}>
                                {headers.map(header => (
                                    <td key={header}>{row[header]}</td>
                                ))}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        );
    };

    return (
        <div className="relartigos-container">
            <h1>Relatório de Artigos</h1>

            <div className="date-selection">
                <label htmlFor="dataInicial">Data Inicial:</label>
                <input
                    type="date"
                    id="dataInicial"
                    value={dataInicial}
                    onChange={(e) => setDataInicial(e.target.value)}
                />

                <label htmlFor="dataFinal">Data Final:</label>
                <input
                    type="date"
                    id="dataFinal"
                    value={dataFinal}
                    onChange={(e) => setDataFinal(e.target.value)}
                />
            </div>

            <div className="report-actions">
                <button onClick={() => fetchReport('retorno_no_periodo')} disabled={loading}>
                    RETOR. NO PERIODO(PROD)
                </button>
                <button onClick={() => fetchReport('movimento_estoque')} disabled={loading}>
                    MOVIMENTO DO ESTOQUE
                </button>
                <button onClick={() => fetchReport('movimentacao_geral')} disabled={loading}>
                    MOVIMENTAÇÃO GERAL
                </button>
            </div>

            {loading && <p>Carregando relatório...</p>}
            {error && <p className="error-message">{error}</p>}

            {reportData.length > 0 && (
                <div className="report-results">
                    <h2>Resultados do Relatório ({reportType.replace(/_/g, ' ').toUpperCase()})</h2>
                    {renderTable()}
                </div>
            )}
        </div>
    );
};

export default RelartigosPage;