import React, { useState, useEffect } from "react";

interface CalculadoraMargemProps {
    precoCusto: number;
    precoVenda: number;
    onMargemChange?: (margem: number) => void;
}

const CalculadoraMargem: React.FC<CalculadoraMargemProps> = ({
    precoCusto,
    precoVenda,
    onMargemChange,
}) => {
    const [custo, setCusto] = useState(precoCusto);
    const [venda, setVenda] = useState(precoVenda);
    const [margemLucro, setMargemLucro] = useState(0);

    useEffect(() => {
        setCusto(precoCusto);
    }, [precoCusto]);

    useEffect(() => {
        setVenda(precoVenda);
    }, [precoVenda]);

    useEffect(() => {
        if (venda > 0) {
            const margem = ((venda - custo) / venda) * 100;
            setMargemLucro(margem);
            if (onMargemChange) {
                onMargemChange(margem);
            }
        } else {
            setMargemLucro(0);
            if (onMargemChange) {
                onMargemChange(0);
            }
        }
    }, [custo, venda, onMargemChange]);

    return (
        <div className="bg-white p-4 rounded-lg shadow-sm border border-gray-200">
            <h3 className="text-lg font-semibold text-gray-700 mb-2">
                Calculadora de Margem
            </h3>
            <div className="grid grid-cols-2 gap-3 text-sm">
                <div>
                    <label htmlFor="custo" className="block text-gray-600 mb-1">
                        Preço de Custo:
                    </label>
                    <input
                        type="number"
                        id="custo"
                        value={custo}
                        onChange={(e) => setCusto(parseFloat(e.target.value))}
                        step="0.01"
                        className="shadow-sm appearance-none border rounded w-full py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    />
                </div>
                <div>
                    <label htmlFor="venda" className="block text-gray-600 mb-1">
                        Preço de Venda:
                    </label>
                    <input
                        type="number"
                        id="venda"
                        value={venda}
                        onChange={(e) => setVenda(parseFloat(e.target.value))}
                        step="0.01"
                        className="shadow-sm appearance-none border rounded w-full py-1 px-2 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                    />
                </div>
                <div className="col-span-2 mt-2">
                    <p className="text-gray-700 font-medium">
                        Margem de Lucro:
                        <span
                            className={`ml-2 font-bold ${margemLucro > 0 ? "text-green-600" : "text-red-600"}`}
                        >
                            {margemLucro}%
                        </span>
                    </p>
                </div>
            </div>
        </div>
    );
};

export default CalculadoraMargem;
