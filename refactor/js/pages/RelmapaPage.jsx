import React, { useState, useEffect } from 'react';
import axios from 'axios'; // Certifique-se de ter o axios instalado (npm install axios)
import '../../css/relmapa.css';

const API_BASE_URL = '/refactor/php/api/relmapa_api.php'; // Ajuste conforme sua configuração

const RelmapaPage = () => {
    const [reportType, setReportType] = useState('');
    const [codigo, setCodigo] = useState('');
    const [dataInicio, setDataInicio] = useState('');
    const [dataFim, setDataFim] = useState('');
    const [percentualLimite, setPercentualLimite] = useState('');
    const [pracaInicio, setPracaInicio] = useState('');
    const [pracaFim, setPracaFim] = useState('');
    const [situacao, setSituacao] = useState('');
    const [codProduto, setCodProduto] = useState('');
    const [codClienteExtrato, setCodClienteExtrato] = useState('');
    const [dataInicialApuracaoExtrato, setDataInicialApuracaoExtrato] = useState('');

    const [reportData, setReportData] = useState(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);

    const fetchReport = async (action, params) => {
        setLoading(true);
        setError(null);
        try {
            const response = await axios.get(API_BASE_URL, { params: { action, ...params } });
            if (response.data.success) {
                setReportData(response.data.data);
            } else {
                setError(response.data.message);
            }
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    const handleMovimentacaoGeralArtigos = () => {
        fetchReport('movimentacao_geral_artigos', {
            tipo: reportType,
            codigo,
            data_inicio: dataInicio,
            data_fim: dataFim,
            percentual_limite: percentualLimite || null,
        });
    };

    const handlePedidosComResiduos = () => {
        fetchReport('pedidos_com_residuos', {
            cod_vendedor: codigo,
            data_inicio: dataInicio,
            data_fim: dataFim,
            praca_inicio: pracaInicio,
            praca_fim: pracaFim,
        });
    };

    const handleCobrancasEfetuadas = () => {
        fetchReport('cobrancas_efetuadas', {
            cod_vendedor: codigo,
            data_inicio: dataInicio,
            data_fim: dataFim,
            praca_inicio: pracaInicio,
            praca_fim: pracaFim,
        });
    };

    const handleResiduosPerdidos = () => {
        fetchReport('residuos_perdidos', {
            cod_vendedor: codigo,
            data_inicio: dataInicio,
            data_fim: dataFim,
            praca_inicio: pracaInicio,
            praca_fim: pracaFim,
        });
    };

    const handleExtratoCliente = () => {
        fetchReport('extrato_cliente', {
            cod_cliente: codClienteExtrato,
            data_inicial_apuracao: dataInicialApuracaoExtrato,
        });
    };

    const handleRelatorioProdutos = () => {
        fetchReport('relatorio_produtos', {
            tipo: reportType,
            codigo,
            data_inicio: dataInicio,
            data_fim: dataFim,
            situacao,
            cod_produto: codProduto,
            praca_inicio: pracaInicio,
            praca_fim: pracaFim,
        });
    };

    const renderReport = () => {
        if (!reportData) return null;

        switch (reportType) {
            case 'movimentacao_geral_artigos':
                return (
                    <div>
                        <h3>Movimentação Geral de Artigos</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descrição</th>
                                    <th>Custo</th>
                                    <th>Qtd Física</th>
                                    <th>Val Física</th>
                                    <th>Qtd Sacoleira</th>
                                    <th>Val Sacoleira</th>
                                    <th>Qtd Retorno/Devolução</th>
                                    <th>Qtd Vendido</th>
                                    <th>Val Vendido</th>
                                    <th>Média (%)</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.codigo}</td>
                                        <td>{item.descricao}</td>
                                        <td>{parseFloat(item.custo).toFixed(2)}</td>
                                        <td>{item.qtdFisica}</td>
                                        <td>{parseFloat(item.valFisico).toFixed(2)}</td>
                                        <td>{item.qtdSacoleira}</td>
                                        <td>{parseFloat(item.valSacoleira).toFixed(2)}</td>
                                        <td>{item.qtdRetornoDevolucao}</td>
                                        <td>{item.qtdVendido}</td>
                                        <td>{parseFloat(item.valVendido).toFixed(2)}</td>
                                        <td>{parseFloat(item.media).toFixed(2)}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            case 'pedidos_com_residuos':
                return (
                    <div>
                        <h3>Pedidos com Resíduos para Cobrança</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Pedido ID</th>
                                    <th>Cliente</th>
                                    <th>Nome Cliente</th>
                                    <th>Emissão</th>
                                    <th>Devolução</th>
                                    <th>Vencimento</th>
                                    <th>Total Venda</th>
                                    <th>Resíduo</th>
                                    <th>Situação</th>
                                    <th>Telefone</th>
                                    <th>Bairro</th>
                                    <th>Praça</th>
                                    <th>Pagamentos Resíduos</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.pedido_id}</td>
                                        <td>{item.codcli}</td>
                                        <td>{item.nomcli}</td>
                                        <td>{item.emissao}</td>
                                        <td>{item.devolucao}</td>
                                        <td>{item.vencimento}</td>
                                        <td>{parseFloat(item.totven).toFixed(2)}</td>
                                        <td>{parseFloat(item.residuo).toFixed(2)}</td>
                                        <td>{item.situ}</td>
                                        <td>{item.ntel}</td>
                                        <td>{item.bair}</td>
                                        <td>{item.praca}</td>
                                        <td>
                                            {item.pagamentos_residuos && item.pagamentos_residuos.map((pag, pIdx) => (
                                                <div key={pIdx}>{pag.datmov}: {parseFloat(pag.valpag).toFixed(2)}</div>
                                            ))}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            case 'cobrancas_efetuadas':
                return (
                    <div>
                        <h3>Cobranças Efetuadas</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Pedido ID</th>
                                    <th>Cliente</th>
                                    <th>Nome Cliente</th>
                                    <th>Vencimento</th>
                                    <th>Total Venda</th>
                                    <th>Resíduo</th>
                                    <th>Situação</th>
                                    <th>Telefone</th>
                                    <th>Bairro</th>
                                    <th>Praça</th>
                                    <th>Pagamentos Resíduos</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.pedido_id}</td>
                                        <td>{item.codcli}</td>
                                        <td>{item.nomcli}</td>
                                        <td>{item.vencimento}</td>
                                        <td>{parseFloat(item.totven).toFixed(2)}</td>
                                        <td>{parseFloat(item.residuo).toFixed(2)}</td>
                                        <td>{item.situ}</td>
                                        <td>{item.ntel}</td>
                                        <td>{item.bair}</td>
                                        <td>{item.praca}</td>
                                        <td>
                                            {item.pagamentos_residuos && item.pagamentos_residuos.map((pag, pIdx) => (
                                                <div key={pIdx}>{pag.datmov}: {parseFloat(pag.valpag).toFixed(2)}</div>
                                            ))}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            case 'residuos_perdidos':
                return (
                    <div>
                        <h3>Resíduos Perdidos</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Pedido ID</th>
                                    <th>Cliente</th>
                                    <th>Nome Cliente</th>
                                    <th>Emissão</th>
                                    <th>Devolução</th>
                                    <th>Vencimento</th>
                                    <th>Total Venda</th>
                                    <th>Resíduo</th>
                                    <th>Situação</th>
                                    <th>Telefone</th>
                                    <th>Bairro</th>
                                    <th>Praça</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.pedido_id}</td>
                                        <td>{item.codcli}</td>
                                        <td>{item.nomcli}</td>
                                        <td>{item.emissao}</td>
                                        <td>{item.devolucao}</td>
                                        <td>{item.vencimento}</td>
                                        <td>{parseFloat(item.totven).toFixed(2)}</td>
                                        <td>{parseFloat(item.residuo).toFixed(2)}</td>
                                        <td>{item.situ}</td>
                                        <td>{item.ntel}</td>
                                        <td>{item.bair}</td>
                                        <td>{item.praca}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            case 'extrato_cliente':
                return (
                    <div>
                        <h3>Extrato do Cliente: {codClienteExtrato}</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Tipo</th>
                                    <th>Valor</th>
                                    <th>Data</th>
                                    <th>Pedido ID</th>
                                    <th>Situação</th>
                                    <th>Vencimento</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.tipo}</td>
                                        <td>{parseFloat(item.valor).toFixed(2)}</td>
                                        <td>{item.data}</td>
                                        <td>{item.pedido_id}</td>
                                        <td>{item.situ}</td>
                                        <td>{item.vencimento}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            case 'relatorio_produtos':
                return (
                    <div>
                        <h3>Relatório de Produtos ({situacao})</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Pedido ID</th>
                                    <th>Vendedor</th>
                                    <th>Cliente</th>
                                    <th>Nome Cliente</th>
                                    <th>Emissão</th>
                                    <th>Devolução</th>
                                    <th>Data Retorno</th>
                                    <th>Vencimento</th>
                                    <th>Total Pedido</th>
                                    <th>Total Venda</th>
                                    <th>Resíduo</th>
                                    <th>Situação</th>
                                    <th>Qtd Saída</th>
                                    <th>Telefone</th>
                                    <th>Bairro</th>
                                    <th>Praça</th>
                                </tr>
                            </thead>
                            <tbody>
                                {reportData.map((item, index) => (
                                    <tr key={index}>
                                        <td>{item.pedido_id}</td>
                                        <td>{item.codven}</td>
                                        <td>{item.codcli}</td>
                                        <td>{item.nomcli}</td>
                                        <td>{item.emissao}</td>
                                        <td>{item.devolucao}</td>
                                        <td>{item.datareto}</td>
                                        <td>{item.vencimento}</td>
                                        <td>{parseFloat(item.totped).toFixed(2)}</td>
                                        <td>{parseFloat(item.totven).toFixed(2)}</td>
                                        <td>{parseFloat(item.residuo).toFixed(2)}</td>
                                        <td>{item.situ}</td>
                                        <td>{item.qtdsai}</td>
                                        <td>{item.ntel}</td>
                                        <td>{item.bair}</td>
                                        <td>{item.praca}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                );
            default:
                return <p>Selecione um tipo de relatório para visualizar.</p>;
        }
    };

    return (
        <div className="relmapa-container">
            <h1>Relatórios de Mapa</h1>

            <div className="filters-section">
                <div className="filter-group">
                    <label>Tipo de Relatório:</label>
                    <select value={reportType} onChange={(e) => setReportType(e.target.value)}>
                        <option value="">Selecione...</option>
                        <option value="movimentacao_geral_artigos">Movimentação Geral de Artigos</option>
                        <option value="pedidos_com_residuos">Pedidos com Resíduos</option>
                        <option value="cobrancas_efetuadas">Cobranças Efetuadas</option>
                        <option value="residuos_perdidos">Resíduos Perdidos</option>
                        <option value="extrato_cliente">Extrato de Cliente</option>
                        <option value="relatorio_produtos">Relatório de Produtos</option>
                    </select>
                </div>

                {(reportType === 'movimentacao_geral_artigos' || reportType === 'pedidos_com_residuos' || reportType === 'cobrancas_efetuadas' || reportType === 'residuos_perdidos' || reportType === 'relatorio_produtos') && (
                    <>
                        <div className="filter-group">
                            <label>Código (Vendedor/Cliente):</label>
                            <input type="text" value={codigo} onChange={(e) => setCodigo(e.target.value)} />
                        </div>
                        <div className="filter-group">
                            <label>Data Início:</label>
                            <input type="date" value={dataInicio} onChange={(e) => setDataInicio(e.target.value)} />
                        </div>
                        <div className="filter-group">
                            <label>Data Fim:</label>
                            <input type="date" value={dataFim} onChange={(e) => setDataFim(e.target.value)} />
                        </div>
                    </>
                )}

                {reportType === 'movimentacao_geral_artigos' && (
                    <div className="filter-group">
                        <label>Percentual Limite:</label>
                        <input type="number" value={percentualLimite} onChange={(e) => setPercentualLimite(e.target.value)} />
                    </div>
                )}

                {(reportType === 'pedidos_com_residuos' || reportType === 'cobrancas_efetuadas' || reportType === 'residuos_perdidos' || reportType === 'relatorio_produtos') && (
                    <>
                        <div className="filter-group">
                            <label>Praça Início:</label>
                            <input type="text" value={pracaInicio} onChange={(e) => setPracaInicio(e.target.value)} />
                        </div>
                        <div className="filter-group">
                            <label>Praça Fim:</label>
                            <input type="text" value={pracaFim} onChange={(e) => setPracaFim(e.target.value)} />
                        </div>
                    </>
                )}

                {reportType === 'extrato_cliente' && (
                    <>
                        <div className="filter-group">
                            <label>Código Cliente:</label>
                            <input type="text" value={codClienteExtrato} onChange={(e) => setCodClienteExtrato(e.target.value)} />
                        </div>
                        <div className="filter-group">
                            <label>Data Inicial Apuração:</label>
                            <input type="date" value={dataInicialApuracaoExtrato} onChange={(e) => setDataInicialApuracaoExtrato(e.target.value)} />
                        </div>
                    </>
                )}

                {reportType === 'relatorio_produtos' && (
                    <>
                        <div className="filter-group">
                            <label>Situação (E, X, R):</label>
                            <input type="text" value={situacao} onChange={(e) => setSituacao(e.target.value)} />
                        </div>
                        <div className="filter-group">
                            <label>Código Produto:</label>
                            <input type="text" value={codProduto} onChange={(e) => setCodProduto(e.target.value)} />
                        </div>
                    </>
                )}

                <div className="action-buttons">
                    {reportType === 'movimentacao_geral_artigos' && <button onClick={handleMovimentacaoGeralArtigos} disabled={loading}>Gerar Relatório</button>}
                    {reportType === 'pedidos_com_residuos' && <button onClick={handlePedidosComResiduos} disabled={loading}>Gerar Relatório</button>}
                    {reportType === 'cobrancas_efetuadas' && <button onClick={handleCobrancasEfetuadas} disabled={loading}>Gerar Relatório</button>}
                    {reportType === 'residuos_perdidos' && <button onClick={handleResiduosPerdidos} disabled={loading}>Gerar Relatório</button>}
                    {reportType === 'extrato_cliente' && <button onClick={handleExtratoCliente} disabled={loading}>Gerar Relatório</button>}
                    {reportType === 'relatorio_produtos' && <button onClick={handleRelatorioProdutos} disabled={loading}>Gerar Relatório</button>}
                </div>
            </div>

            {loading && <p>Carregando...</p>}
            {error && <p className="error-message">Erro: {error}</p>}

            <div className="report-results">
                {renderReport()}
            </div>
        </div>
    );
};

export default RelmapaPage;