import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';

interface Pedido {
  id?: number;
  numero_pedido: string;
  cliente_id: number;
  vendedor_id: number;
  data_pedido: string;
  valor_total: number;
  situacao: 'pendente' | 'faturado' | 'cancelado' | 'perdido';
}

interface Cliente {
  id: number;
  nome: string;
}

interface Vendedor {
  id: number;
  nome: string;
}

const NovoPedido: React.FC = () => {
  const [clientes, setClientes] = useState<Cliente[]>([]);
  const [vendedores, setVendedores] = useState<Vendedor[]>([]);
  const [formData, setFormData] = useState<Omit<Pedido, 'id'>>({
    numero_pedido: '',
    cliente_id: 0,
    vendedor_id: 0,
    data_pedido: new Date().toISOString().split('T')[0],
    valor_total: 0,
    situacao: 'pendente',
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const navigate = useNavigate();

  useEffect(() => {
    const carregarDados = async () => {
      setLoading(true);
      setError(null);
      try {
        const [clientesResponse, vendedoresResponse] = await Promise.all([
          fetch('http://localhost:3000/api/clientes'),
          fetch('http://localhost:3000/api/vendedores'),
        ]);

        if (!clientesResponse.ok) {
          throw new Error(`HTTP error! status: ${clientesResponse.status} for clientes`);
        }
        if (!vendedoresResponse.ok) {
          throw new Error(`HTTP error! status: ${vendedoresResponse.status} for vendedores`);
        }

        const clientesData: Cliente[] = await clientesResponse.json();
        const vendedoresData: Vendedor[] = await vendedoresResponse.json();

        setClientes(clientesData);
        setVendedores(vendedoresData);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar dados: ${message}`);
        console.error("Erro ao carregar dados:", e);
      } finally {
        setLoading(false);
      }
    };

    carregarDados();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    try {
      const response = await fetch('http://localhost:3000/api/pedidos', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const novoPedido = await response.json();
      navigate(`/pedidos/${novoPedido.id}`);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao criar pedido: ${message}`);
      console.error("Erro ao criar pedido:", e);
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      <h1 className="text-3xl font-bold text-gray-800 mb-6">Novo Pedido</h1>
      <form onSubmit={handleSubmit}>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label htmlFor="numero_pedido" className="block text-sm font-medium text-gray-700">
              Número do Pedido
            </label>
            <input
              type="text"
              id="numero_pedido"
              value={formData.numero_pedido}
              onChange={(e) => setFormData({ ...formData, numero_pedido: e.target.value })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            />
          </div>
          <div>
            <label htmlFor="data_pedido" className="block text-sm font-medium text-gray-700">
              Data do Pedido
            </label>
            <input
              type="date"
              id="data_pedido"
              value={formData.data_pedido}
              onChange={(e) => setFormData({ ...formData, data_pedido: e.target.value })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            />
          </div>
          <div>
            <label htmlFor="cliente_id" className="block text-sm font-medium text-gray-700">
              Cliente
            </label>
            <select
              id="cliente_id"
              value={formData.cliente_id}
              onChange={(e) => setFormData({ ...formData, cliente_id: parseInt(e.target.value) })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            >
              <option value="">Selecione um cliente</option>
              {clientes.map((cliente) => (
                <option key={cliente.id} value={cliente.id}>
                  {cliente.nome}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label htmlFor="vendedor_id" className="block text-sm font-medium text-gray-700">
              Vendedor
            </label>
            <select
              id="vendedor_id"
              value={formData.vendedor_id}
              onChange={(e) => setFormData({ ...formData, vendedor_id: parseInt(e.target.value) })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            >
              <option value="">Selecione um vendedor</option>
              {vendedores.map((vendedor) => (
                <option key={vendedor.id} value={vendedor.id}>
                  {vendedor.nome}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label htmlFor="valor_total" className="block text-sm font-medium text-gray-700">
              Valor Total
            </label>
            <input
              type="number"
              id="valor_total"
              value={formData.valor_total}
              onChange={(e) => setFormData({ ...formData, valor_total: parseFloat(e.target.value) })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            />
          </div>
          <div>
            <label htmlFor="situacao" className="block text-sm font-medium text-gray-700">
              Situação
            </label>
            <select
              id="situacao"
              value={formData.situacao}
              onChange={(e) => setFormData({ ...formData, situacao: e.target.value as any })}
              className="mt-1 block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
              required
            >
              <option value="pendente">Pendente</option>
              <option value="faturado">Faturado</option>
              <option value="cancelado">Cancelado</option>
              <option value="perdido">Perdido</option>
            </select>
          </div>
        </div>
        <div className="mt-6 flex justify-end">
          <button
            type="button"
            onClick={() => navigate('/pedidos')}
            className="mr-4 bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            Cancelar
          </button>
          <button
            type="submit"
            className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
          >
            Salvar e ir para Detalhes
          </button>
        </div>
      </form>
    </div>
  );
};

export default NovoPedido;