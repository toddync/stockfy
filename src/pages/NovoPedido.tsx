import React, { useState, useEffect } from 'react';
import Alerta from '../components/Alerta'; // Import Alerta

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

interface NovoPedidoProps {
  onSave: (pedidoId: number) => void;
  onCancel: () => void;
}

const NovoPedido: React.FC<NovoPedidoProps> = ({ onSave, onCancel }) => {
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
  const [success, setSuccess] = useState<string | null>(null);

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
    setSuccess(null);

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
      setSuccess(`Pedido ${novoPedido.id} criado com sucesso!`);
      onSave(novoPedido.id);
      
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

  return (
    <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h1 className="text-4xl font-bold text-gray-800 text-center mb-4">Novo Pedido</h1>
        <p className="text-center text-gray-600 mb-8 text-lg">
            Preencha os dados para criar um novo pedido.
        </p>

        {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
        {error && <Alerta message={error} onClose={() => setError(null)} />}

        <form onSubmit={handleSubmit} className="space-y-8">
            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    1. Informações do Pedido
                </label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input
                        type="text"
                        placeholder="Número do Pedido"
                        value={formData.numero_pedido}
                        onChange={(e) => setFormData({ ...formData, numero_pedido: e.target.value })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <input
                        type="date"
                        value={formData.data_pedido}
                        onChange={(e) => setFormData({ ...formData, data_pedido: e.target.value })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                </div>
            </div>

            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    2. Cliente e Vendedor
                </label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <select
                        value={formData.cliente_id}
                        onChange={(e) => setFormData({ ...formData, cliente_id: parseInt(e.target.value) })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    >
                        <option value="">Selecione um cliente</option>
                        {clientes.map((cliente) => (
                            <option key={cliente.id} value={cliente.id}>
                            {cliente.nome}
                            </option>
                        ))}
                    </select>
                    <select
                        value={formData.vendedor_id}
                        onChange={(e) => setFormData({ ...formData, vendedor_id: parseInt(e.target.value) })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    >
                        <option value="">Selecione um vendedor</option>
                        {vendedores.map((vendedor) => (
                            <option key={vendedor.id} value={vendedor.id}>
                            {vendedor.nome}
                            </option>
                        ))}
                    </select>
                </div>
            </div>

            <div>
                <label className="block text-xl font-semibold text-gray-700 mb-2">
                    3. Valor e Situação
                </label>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <input
                        type="number"
                        placeholder="Valor Total"
                        value={formData.valor_total}
                        onChange={(e) => setFormData({ ...formData, valor_total: parseFloat(e.target.value) })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    />
                    <select
                        value={formData.situacao}
                        onChange={(e) => setFormData({ ...formData, situacao: e.target.value as Pedido['situacao'] })}
                        required
                        className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                    >
                        <option value="pendente">Pendente</option>
                        <option value="faturado">Faturado</option>
                        <option value="cancelado">Cancelado</option>
                        <option value="perdido">Perdido</option>
                    </select>
                </div>
            </div>

            <div className="form-actions flex justify-center gap-6 pt-4">
                <button
                    type="button"
                    onClick={onCancel}
                    className="w-1/3 bg-gray-500 hover:bg-gray-600 text-white font-bold text-xl py-4 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300"
                >
                    Cancelar
                </button>
                <button
                    type="submit"
                    className="w-1/3 bg-green-600 hover:bg-green-700 text-white font-bold text-xl py-4 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300"
                >
                    Salvar Pedido
                </button>
            </div>
        </form>
    </div>
  );
};

export default NovoPedido;