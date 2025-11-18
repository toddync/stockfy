import React, { useState } from 'react';



const SimuladorDescontos: React.FC = () => {
  const [originalPrice, setOriginalPrice] = useState<number>(100);
  const [discountPercentage, setDiscountPercentage] = useState<number>(10);
  const [costPrice, setCostPrice] = useState<number>(50);
  const [simulatedPrice, setSimulatedPrice] = useState<number>(0);
  const [simulatedProfit, setSimulatedProfit] = useState<number>(0);
  const [simulatedMargin, setSimulatedMargin] = useState<number>(0);

  const calculateSimulation = React.useCallback(() => {
    const discountAmount = originalPrice * (discountPercentage / 100);
    const newPrice = originalPrice - discountAmount;
    const profit = newPrice - costPrice;
    const margin = (profit / newPrice) * 100;

    setSimulatedPrice(newPrice);
    setSimulatedProfit(profit);
    setSimulatedMargin(margin);
  }, [originalPrice, discountPercentage, costPrice]);

  React.useEffect(() => { // eslint-disable-line react-hooks/exhaustive-deps
    calculateSimulation();
  }, [originalPrice, discountPercentage, costPrice]);

  return (
    <div className="p-6 bg-white shadow-md rounded-lg">
      <h2 className="text-2xl font-bold text-gray-800 mb-4">Simulador de Descontos</h2>
      <p className="text-gray-600 mb-6">
        Calcule o impacto de diferentes estratégias de desconto no preço, lucro e margem.
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
        <div>
          <label htmlFor="originalPrice" className="block text-gray-700 text-sm font-bold mb-2">
            Preço Original (R$)
          </label>
          <input
            type="number"
            id="originalPrice"
            value={originalPrice}
            onChange={(e) => setOriginalPrice(parseFloat(e.target.value))}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            min="0"
          />
        </div>
        <div>
          <label htmlFor="discountPercentage" className="block text-gray-700 text-sm font-bold mb-2">
            Percentual de Desconto (%)
          </label>
          <input
            type="number"
            id="discountPercentage"
            value={discountPercentage}
            onChange={(e) => setDiscountPercentage(parseFloat(e.target.value))}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            min="0"
            max="100"
          />
        </div>
        <div>
          <label htmlFor="costPrice" className="block text-gray-700 text-sm font-bold mb-2">
            Preço de Custo (R$)
          </label>
          <input
            type="number"
            id="costPrice"
            value={costPrice}
            onChange={(e) => setCostPrice(parseFloat(e.target.value))}
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            min="0"
          />
        </div>
      </div>

      <div className="bg-gray-100 p-4 rounded-md">
        <h3 className="text-xl font-semibold text-gray-800 mb-4">Resultados da Simulação</h3>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div className="flex flex-col">
            <span className="text-gray-600 text-sm">Preço Simulado:</span>
            <span className="text-lg font-bold text-blue-600">R$ {simulatedPrice.toFixed(2)}</span>
          </div>
          <div className="flex flex-col">
            <span className="text-gray-600 text-sm">Lucro Simulado:</span>
            <span className="text-lg font-bold text-green-600">R$ {simulatedProfit.toFixed(2)}</span>
          </div>
          <div className="flex flex-col">
            <span className="text-gray-600 text-sm">Margem Simulado:</span>
            <span className="text-lg font-bold text-purple-600">{simulatedMargin.toFixed(2)}%</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SimuladorDescontos;
