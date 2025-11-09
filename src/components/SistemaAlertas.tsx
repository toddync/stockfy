import React, { useState, useEffect } from 'react';

interface Alerta {
  id: number;
  tipo: 'estoque_baixo' | 'produto_parado' | 'pico_demanda';
  mensagem: string;
  data: string;
  resolvido: boolean;
}

const SistemaAlertas: React.FC = () => {
  const [alertas, setAlertas] = useState<Alerta[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchAlertas = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await fetch('http://localhost:3000/api/sistema-alertas');
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data: Alerta[] = await response.json();
        setAlertas(data);
      } catch (e: unknown) {
        let message = "Erro desconhecido";
        if (e instanceof Error) {
          message = e.message;
        }
        setError(`Falha ao carregar alertas: ${message}`);
        console.error("Erro ao carregar alertas:", e);
      } finally {
        setLoading(false);
      }
    };

    fetchAlertas();
  }, []);

  const handleMarcarResolvido = async (id: number) => {
    // In a real application, this would be an API call to update the alert status
    console.log(`Marcando alerta ${id} como resolvido.`);
    setAlertas(prevAlertas => 
      prevAlertas.map(alerta => 
        alerta.id === id ? { ...alerta, resolvido: true } : alerta
      )
    );
  };

  if (loading) {
    return <div className="text-center p-6">Carregando alertas...</div>;
  }

  if (error) {
    return <div className="text-center p-6 text-red-600">Erro: {error}</div>;
  }

  if (alertas.length === 0) {
    return <div className="text-center p-6">Nenhum alerta ativo.</div>;
  }

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Alertas de Estoque Inteligentes</h2>
      <div className="space-y-4">
        {alertas.filter(alerta => !alerta.resolvido).map(alerta => (
          <div 
            key={alerta.id} 
            className={`p-4 rounded-lg border ${
              alerta.tipo === 'estoque_baixo' ? 'bg-red-50 border-red-300' :
              alerta.tipo === 'produto_parado' ? 'bg-yellow-50 border-yellow-300' :
              'bg-blue-50 border-blue-300'
            } flex justify-between items-center`}
          >
            <div>
              <p className={`font-bold ${
                alerta.tipo === 'estoque_baixo' ? 'text-red-800' :
                alerta.tipo === 'produto_parado' ? 'text-yellow-800' :
                'text-blue-800'
              }`}>
                {alerta.tipo === 'estoque_baixo' && 'Estoque Baixo'}
                {alerta.tipo === 'produto_parado' && 'Produto Parado'}
                {alerta.tipo === 'pico_demanda' && 'Pico de Demanda'}
              </p>
              <p className="text-gray-700 text-sm">{alerta.mensagem}</p>
              <p className="text-gray-500 text-xs mt-1">Data: {new Date(alerta.data).toLocaleDateString()}</p>
            </div>
            <button 
              onClick={() => handleMarcarResolvido(alerta.id)}
              className="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-1 px-3 rounded-md text-sm transition-colors"
            >
              Marcar como Resolvido
            </button>
          </div>
        ))}
      </div>
      {alertas.filter(alerta => !alerta.resolvido).length === 0 && (
        <div className="text-center p-6 text-gray-500">Nenhum alerta ativo no momento.</div>
      )}
    </div>
  );
};

export default SistemaAlertas;
