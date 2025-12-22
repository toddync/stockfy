import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Alerta from "../components/Alerta";
import Modal from "../components/Modal";
import BuscadorProdutos from "../components/BuscadorProdutos";

// Interfaces based on backend service expectations
interface CompraData {
    numero_pedido: string;
    tipo_pedido?: string;
    fornecedor_id: number;
    data_pedido: string;
    data_entrega?: string;
    data_nota?: string;
    tipo_nota?: string;
    numero_nota?: string;
    valor_total_pedido?: number;
    valor_total_nota?: number;
    desconto?: number;
    frete?: number;
    situacao?: string;
    parcelas?: string;
    observacoes?: string;
}

interface CompraItemData {
    produto_id: number;
    quantidade: number;
    preco_compra: number;
    desconto?: number;
    valor_total: number;
    tamanho?: string;
    cor?: string;
    // Additional frontend-only fields for display
    produto_descricao: string;
    produto_codigo: string;
}

interface Fornecedor {
    id: number;
    razao_social: string;
}

interface Produto {
    id: number;
    descricao: string;
    codigo: string;
    preco_venda: number; // Assuming preco_venda can be used as base for preco_compra
}

interface Compra {
    id: number;
    numero_pedido: string;
    fornecedor_razao_social: string; // Assuming the API returns the supplier's name
    data_pedido: string;
    valor_total_pedido: number;
    situacao: string;
}

