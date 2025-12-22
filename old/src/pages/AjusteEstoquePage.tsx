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

type TipoAjuste = 'entrada' | 'saida' | 'perda' | 'quebra';

const AjusteEstoquePage: React.FC = () => {
  const [produto, setProduto] = useState<Produto | null>(null);
  const [quantidade, setQuantidade] = useState(1);
  const [tipoAjuste, setTipoAjuste] = useState<TipoAjuste>('entrada');
  const [observacoes, setObservacoes] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  const resetForm = () => {
    setProduto(null);
    setQuantidade(1);
    setTipoAjuste('entrada');
    setObservacoes('');
  };

  const handleRegistrarAjuste = async () => {
    if (!produto) {
      setError('Por favor, selecione um produto antes de registrar o ajuste.');
      return;
    }
    if (quantidade <= 0) {
      setError('A quantidade deve ser maior que zero.');
      return;
    }

    setLoading(true);
    setError(null);
    setSuccess(null);

    try {
      const response = await fetch('http://localhost:3000/api/movimentacoes-estoque/ajuste', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          produto_id: produto.id,
          quantidade: quantidade,
          tipo_ajuste: tipoAjuste,
          observacoes: observacoes,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message || 'Falha ao registrar o ajuste de estoque.');
      }

      const result = await response.json();
      setSuccess(result.message || 'Ajuste de estoque registrado com sucesso!');
      resetForm();

    } catch (e: unknown) {
      const message = e instanceof Error ? e.message : 'Ocorreu um erro desconhecido.';
      setError(`Falha ao registrar ajuste: ${message}`);
      console.error('Erro ao registrar ajuste de estoque:', e);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="page-container p-8 bg-gray-50 min-h-screen flex items-center justify-center">
      <div className="max-w-2xl w-full bg-white shadow-2xl rounded-2xl p-10">
        <h1 className="text-4xl font-bold text-gray-800 text-center mb-4">Registrar Ajuste de Estoque</h1>
        <p className="text-center text-gray-600 mb-8 text-lg">
          Gerencie entradas, saídas, perdas ou quebras de produtos no estoque.
        </p>

        {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
        {error && <Alerta message={error} onClose={() => setError(null)} />}
        
        <div className="space-y-8">
          {/* Etapa 1: Selecionar o Produto */}
          <div>
            <label className="block text-xl font-semibold text-gray-700 mb-2">1. Encontre o produto</label>
            <BuscadorProdutos 
              onProdutoSelecionado={(p) => setProduto(p as Produto | null)} 
              produtoInicial={produto}
            />
          </div>

          {produto && (
            <>
              {/* Etapa 2: Informar a quantidade */}
              <div>
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

              {/* Etapa 3: Selecionar Tipo de Ajuste */}
              <div>
                <label htmlFor="tipoAjuste" className="block text-xl font-semibold text-gray-700 mb-2">
                  3. Selecione o tipo de ajuste
                </label>
                <select
                  id="tipoAjuste"
                  value={tipoAjuste}
                  onChange={(e) => setTipoAjuste(e.target.value as TipoAjuste)}
                  className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                >
                  <option value="entrada">Entrada (Aumento)</option>
                  <option value="saida">Saída (Diminuição)</option>
                  <option value="perda">Perda</option>
                  <option value="quebra">Quebra</option>
                </select>
              </div>

              {/* Etapa 4: Adicionar Observações (Opcional) */}
              <div>
                 <label htmlFor="observacoes" className="block text-xl font-semibold text-gray-700 mb-2">
                  4. Adicione uma nota (opcional)
                </label>
                <textarea
                  id="observacoes"
                  rows={3}
                  value={observacoes}
                  onChange={(e) => setObservacoes(e.target.value)}
                  placeholder="Ex: Ajuste devido a inventário anual."
                  className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                />
              </div>

              {/* Etapa 5: Confirmar Ajuste */}
              <div className="text-center">
                <button
                  onClick={handleRegistrarAjuste}
                  disabled={loading}
                  className="w-full bg-green-600 hover:bg-green-700 text-white font-bold text-xl py-4 px-8 rounded-xl shadow-lg transform hover:scale-105 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {loading ? 'Registrando...' : 'Registrar Ajuste'}
                </button>
                {loading && <p className="mt-4 text-lg text-gray-600 animate-pulse">Processando...</p>}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default AjusteEstoquePage;