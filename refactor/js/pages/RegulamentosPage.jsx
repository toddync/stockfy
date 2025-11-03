const RegulamentosPage = () => {
    // Estado para armazenar os dados do relatório, o título, o estado de carregamento e erros
    const [reportData, setReportData] = React.useState(null);
    const [reportTitle, setReportTitle] = React.useState('');
    const [loading, setLoading] = React.useState(false);
    const [error, setError] = React.useState(null);

    // URL base da API
    const API_URL = '../php/api/regulamentos_api.php';

    /**
     * Busca os dados do relatório na API.
     * @param {string} reportType - O tipo de relatório a ser buscado (ex: 'regulamento_velho').
     * @param {string} title - O título a ser exibido para o relatório.
     */
    const fetchReport = async (reportType, title) => {
        setLoading(true);
        setError(null);
        setReportData(null);
        setReportTitle(title);

        try {
            const response = await fetch(`${API_URL}?report=${reportType}`);
            if (!response.ok) {
                // Trata respostas de erro da API (ex: 404, 400)
                const errorData = await response.json();
                throw new Error(errorData.message || `Erro ${response.status}`);
            }
            const data = await response.json();
            setReportData(data.records);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    // Renderiza a tabela de dados do relatório
    const renderReportTable = () => {
        if (!reportData || reportData.length === 0) {
            return <p>Nenhum dado para exibir.</p>;
        }

        // Extrai os cabeçalhos da primeira linha de dados
        const headers = Object.keys(reportData[0]);

        return (
            <table className="report-table">
                <thead>
                    <tr>
                        {headers.map(header => <th key={header}>{header.replace(/_/g, ' ').toUpperCase()}</th>)}
                    </tr>
                </thead>
                <tbody>
                    {reportData.map((row, index) => (
                        <tr key={index}>
                            {headers.map(header => <td key={header}>{row[header]}</td>)}
                        </tr>
                    ))}
                </tbody>
            </table>
        );
    };

    return (
        <div className="container">
            <h1 className="title">EMISSÃO DE REGULAMENTOS</h1>
            <div className="button-group">
                <button onClick={() => fetchReport('regulamento_velho', 'Regulamento Velho')}>REGULAMENTO VELHO</button>
                <button onClick={() => fetchReport('regulamento_novo', 'Regulamento Novo')}>REGULAMENTO NOVO</button>
                <button onClick={() => fetchReport('deposito', 'Regulamento de Depósito')}>REGULAMENTO DE DEPÓSITO</button>
                <button onClick={() => fetchReport('ficha_corte', 'Ficha de Corte')}>FICHA DE CORTE</button>
                <button onClick={() => fetchReport('faccao', 'Relatório de Facção')}>FACÇÃO</button>
            </div>

            <div className="report-container">
                {reportTitle && <h2>{reportTitle}</h2>}
                {loading && <p>Carregando...</p>}
                {error && <p className="error-message">Erro: {error}</p>}
                {!loading && !error && reportData && renderReportTable()}
            </div>
        </div>
    );
};

// Renderiza o componente React na div com id 'root'
ReactDOM.render(<RegulamentosPage />, document.getElementById('root'));