import React, { useState } from 'react';
import BuscadorProdutos from '../components/BuscadorProdutos';
import Alerta from '../components/Alerta';

// Interfaces based on existing project structure
interface Produto {
  id: number;
  descricao: string;
  codigo: string;
  preco_venda: number;
}

const Devolucoes: React.FC = () => {
  const [produto, setProduto] = useState<Produto | null>(null);
  const [quantidade, setQuantidade] = useState(1);
  const [observacoes, setObservacoes] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const resetForm = () => {
    setProduto(null);
    setQuantidade(1);
    setObservacoes('');
  };

  const handleRegistrarDevolucao = async (motivo: 'devolucao' | 'defeito') => {
    if (!produto) {
      setError('Por favor, selecione um produto antes de registrar a devolução.');
      return;
    }

    setLoading(true);
    setError(null);
    setSuccess(null);

    try {
      // This endpoint now exists in the refactored backend
      const response = await fetch('http://localhost:3000/api/movimentacoes-estoque/devolucoes', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          produto_id: produto.id,
          quantidade: quantidade,
          tipo_movimentacao: motivo,
          observacoes: observacoes,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Falha ao registrar a devolução.');
      }

      const result = await response.json();
      setSuccess(result.message || 'Devolução registrada com sucesso!');
      resetForm();

    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(message);
      console.error('Erro ao registrar devolução:', e);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="page-container p-8 bg-gray-50 min-h-screen flex items-center justify-center">
      <div className="max-w-2xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h1 className="text-4xl font-bold text-gray-800 text-center mb-4">Registrar uma Devolução</h1>
        <p className="text-center text-gray-600 mb-8 text-lg">
          Um processo simples para lidar com produtos que retornaram.
        </p>

        {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
        {error && <Alerta message={error} onClose={() => setError(null)} />}
        
        <div className="space-y-8">
          {/* Etapa 1: Selecionar o Produto */}
          <div className="step-1">
            <label className="block text-xl font-semibold text-gray-700 mb-2">1. Encontre o produto</label>
            <BuscadorProdutos 
              onProdutoSelecionado={(p) => setProduto(p as Produto | null)} 
              produtoInicial={produto}
            />
          </div>

          {produto && (
            <>
              {/* Etapa 2: Informar a quantidade */}
              <div className="step-2">
                <label htmlFor="quantidade" className="block text-xl font-semibold text-gray-700 mb-2">
                  2. Informe a quantidade
                </label>
                <input
                  id="quantidade"
                  type="number"
                  value={quantidade}
                  onChange={(e) => setQuantidade(Number(e.target.value))}
                  min="1"
                  className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              {/* Etapa 3: Adicionar Observações (Opcional) */}
              <div className="step-3">
                 <label htmlFor="observacoes" className="block text-xl font-semibold text-gray-700 mb-2">
                  3. Adicione uma nota (opcional)
                </label>
                <textarea
                  id="observacoes"
                  rows={3}
                  value={observacoes}
                  onChange={(e) => setObservacoes(e.target.value)}
                  placeholder="Ex: O cliente achou a cor diferente da foto."
                  className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              {/* Etapa 4: Escolher o Motivo */}
              <div className="step-4 text-center">
                <p className="text-xl font-semibold text-gray-700 mb-4">4. Qual o motivo da devolução?</p>
                <div className="flex flex-col sm:flex-row justify-center gap-6">
                  <button
                    onClick={() => handleRegistrarDevolucao('devolucao')}
                    disabled={loading}
                    className="flex-1 bg-blue-500 hover:bg-blue-600 text-white font-bold text-xl py-6 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    O cliente não gostou
                  </button>
                  <button
                    onClick={() => handleRegistrarDevolucao('defeito')}
                    disabled={loading}
                    className="flex-1 bg-red-500 hover:bg-red-600 text-white font-bold text-xl py-6 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
                  >
                    Produto com defeito
                  </button>
                </div>
                {loading && <p className="mt-4 text-lg text-gray-600 animate-pulse">Registrando...</p>}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default Devolucoes;
