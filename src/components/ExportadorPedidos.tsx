import React, { useState } from 'react';
import * as XLSX from 'xlsx';

interface Pedido {
  id: number;
  cliente_nome: string;
  data_pedido: string;
  valor_total: number;
  situacao: string;
  itens: { produto_descricao: string; quantidade: number; preco_unitario: number }[];
}

const ExportadorPedidos: React.FC = () => {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchPedidos = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await fetch('http://localhost:3000/api/pedidos');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: Pedido[] = await response.json();
      return data;
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar pedidos: ${message}`);
      console.error("Erro ao carregar pedidos:", e);
      return [];
    } finally {
      setLoading(false);
    }
  };

  const exportToExcel = async () => {
    const pedidos = await fetchPedidos();
    if (pedidos.length === 0) {
      alert("Nenhum pedido para exportar.");
      return;
    }

    const dataToExport = pedidos.flatMap(pedido =>
      (pedido.itens || []).map(item => ({
        'ID Pedido': pedido.id,
        'Cliente': pedido.cliente_nome,
        'Data': new Date(pedido.data_pedido).toLocaleDateString(),
        'Status Pedido': pedido.situacao,
        'Produto': item.produto_descricao,
        'Quantidade': item.quantidade,
        'Preço Unitário': item.preco_unitario,
        'Valor Total Item': item.quantidade * item.preco_unitario,
      }))
    );

    if (dataToExport.length === 0) {
        alert("Nenhum item de pedido para exportar.");
        return;
    }

    const worksheet = XLSX.utils.json_to_sheet(dataToExport);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Pedidos');

    // Define column widths
    worksheet['!cols'] = [
      { wch: 10 }, // ID Pedido
      { wch: 20 }, // Cliente
      { wch: 12 }, // Data
      { wch: 15 }, // Status Pedido
      { wch: 25 }, // Produto
      { wch: 12 }, // Quantidade
      { wch: 15 }, // Preço Unitário
      { wch: 18 }, // Valor Total Item
    ];

    XLSX.writeFile(workbook, 'Relatorio_Pedidos.xlsx');
  };

  return (
    <div className="p-6 bg-white shadow-md rounded-lg">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Exportação de Pedidos para Planilha</h2>
      <p className="text-gray-600 mb-6">
        Exporte a lista de pedidos com todos os seus itens para um arquivo Excel (.xlsx).
      </p>
      {error && <p className="text-red-500 mb-4">{error}</p>}
      <button
        onClick={exportToExcel}
        className="bg-teal-500 hover:bg-teal-600 text-white font-bold py-3 px-6 rounded-lg transition-colors text-lg"
        disabled={loading}
      >
        {loading ? 'Carregando...' : 'Exportar para Excel'}
      </button>
      <p className="text-sm text-gray-500 mt-4">
        O arquivo `Relatorio_Pedidos.xlsx` será baixado para a sua pasta de downloads.
      </p>
    </div>
  );
};

export default ExportadorPedidos;