const CompraForm: React.FC<{
    onSave: () => void;
    onCancel: () => void;
}> = ({ onSave, onCancel }) => {
    const [fornecedores, setFornecedores] = useState<Fornecedor[]>([]);
    const [compraData, setCompraData] = useState<CompraData>({
        numero_pedido: "",
        fornecedor_id: 0,
        data_pedido: new Date().toISOString().split("T")[0],
        situacao: "Pendente",
    });
    const [itensCompra, setItensCompra] = useState<CompraItemData[]>([]);
    const [produtoSelecionado, setProdutoSelecionado] =
        useState<Produto | null>(null);
    const [quantidadeItem, setQuantidadeItem] = useState(1);
    const [precoCompraItem, setPrecoCompraItem] = useState(0);
    const [descontoItem, setDescontoItem] = useState(0);

    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const [success, setSuccess] = useState<string | null>(null);

    useEffect(() => {
        const fetchFornecedores = async () => {
            setLoading(true);
            try {
                const response = await fetch(
                    "http://localhost:3000/api/fornecedores",
                );
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                const data: Fornecedor[] = await response.json();
                setFornecedores(data);
            } catch (e: unknown) {
                const message =
                    e instanceof Error
                        ? e.message
                        : "Ocorreu um erro desconhecido.";
                setError(`Falha ao carregar fornecedores: ${message}`);
                console.error("Erro ao carregar fornecedores:", e);
            } finally {
                setLoading(false);
            }
        };
        fetchFornecedores();
    }, []);

    useEffect(() => {
        if (produtoSelecionado) {
            setPrecoCompraItem(produtoSelecionado.preco_venda); // Use venda price as default buy price
        }
    }, [produtoSelecionado]);

    const handleAddProdutoToItens = () => {
        if (
            !produtoSelecionado ||
            quantidadeItem <= 0 ||
            precoCompraItem <= 0
        ) {
            setError(
                "Selecione um produto, quantidade e preço de compra válidos.",
            );
            return;
        }

        const valorTotalItem =
            quantidadeItem * precoCompraItem * (1 - descontoItem / 100);

        setItensCompra((prevItens) => [
            ...prevItens,
            {
                produto_id: produtoSelecionado.id,
                quantidade: quantidadeItem,
                preco_compra: precoCompraItem,
                desconto: descontoItem,
                valor_total: valorTotalItem,
                produto_descricao: produtoSelecionado.descricao,
                produto_codigo: produtoSelecionado.codigo,
            },
        ]);

        // Reset item fields
        setProdutoSelecionado(null);
        setQuantidadeItem(1);
        setPrecoCompraItem(0);
        setDescontoItem(0);
        setError(null);
    };

    const handleRemoveItem = (index: number) => {
        setItensCompra((prevItens) => prevItens.filter((_, i) => i !== index));
    };

    const calculateTotalCompra = React.useCallback(() => {
        const total = itensCompra.reduce(
            (sum, item) => sum + item.valor_total,
            0,
        );
        setCompraData((prevData) => ({
            ...prevData,
            valor_total_pedido: total,
            valor_total_nota: total,
        }));
        return total;
    }, [itensCompra]);

    useEffect(() => {
        calculateTotalCompra();
    }, [itensCompra]);

    const handleSubmitCompra = async (e: React.FormEvent) => {
        e.preventDefault();
        setError(null);
        setSuccess(null);
        setLoading(true);

        if (!compraData.fornecedor_id) {
            setError("Por favor, selecione um fornecedor.");
            setLoading(false);
            return;
        }
        if (itensCompra.length === 0) {
            setError("Adicione pelo menos um item à compra.");
            setLoading(false);
            return;
        }

        try {
            const response = await fetch("http://localhost:3000/api/compras", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ compraData, itensData: itensCompra }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(
                    errorData.message || "Falha ao criar a nova compra.",
                );
            }

            const result = await response.json();
            setSuccess(result.message || "Nova compra criada com sucesso!");

            onSave();
        } catch (e: unknown) {
            const message =
                e instanceof Error
                    ? e.message
                    : "Ocorreu um erro desconhecido.";
            setError(`Falha ao registrar compra: ${message}`);
            console.error("Erro ao registrar compra:", e);
        } finally {
            setLoading(false);
        }
    };

    if (loading && fornecedores.length === 0) {
        return <div className="text-center p-6">Carregando dados...</div>;
    }

    return (
        <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
            <h1 className="text-4xl font-bold text-gray-800 text-center mb-4">
                Nova Compra
            </h1>
            <p className="text-center text-gray-600 mb-8 text-lg">
                Gerencie suas compras de forma simples e eficiente.
            </p>

            {success && (
                <Alerta message={success} onClose={() => setSuccess(null)} />
            )}
            {error && <Alerta message={error} onClose={() => setError(null)} />}

            <form onSubmit={handleSubmitCompra} className="space-y-8">
                {/* Detalhes da Compra */}
                <div>
                    <label className="block text-xl font-semibold text-gray-700 mb-2">
                        1. Detalhes da Compra
                    </label>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <input
                            type="text"
                            id="numero_pedido"
                            placeholder="Número do Pedido"
                            value={compraData.numero_pedido}
                            onChange={(e) =>
                                setCompraData({
                                    ...compraData,
                                    numero_pedido: e.target.value,
                                })
                            }
                            required
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <select
                            id="fornecedor_id"
                            value={compraData.fornecedor_id}
                            onChange={(e) =>
                                setCompraData({
                                    ...compraData,
                                    fornecedor_id: parseInt(e.target.value),
                                })
                            }
                            required
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        >
                            <option value="0">Selecione um Fornecedor</option>
                            {fornecedores.map((fornecedor) => (
                                <option
                                    key={fornecedor.id}
                                    value={fornecedor.id}
                                >
                                    {fornecedor.razao_social}
                                </option>
                            ))}
                        </select>
                        <input
                            type="date"
                            id="data_pedido"
                            value={compraData.data_pedido}
                            onChange={(e) =>
                                setCompraData({
                                    ...compraData,
                                    data_pedido: e.target.value,
                                })
                            }
                            required
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                    </div>
                </div>

                {/* Adicionar Itens à Compra */}
                <div>
                    <label className="block text-xl font-semibold text-gray-700 mb-2">
                        2. Adicionar Itens
                    </label>
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-4">
                        <div className="lg:col-span-2">
                            <BuscadorProdutos
                                onProdutoSelecionado={setProdutoSelecionado}
                                produtoInicial={produtoSelecionado}
                            />
                        </div>
                        <input
                            type="number"
                            id="quantidadeItem"
                            placeholder="Quantidade"
                            value={quantidadeItem}
                            onChange={(e) =>
                                setQuantidadeItem(parseInt(e.target.value))
                            }
                            min="1"
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <input
                            type="number"
                            id="precoCompraItem"
                            placeholder="Preço de Compra"
                            value={precoCompraItem}
                            onChange={(e) =>
                                setPrecoCompraItem(parseFloat(e.target.value))
                            }
                            step="0.01"
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <input
                            type="number"
                            id="descontoItem"
                            placeholder="Desconto (%)"
                            value={descontoItem}
                            onChange={(e) =>
                                setDescontoItem(parseFloat(e.target.value))
                            }
                            min="0"
                            max="100"
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <div className="lg:col-span-4 flex justify-end">
                            <button
                                type="button"
                                onClick={handleAddProdutoToItens}
                                className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md"
                            >
                                Adicionar Item
                            </button>
                        </div>
                    </div>

                    {/* Lista de Itens Adicionados */}
                    {itensCompra.length > 0 && (
                        <div className="mt-6">
                            <h3 className="text-lg font-bold mb-2">
                                Itens da Compra:
                            </h3>
                            <div className="overflow-x-auto">
                                <table className="min-w-full bg-white border border-gray-200">
                                    <thead>
                                        <tr className="bg-gray-100">
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Produto
                                            </th>
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Qtd
                                            </th>
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Preço Compra
                                            </th>
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Desconto
                                            </th>
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Total
                                            </th>
                                            <th className="py-2 px-3 text-left text-sm font-semibold text-gray-600">
                                                Ações
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {itensCompra.map((item, index) => (
                                            <tr
                                                key={index}
                                                className="border-b"
                                            >
                                                <td className="py-2 px-3 text-sm text-gray-700">
                                                    {item.produto_descricao}
                                                </td>
                                                <td className="py-2 px-3 text-sm text-gray-700">
                                                    {item.quantidade}
                                                </td>
                                                <td className="py-2 px-3 text-sm text-gray-700">
                                                    R$ {item.preco_compra}
                                                </td>
                                                <td className="py-2 px-3 text-sm text-gray-700">
                                                    {item.desconto || 0}%
                                                </td>
                                                <td className="py-2 px-3 text-sm text-gray-700">
                                                    R$ {item.valor_total}
                                                </td>
                                                <td className="py-2 px-3 text-sm">
                                                    <button
                                                        type="button"
                                                        onClick={() =>
                                                            handleRemoveItem(
                                                                index,
                                                            )
                                                        }
                                                        className="text-red-600 hover:text-red-800"
                                                    >
                                                        Remover
                                                    </button>
                                                </td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                            <div className="text-right mt-4 text-lg font-bold text-gray-800">
                                Total da Compra: R${" "}
                                {compraData.valor_total_pedido || "0.00"}
                            </div>
                        </div>
                    )}
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
                        disabled={loading}
                    >
                        {loading ? "Salvando..." : "Finalizar Compra"}
                    </button>
                </div>
            </form>
        </div>
    );
};

const Compras: React.FC = () => {
    const navigate = useNavigate();
    const [compras, setCompras] = useState<Compra[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [success, setSuccess] = useState<string | null>(null);
    const [showModal, setShowModal] = useState(false);

    const fetchCompras = async () => {
        setLoading(true);
        try {
            const response = await fetch("http://localhost:3000/api/compras");
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data = await response.json();
            setCompras(data);
        } catch (e: unknown) {
            const message =
                e instanceof Error
                    ? e.message
                    : "Ocorreu um erro desconhecido.";
            setError(`Falha ao carregar compras: ${message}`);
            console.error("Erro ao carregar compras:", e);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchCompras();
    }, []);

    const handleSave = () => {
        setShowModal(false);
        fetchCompras();
        setSuccess("Compra salva com sucesso!");
    };

    if (loading) {
        return <div className="text-center p-6">Carregando compras...</div>;
    }

    return (
        <div className="page-container p-6 bg-white shadow-md rounded-lg">
            {success && (
                <Alerta message={success} onClose={() => setSuccess(null)} />
            )}
            {error && <Alerta message={error} onClose={() => setError(null)} />}

            <div className="page-header flex justify-between items-center mb-6">
                <h1 className="text-3xl font-bold text-gray-800">
                    Gerenciar Compras
                </h1>
                <button
                    onClick={() => setShowModal(true)}
                    className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
                >
                    + Nova Compra
                </button>
            </div>

            <Modal isOpen={showModal} onClose={() => setShowModal(false)}>
                <CompraForm
                    onSave={handleSave}
                    onCancel={() => setShowModal(false)}
                />
            </Modal>

            <div className="table-container overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200">
                    <thead>
                        <tr className="bg-gray-100 border-b">
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Nº Pedido
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Fornecedor
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Data
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Valor Total
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Situação
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Ações
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {compras.map((compra) => (
                            <tr
                                key={compra.id}
                                className="border-b hover:bg-gray-50"
                            >
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {compra.numero_pedido}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {compra.fornecedor_razao_social}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {new Date(
                                        compra.data_pedido,
                                    ).toLocaleDateString()}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    R$ {compra.valor_total_pedido}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {compra.situacao}
                                </td>
                                <td className="py-3 px-4 text-sm">
                                    <button
                                        onClick={() =>
                                            navigate(`/compras/${compra.id}`)
                                        }
                                        className="bg-gray-500 hover:bg-gray-600 text-white font-bold py-1 px-3 rounded-md transition-colors"
                                    >
                                        Detalhes
                                    </button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default Compras;
