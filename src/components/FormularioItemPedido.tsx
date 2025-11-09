import React, { useState, useEffect } from 'react';
import BuscadorProdutos from './BuscadorProdutos'; // Assuming this component exists

interface ItemPedido {
  id: number;
  produto_id: number;
  produto_descricao: string;
  produto_codigo: string;
  quantidade: number;
  preco_unitario: number;
  valor_total: number;
  tamanho?: string;
  cor?: string;
}

interface Produto {
  id: number;
  descricao: string;
  codigo: string;
  preco_venda: number;
  // Add other relevant product fields if needed for display or calculation
}

interface FormularioItemPedidoProps {
  item: ItemPedido | null;
  pedidoId: number;
  onSave: () => void;
  onCancel: () => void;
}

const FormularioItemPedido: React.FC<FormularioItemPedidoProps> = ({
  item, pedidoId, onSave, onCancel
}) => {
  const [produtoSelecionado, setProdutoSelecionado] = useState<Produto | null>(null);
  const [quantidade, setQuantidade] = useState(item?.quantidade || 1);
  const [variacao, setVariacao] = useState({
    tamanho: item?.tamanho || '',
    cor: item?.cor || ''
  });
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (item) {
      // If editing an existing item, pre-populate product and variations
      setQuantidade(item.quantidade);
      setVariacao({
        tamanho: item.tamanho || '',
        cor: item.cor || ''
      });
      // For productSelecionado, we might need to fetch full product details
      // or assume 'item' already has enough info. For now, use what's available.
      setProdutoSelecionado({
        id: item.produto_id,
        descricao: item.produto_descricao,
        codigo: item.produto_codigo,
        preco_venda: item.preco_unitario, // Assuming preco_unitario is the product's selling price
      });
    } else {
      // Reset for new item
      setProdutoSelecionado(null);
      setQuantidade(1);
      setVariacao({ tamanho: '', cor: '' });
    }
  }, [item]);

  const handleSave = async () => {
    setError(null);
    if (!produtoSelecionado) {
      setError("Por favor, selecione um produto.");
      return;
    }
    if (quantidade <= 0) {
      setError("A quantidade deve ser maior que zero.");
      return;
    }

    const itemData = {
      produto_id: produtoSelecionado.id,
      quantidade,
      preco_unitario: produtoSelecionado.preco_venda,
      tamanho: variacao.tamanho,
      cor: variacao.cor
    };

    try {
      let response;
      if (item?.id) {
        // Editar item existente
        response = await fetch(`http://localhost:3000/api/pedidos/${pedidoId}/itens/${item.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(itemData)
        });
      } else {
        // Adicionar novo item
        response = await fetch(`http://localhost:3000/api/pedidos/${pedidoId}/itens`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(itemData)
        });
      }

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      onSave();
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao salvar item: ${message}`);
      console.error("Erro ao salvar item:", e);
    }
  };

  return (
    <div className="form-overlay fixed inset-0 bg-gray-600 bg-opacity-50 flex justify-center items-center z-50">
      <div className="form-container bg-white p-8 rounded-lg shadow-xl w-full max-w-md">
        <h3 className="text-2xl font-bold mb-6 text-gray-800">{item?.id ? 'Editar Item' : 'Adicionar Item'}</h3>
        
        {error && <div className="text-red-600 mb-4">{error}</div>}

        {/* Busca de Produtos */}
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2">Produto</label>
          <BuscadorProdutos
            onProdutoSelecionado={setProdutoSelecionado}
            produtoInicial={produtoSelecionado} // Pass selected product for display
          />
          {produtoSelecionado && (
            <p className="text-gray-600 text-sm mt-2">
              Produto selecionado: {produtoSelecionado.descricao} (Cód: {produtoSelecionado.codigo}) - R$ {produtoSelecionado.preco_venda.toFixed(2)}
            </p>
          )}
        </div>

        {/* Variações para Roupas */}
        {produtoSelecionado && (
          <div className="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label className="block text-gray-700 text-sm font-bold mb-2">Tamanho</label>
              <select
                value={variacao.tamanho}
                onChange={e => setVariacao({...variacao, tamanho: e.target.value})}
                className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              >
                <option value="">Selecione</option>
                <option value="P">P</option>
                <option value="M">M</option>
                <option value="G">G</option>
                <option value="GG">GG</option>
              </select>
            </div>

            <div>
              <label className="block text-gray-700 text-sm font-bold mb-2">Cor</label>
              <select
                value={variacao.cor}
                onChange={e => setVariacao({...variacao, cor: e.target.value})}
                className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
              >
                <option value="">Selecione</option>
                <option value="Preto">Preto</option>
                <option value="Branco">Branco</option>
                <option value="Azul">Azul</option>
                <option value="Vermelho">Vermelho</option>
              </select>
            </div>
          </div>
        )}

        {/* Quantidade */}
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2">Quantidade</label>
          <input
            type="number"
            value={quantidade}
            onChange={e => setQuantidade(Number(e.target.value))}
            min="1"
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        {/* Preview do Item */}
        {produtoSelecionado && (
          <div className="bg-gray-100 p-3 rounded-md mb-4">
            <strong className="block text-gray-700">Preview:</strong>
            <span className="text-gray-600">{quantidade} × {produtoSelecionado.descricao}</span>
            {variacao.tamanho && <span className="text-gray-600"> - Tamanho: {variacao.tamanho}</span>}
            {variacao.cor && <span className="text-gray-600"> - Cor: {variacao.cor}</span>}
            <br />
            <strong className="text-green-700">Total: R$ {(quantidade * produtoSelecionado.preco_venda).toFixed(2)}</strong>
          </div>
        )}

        <div className="form-actions flex justify-end gap-4">
          <button
            onClick={handleSave}
            disabled={!produtoSelecionado}
            className="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded-md transition-colors disabled:opacity-50"
          >
            Salvar
          </button>
          <button
            type="button"
            onClick={onCancel}
            className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            Cancelar
          </button>
        </div>
      </div>
    </div>
  );
};

export default FormularioItemPedido;
