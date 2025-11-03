import React from 'react';
import ReactDOM from 'react-dom/client';
import '../../css/lanca-pag.css';

function LancaPagPage() {
    // Simula os dados da DBGrid1
    const pagamentos = [
        { id: 1, descricao: 'Aluguel', valor: 1500.00, vencimento: '2025-11-05' },
        { id: 2, descricao: 'Salário', valor: 3000.00, vencimento: '2025-11-10' },
        { id: 3, descricao: 'Conta de Luz', valor: 250.00, vencimento: '2025-11-15' },
    ];

    const handleButton1Click = () => {
        alert('Botão 1 clicado!');
        // Lógica para o Button1 do Delphi
    };

    const handleButton2Click = () => {
        alert('Botão 2 clicado!');
        // Lógica para o Button2 do Delphi
    };

    return (
        <div className="lanca-pag-container">
            <h1 className="lanca-pag-header">Lançamento de Pagamentos</h1>

            <div className="lanca-pag-group-box">
                <h3>Detalhes do Pagamento</h3>
                {/* Conteúdo do GroupBox1 */}
                <p>Aqui viriam os campos de entrada para detalhes do pagamento.</p>
            </div>

            <div className="lanca-pag-group-box">
                <h3>Lista de Pagamentos</h3>
                <table className="lanca-pag-grid">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descrição</th>
                            <th>Valor</th>
                            <th>Vencimento</th>
                        </tr>
                    </thead>
                    <tbody>
                        {pagamentos.map(pagamento => (
                            <tr key={pagamento.id}>
                                <td>{pagamento.id}</td>
                                <td>{pagamento.descricao}</td>
                                <td>{pagamento.valor.toFixed(2)}</td>
                                <td>{pagamento.vencimento}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>

            <div>
                <button className="lanca-pag-button" onClick={handleButton1Click}>
                    Botão 1
                </button>
                <button className="lanca-pag-button" onClick={handleButton2Click}>
                    Botão 2
                </button>
            </div>
        </div>
    );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <LancaPagPage />
    </React.StrictMode>
);

export default LancaPagPage;