import React, { useState, useEffect } from 'react';
import '../../css/fluxo-pagamento.css';

const FluxoPagamentoPage = () => {
  const [dataInicial, setDataInicial] = useState('');
  const [dataFinal, setDataFinal] = useState('');
  const [tipoMovimentacao, setTipoMovimentacao] = useState('todos'); // 'todos', 'pagar', 'receber'
  const [fluxoPagamentos, setFluxoPagamentos] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const fetchFluxoPagamentos = async () => {
    setLoading(true);
    setError(null);
    try {
      const params = new URLSearchParams({
        dataInicial,
        dataFinal,
        tipoMovimentacao,
      }).toString();
      const response = await fetch(`/refactor/php/api/fluxo_pagamentos.php?${params}`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setFluxoPagamentos(data);
    } catch (e) {
      setError('Erro ao buscar dados do fluxo de pagamentos.');
      console.error('Erro ao buscar fluxo de pagamentos:', e);
    } finally {
      setLoading(false);
    }
  };

  const handleGerarRelatorio = () => {
    fetchFluxoPagamentos();
  };

  return (
    <div className="fluxo-pagamento-container">
      <h1>Fluxo de Pagamentos</h1>

      <div className="form-group">
        <label htmlFor="dataInicial">Data Inicial:</label>
        <input
          type="date"
          id="dataInicial"
          value={dataInicial}
          onChange={(e) => setDataInicial(e.target.value)}
        />
      </div>

      <div className="form-group">
        <label htmlFor="dataFinal">Data Final:</label>
        <input
          type="date"
          id="dataFinal"
          value={dataFinal}
          onChange={(e) => setDataFinal(e.target.value)}
        />
      </div>

      <div className="form-group">
        <label htmlFor="tipoMovimentacao">Tipo de Movimentação:</label>
        <select
          id="tipoMovimentacao"
          value={tipoMovimentacao}
          onChange={(e) => setTipoMovimentacao(e.target.value)}
        >
          <option value="todos">Todos</option>
          <option value="pagar">Contas a Pagar</option>
          <option value="receber">Contas a Receber</option>
        </select>
      </div>

      <button onClick={handleGerarRelatorio} disabled={loading}>
        {loading ? 'Gerando...' : 'Gerar Relatório'}
      </button>

      {error && <p className="error-message">{error}</p>}

      {fluxoPagamentos.length > 0 && (
        <div className="relatorio-container">
          <h2>Relatório de Fluxo de Pagamentos</h2>
          <table>
            <thead>
              <tr>
                <th>Data</th>
                <th>Descrição</th>
                <th>Tipo</th>
                <th>Valor</th>
              </tr>
            </thead>
            <tbody>
              {fluxoPagamentos.map((item, index) => (
                <tr key={index}>
                  <td>{item.data}</td>
                  <td>{item.descricao}</td>
                  <td>{item.tipo === 'pagar' ? 'Pagar' : 'Receber'}</td>
                  <td>{parseFloat(item.valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default FluxoPagamentoPage;