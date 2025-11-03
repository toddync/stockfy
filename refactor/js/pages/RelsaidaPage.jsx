import React, { useState } from 'react';
import '../../css/relsaida.css'; // Importa o CSS específico para esta página

const RelsaidaPage = () => {
  const [filtroPedidoIndividual, setFiltroPedidoIndividual] = useState('');
  const [filtroEtiquetaInicial, setFiltroEtiquetaInicial] = useState('');
  const [filtroEtiquetaFinal, setFiltroEtiquetaFinal] = useState('');
  const [filtroVendedorEtiqueta, setFiltroVendedorEtiqueta] = useState('');
  const [filtroPedidoFaixaInicial, setFiltroPedidoFaixaInicial] = useState('');
  const [filtroPedidoFaixaFinal, setFiltroPedidoFaixaFinal] = useState('');
  const [filtroVendedorPedido, setFiltroVendedorPedido] = useState('');

  const handleGerarPedidoIndividual = async () => {
    console.log('Gerar Pedido Individual:', filtroPedidoIndividual);
    // Lógica para chamar a API PHP e gerar o relatório de pedido individual
    // Ex: const response = await fetch(`/api/relsaida_api.php?tipo=pedido_individual&pedido=${filtroPedidoIndividual}`);
    // const data = await response.json();
    // Exibir relatório ou baixar PDF
  };

  const handleGerarEtiquetasPorFaixa = async () => {
    console.log('Gerar Etiquetas por Faixa:', filtroEtiquetaInicial, filtroEtiquetaFinal, filtroVendedorEtiqueta);
    // Lógica para chamar a API PHP e gerar o relatório de etiquetas por faixa
  };

  const handleGerarPedidosPorFaixa = async () => {
    console.log('Gerar Pedidos por Faixa:', filtroPedidoFaixaInicial, filtroPedidoFaixaFinal, filtroVendedorPedido);
    // Lógica para chamar a API PHP e gerar o relatório de pedidos por faixa
  };

  return (
    <div className="relsaida-container">
      <h1>Relatório de Saída</h1>

      <div className="relatorio-section">
        <h2>Pedido Individual</h2>
        <div className="form-group">
          <label htmlFor="pedidoIndividual">Número do Pedido:</label>
          <input
            type="text"
            id="pedidoIndividual"
            value={filtroPedidoIndividual}
            onChange={(e) => setFiltroPedidoIndividual(e.target.value)}
          />
        </div>
        <button onClick={handleGerarPedidoIndividual}>Gerar Pedido Individual</button>
      </div>

      <div className="relatorio-section">
        <h2>Etiquetas por Faixa</h2>
        <div className="form-group">
          <label htmlFor="etiquetaInicial">Etiqueta Inicial:</label>
          <input
            type="text"
            id="etiquetaInicial"
            value={filtroEtiquetaInicial}
            onChange={(e) => setFiltroEtiquetaInicial(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label htmlFor="etiquetaFinal">Etiqueta Final:</label>
          <input
            type="text"
            id="etiquetaFinal"
            value={filtroEtiquetaFinal}
            onChange={(e) => setFiltroEtiquetaFinal(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label htmlFor="vendedorEtiqueta">Vendedor:</label>
          <input
            type="text"
            id="vendedorEtiqueta"
            value={filtroVendedorEtiqueta}
            onChange={(e) => setFiltroVendedorEtiqueta(e.target.value)}
          />
        </div>
        <button onClick={handleGerarEtiquetasPorFaixa}>Gerar Etiquetas por Faixa</button>
      </div>

      <div className="relatorio-section">
        <h2>Pedidos por Faixa</h2>
        <div className="form-group">
          <label htmlFor="pedidoFaixaInicial">Pedido Inicial:</label>
          <input
            type="text"
            id="pedidoFaixaInicial"
            value={filtroPedidoFaixaInicial}
            onChange={(e) => setFiltroPedidoFaixaInicial(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label htmlFor="pedidoFaixaFinal">Pedido Final:</label>
          <input
            type="text"
            id="pedidoFaixaFinal"
            value={filtroPedidoFaixaFinal}
            onChange={(e) => setFiltroPedidoFaixaFinal(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label htmlFor="vendedorPedido">Vendedor:</label>
          <input
            type="text"
            id="vendedorPedido"
            value={filtroVendedorPedido}
            onChange={(e) => setFiltroVendedorPedido(e.target.value)}
          />
        </div>
        <button onClick={handleGerarPedidosPorFaixa}>Gerar Pedidos por Faixa</button>
      </div>
    </div>
  );
};

export default RelsaidaPage;