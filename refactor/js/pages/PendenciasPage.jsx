import React, { useState } from 'react';
import '../../css/pendencias.css'; // Importa o CSS

function PendenciasPage() {
    const [praca, setPraca] = useState('');
    const [limiteVencimento, setLimiteVencimento] = useState('');
    const [pendencias, setPendencias] = useState([]);
    const [loading, setLoading] = useState(false);
    const [message, setMessage] = useState('');

    const handleSearch = async () => {
        setLoading(true);
        setMessage('');
        setPendencias([]);

        try {
            const response = await fetch(`../php/api/pendencias_api.php?praca=${praca}&limite_vencimento=${limiteVencimento}`);
            const data = await response.json();

            if (data.success) {
                setPendencias(data.data);
                setMessage(data.message);
            } else {
                setMessage(data.message);
            }
        } catch (error) {
            setMessage('Erro ao buscar pendências: ' + error.message);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="pendencias-container">
            <h1>Relatório de Pendências por Praça</h1>

            <div className="input-group">
                <label htmlFor="limiteVencimento">Limite de Vencimento:</label>
                <input
                    type="date"
                    id="limiteVencimento"
                    value={limiteVencimento}
                    onChange={(e) => setLimiteVencimento(e.target.value)}
                />
            </div>

            <div className="input-group">
                <label htmlFor="praca">Praça:</label>
                <input
                    type="text"
                    id="praca"
                    value={praca}
                    onChange={(e) => setPraca(e.target.value)}
                    maxLength="3"
                />
            </div>

            <button onClick={handleSearch} disabled={loading}>
                {loading ? 'Buscando...' : 'Buscar Pendências'}
            </button>

            {loading && <div className="progress-bar"></div>}

            {message && <p className="message">{message}</p>}

            {pendencias.length > 0 && (
                <div className="pendencias-results">
                    <h2>Resultados das Pendências</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Cód. Cliente</th>
                                <th>Nome Cliente</th>
                                <th>Praça</th>
                                <th>Pedido</th>
                                <th>Emissão</th>
                                <th>Vencimento</th>
                                <th>Resíduo</th>
                                <th>Situação</th>
                                <th>Endereço</th>
                                <th>Bairro</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Telefone</th>
                                <th>Horário Início</th>
                                <th>Horário Fim</th>
                            </tr>
                        </thead>
                        <tbody>
                            {pendencias.map((pendencia, index) => (
                                <tr key={index}>
                                    <td>{pendencia.codcli}</td>
                                    <td>{pendencia.nome_cliente}</td>
                                    <td>{pendencia.nome_praca}</td>
                                    <td>{pendencia.pedido}</td>
                                    <td>{pendencia.emissao}</td>
                                    <td>{pendencia.vencto}</td>
                                    <td>{parseFloat(pendencia.valresi).toFixed(2)}</td>
                                    <td>{pendencia.situ}</td>
                                    <td>{pendencia.endereco_cliente}</td>
                                    <td>{pendencia.bairro_cliente}</td>
                                    <td>{pendencia.cidade_cliente}</td>
                                    <td>{pendencia.estado_cliente}</td>
                                    <td>{pendencia.telefone_cliente}</td>
                                    <td>{pendencia.horain_cliente}</td>
                                    <td>{pendencia.horafin_cliente}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}
        </div>
    );
}

export default PendenciasPage;