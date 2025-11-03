import React, { useState, useEffect } from 'react';
import '../../css/printped.css'; // Importa o CSS específico

const PrintpedPage = () => {
  const [pedidoId, setPedidoId] = useState('');
  const [pedidoData, setPedidoData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const formatPedidoId = (id) => {
    // Preenche com zeros à esquerda até ter 6 dígitos
    return String(id).padStart(6, '0');
  };

  const handlePedidoIdChange = (e) => {
    setPedidoId(e.target.value);
  };

  const fetchPedidoData = async (id) => {
    setLoading(true);
    setError(null);
    try {
      const formattedId = formatPedidoId(id);
      const response = await fetch(`../php/api/printped_api.php?action=get_pedido_details&pedido_id=${formattedId}`);
      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Erro ao buscar detalhes do pedido.');
      }
      const data = await response.json();
      setPedidoData(data);
    } catch (err) {
      setError(err.message);
      setPedidoData(null);
    } finally {
      setLoading(false);
    }
  };

  const handleInputBlur = () => {
    if (pedidoId) {
      fetchPedidoData(pedidoId);
    }
  };

  const handlePrint = async () => {
    if (!pedidoId) {
      setError('Por favor, digite um número de pedido.');
      return;
    }

    setLoading(true);
    setError(null);
    try {
      const formattedId = formatPedidoId(pedidoId);
      const response = await fetch(`../php/api/printped_api.php?action=generate_report&pedido_id=${formattedId}`, {
        method: 'POST',
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Erro ao gerar relatório.');
      }

      const result = await response.json();
      // Assumindo que a API retorna um URL para o PDF ou HTML do relatório
      if (result.reportUrl) {
        window.open(result.reportUrl, '_blank');
      } else {
        alert('Relatório gerado com sucesso, mas nenhum URL de download fornecido.');
      }

      // Atualizar a via do pedido após a impressão
      await fetch(`../php/api/printped_api.php?action=update_via&pedido_id=${formattedId}`, {
        method: 'PUT',
      });

      handleRestore(); // Limpa o formulário após a impressão
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const handleRestore = () => {
    setPedidoId('');
    setPedidoData(null);
    setError(null);
  };

  return (
    <div className="printped-container">
      <div className="printped-groupbox">
        <label htmlFor="pedidoInput" className="printped-label">NUMERO</label>
        <input
          id="pedidoInput"
          type="text"
          className="printped-edit"
          maxLength="6"
          value={pedidoId}
          onChange={handlePedidoIdChange}
          onBlur={handleInputBlur}
          disabled={loading}
        />
        <button
          className="printped-button printped-button-print"
          onClick={handlePrint}
          disabled={loading}
        >
          IMPRIMIR
        </button>
      </div>

      <button
        className="printped-button printped-button-restore"
        onClick={handleRestore}
        disabled={loading}
      >
        RESTAURAR
      </button>

      {loading && <p>Carregando...</p>}
      {error && <p className="printped-error">Erro: {error}</p>}

      {pedidoData && (
        <div className="pedido-details">
          <h3>Detalhes do Pedido {pedidoData.data.pedido_id}</h3>
          <p><strong>Cliente:</strong> {pedidoData.data.cliente_nome} ({pedidoData.data.cliente_id})</p>
          <p><strong>Endereço:</strong> {pedidoData.data.endereco}, {pedidoData.data.bairro}, {pedidoData.data.cidade} - {pedidoData.data.estado}</p>
          <p><strong>CEP:</strong> {pedidoData.data.cep} | <strong>Telefone:</strong> {pedidoData.data.cliente_telefone}</p>
          <p><strong>CPF/CNPJ:</strong> {pedidoData.data.cpf_cnpj} | <strong>IE/RG:</strong> {pedidoData.data.ie_rg}</p>
          <p><strong>Vendedor:</strong> {pedidoData.data.vendedor_nome} ({pedidoData.data.vendedor_id}) - Tel: {pedidoData.data.vendedor_telefone}</p>
          <p><strong>Emissão:</strong> {pedidoData.data.data_emissao} | <strong>Devolução:</strong> {pedidoData.data.data_entrega}</p>
          <p><strong>Status:</strong> {pedidoData.data.status} | <strong>Via:</strong> {pedidoData.data.via}</p>
          <p><strong>Horário Atendimento:</strong> {pedidoData.data.horario_atendimento_inicio} a {pedidoData.data.horario_atendimento_fim}</p>
          <p><strong>Referências:</strong> {pedidoData.data.referencia}</p>
          <p><strong>Observações:</strong> {pedidoData.data.observacoes}</p>
        </div>
      )}
    </div>
  );
};

export default PrintpedPage;