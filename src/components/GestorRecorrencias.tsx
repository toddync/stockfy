import React, { useState, useEffect } from 'react';

interface PedidoRecorrente {
  id: number;
  cliente_id: number;
  frequencia: string; // e.g., "Mensal", "Semanal", "Trimestral"
  proxima_entrega: string; // Date string
  status: string; // e.g., "Ativo", "Pausado", "Concluído"
  valor_medio: number;
  cliente_nome?: string; // Optional: To be fetched or joined
}

const GestorRecorrencias: React.FC = () => {
  const [pedidos, setPedidos] = useState<PedidoRecorrente[]>([]);
  const [allPedidos, setAllPedidos] = useState<PedidoRecorrente[]>([]);
  const [filtroStatus, setFiltroStatus] = useState<string>('Todos');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchPedidosRecorrentes = async () => {
    setLoading(true);
    setError(null);
    try {
      const response = await fetch('http://localhost:3000/api/pedidos-recorrentes');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data: PedidoRecorrente[] = await response.json();
      // Here you might want to fetch client names as well
      setAllPedidos(data);
      setPedidos(data);
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao carregar pedidos recorrentes: ${message}`);
      console.error("Erro ao carregar pedidos recorrentes:", e);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPedidosRecorrentes();
  }, []);

  useEffect(() => {
    const filteredPedidos = allPedidos.filter(pedido =>
      filtroStatus === 'Todos' ? true : pedido.status === filtroStatus
    );
    setPedidos(filteredPedidos);
  }, [filtroStatus, allPedidos]);

  const handleStatusChange = async (id: number, newStatus: string) => {
    const originalPedidos = [...pedidos];
    const updatedPedidos = pedidos.map(pedido =>
      pedido.id === id ? { ...pedido, status: newStatus } : pedido
    );
    setPedidos(updatedPedidos);

    try {
      const response = await fetch(`http://localhost:3000/api/pedidos-recorrentes/${id}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ status: newStatus }),
      });
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      // Optionally refetch or update allPedidos state
      setAllPedidos(allPedidos.map(p => p.id === id ? { ...p, status: newStatus } : p));
    } catch (e: unknown) {
      let message = "Erro desconhecido";
      if (e instanceof Error) {
        message = e.message;
      }
      setError(`Falha ao atualizar status: ${message}`);
      console.error("Erro ao atualizar status:", e);
      setPedidos(originalPedidos); // Revert on error
    }
  };

  if (loading) {
    return <div className="text-center p-6">Carregando gestor de recorrências...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  return (
    <div className="p-6 bg-white shadow-md rounded-lg">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Gestor de Pedidos Recorrentes</h2>
      <p className="text-gray-600 mb-6">
        Identifique e gerencie clientes e pedidos com padrões de repetição.
      </p>

      <div className="mb-4">
        <label htmlFor="filtroStatus" className="block text-gray-700 text-sm font-bold mb-2">
          Filtrar por Status:
        </label>
        <select
          id="filtroStatus"
          value={filtroStatus}
          onChange={(e) => setFiltroStatus(e.target.value)}
          className="shadow border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="Todos">Todos</option>
          <option value="Ativo">Ativo</option>
          <option value="Pausado">Pausado</option>
          <option value="Concluído">Concluído</option>
        </select>
      </div>

      {pedidos.length === 0 ? (
        <p className="text-gray-500">Nenhum pedido recorrente encontrado com o filtro atual.</p>
      ) : (
        <div className="overflow-x-auto">
          <table className="min-w-full bg-white">
            <thead>
              <tr>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">ID</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Cliente</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Frequência</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Próxima Entrega</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Valor Médio</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Status</th>
                <th className="py-2 px-4 border-b text-left text-sm font-semibold text-gray-600">Ações</th>
              </tr>
            </thead>
            <tbody>
              {pedidos.map((pedido) => (
                <tr key={pedido.id}>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">{pedido.id}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">{pedido.cliente_nome || `Cliente ID: ${pedido.cliente_id}`}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">{pedido.frequencia}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">{new Date(pedido.proxima_entrega).toLocaleDateString()}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">R$ {pedido.valor_medio.toFixed(2)}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">{pedido.status}</td>
                  <td className="py-2 px-4 border-b text-sm text-gray-800">
                    <select
                      value={pedido.status}
                      onChange={(e) => handleStatusChange(pedido.id, e.target.value)}
                      className="shadow border rounded py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline text-sm"
                    >
                      <option value="Ativo">Ativo</option>
                      <option value="Pausado">Pausado</option>
                      <option value="Concluído">Concluído</option>
                    </select>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default GestorRecorrencias;
