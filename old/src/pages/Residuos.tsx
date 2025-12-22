import React, { useState, useEffect } from "react";
import Modal from "../components/Modal";
import Alerta from "../components/Alerta";

interface Residuo {
    id?: number; // ID is optional for new entries
    data_movimento: string; // DATE type
    item?: string;
    numero_documento?: string;
    valor_pago?: number;
}

const Residuos: React.FC = () => {
    const [residuos, setResiduos] = useState<Residuo[]>([]);
    const [mostrarForm, setMostrarForm] = useState(false);
    const [residuoEditando, setResiduoEditando] = useState<Residuo | null>(
        null,
    );
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);
    const [success, setSuccess] = useState<string | null>(null); // Add success state

    useEffect(() => {
        carregarResiduos();
    }, []);

    const carregarResiduos = async () => {
        setLoading(true);
        setError(null);
        // Do not reset success here so message can persist after reload
        try {
            const response = await fetch("http://localhost:3000/api/residuos");
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            const data: Residuo[] = await response.json();
            setResiduos(data);
        } catch (e: unknown) {
            // Changed from any to unknown
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao carregar resíduos: ${message}`);
            console.error("Erro ao carregar resíduos:", e);
        } finally {
            setLoading(false);
        }
    };

    const salvarResiduo = async (residuo: Residuo) => {
        setError(null);
        setSuccess(null); // Reset success message
        try {
            let response;
            if (residuo.id) {
                // Update existing residuo
                response = await fetch(
                    `http://localhost:3000/api/residuos/${residuo.id}`,
                    {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify(residuo),
                    },
                );
            } else {
                // Create new residuo
                response = await fetch("http://localhost:3000/api/residuos", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify(residuo),
                });
            }

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            await carregarResiduos(); // Reload residuos after save
            setMostrarForm(false);
            setResiduoEditando(null);
            setSuccess(
                `Resíduo ${residuo.id ? "atualizado" : "criado"} com sucesso!`,
            ); // Set success message
        } catch (e: unknown) {
            // Changed from any to unknown
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao salvar resíduo: ${message}`);
            console.error("Erro ao salvar resíduo:", e);
        }
    };

    const deletarResiduo = async (id: number) => {
        if (!window.confirm("Confirmar exclusão?")) {
            return;
        }
        setError(null);
        setSuccess(null); // Reset success message
        try {
            const response = await fetch(
                `http://localhost:3000/api/residuos/${id}`,
                {
                    method: "DELETE",
                },
            );

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            await carregarResiduos(); // Reload residuos after delete
            setSuccess("Resíduo excluído com sucesso!"); // Set success message
        } catch (e: unknown) {
            // Changed from any to unknown
            let message = "Erro desconhecido";
            if (e instanceof Error) {
                message = e.message;
            }
            setError(`Falha ao deletar resíduo: ${message}`);
            console.error("Erro ao deletar resíduo:", e);
        }
    };

    if (loading) {
        return <div className="text-center p-6">Carregando resíduos...</div>;
    }

    // Error display from the initial load should still show.
    // The Alerta component will handle subsequent errors from save/delete.

    return (
        <div className="page-container p-6 bg-white shadow-md rounded-lg">
            {/* Display Alerta for success and error messages */}
            {success && (
                <Alerta message={success} onClose={() => setSuccess(null)} />
            )}
            {error && <Alerta message={error} onClose={() => setError(null)} />}

            <div className="page-header flex justify-between items-center mb-6">
                <h1 className="text-3xl font-bold text-gray-800">
                    Gerenciar Resíduos
                </h1>
                <button
                    onClick={() => {
                        setResiduoEditando(null);
                        setMostrarForm(true);
                    }}
                    className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
                >
                    + Novo Resíduo
                </button>
            </div>

            <Modal
                isOpen={mostrarForm}
                onClose={() => {
                    setMostrarForm(false);
                    setResiduoEditando(null);
                }}
            >
                <ResiduoForm
                    residuo={residuoEditando}
                    onSave={salvarResiduo}
                    onCancel={() => {
                        setMostrarForm(false);
                        setResiduoEditando(null);
                    }}
                />
            </Modal>

            <div className="table-container overflow-x-auto">
                <table className="min-w-full bg-white border border-gray-200">
                    <thead>
                        <tr className="bg-gray-100 border-b">
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Data Movimento
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Item
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Nº Documento
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Valor Pago
                            </th>
                            <th className="py-3 px-4 text-left text-sm font-semibold text-gray-600">
                                Ações
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {residuos.map((residuo) => (
                            <tr
                                key={residuo.id}
                                className="border-b hover:bg-gray-50"
                            >
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {new Date(
                                        residuo.data_movimento,
                                    ).toLocaleDateString()}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {residuo.item}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {residuo.numero_documento}
                                </td>
                                <td className="py-3 px-4 text-sm text-gray-700">
                                    {residuo.valor_pago}
                                </td>
                                <td className="py-3 px-4 text-sm">
                                    <button
                                        onClick={() => {
                                            setResiduoEditando(residuo);
                                            setMostrarForm(true);
                                        }}
                                        className="bg-yellow-500 hover:bg-yellow-600 text-white font-bold py-1 px-3 rounded-md mr-2 transition-colors"
                                    >
                                        Editar
                                    </button>
                                    <button
                                        onClick={() =>
                                            deletarResiduo(residuo.id!)
                                        }
                                        className="bg-red-500 hover:bg-red-600 text-white font-bold py-1 px-3 rounded-md transition-colors"
                                    >
                                        Excluir
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

const ResiduoForm: React.FC<{
    residuo: Residuo | null;
    onSave: (residuo: Residuo) => void;
    onCancel: () => void;
}> = ({ residuo, onSave, onCancel }) => {
    const [formData, setFormData] = useState<Residuo>(
        residuo || {
            data_movimento: new Date().toISOString().split("T")[0],
            item: "",
            numero_documento: "",
            valor_pago: 0,
        },
    );

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        onSave(formData);
    };

    return (
        <div className="max-w-4xl w-full bg-white shadow-2xl rounded-2xl p-10">
            <h2 className="text-4xl font-bold text-gray-800 text-center mb-4">
                {residuo ? "Editar" : "Novo"} Resíduo
            </h2>
            <p className="text-center text-gray-600 mb-8 text-lg">
                Preencha os dados para{" "}
                {residuo ? "atualizar o" : "criar um novo"} resíduo.
            </p>
            <form onSubmit={handleSubmit} className="space-y-8">
                <div>
                    <label className="block text-xl font-semibold text-gray-700 mb-2">
                        1. Informações do Resíduo
                    </label>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <input
                            type="date"
                            value={formData.data_movimento}
                            onChange={(e) =>
                                setFormData({
                                    ...formData,
                                    data_movimento: e.target.value,
                                })
                            }
                            required
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <input
                            type="text"
                            placeholder="Item"
                            value={formData.item || ""}
                            onChange={(e) =>
                                setFormData({
                                    ...formData,
                                    item: e.target.value,
                                })
                            }
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                    </div>
                </div>
                <div>
                    <label className="block text-xl font-semibold text-gray-700 mb-2">
                        2. Documento e Valor
                    </label>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <input
                            type="text"
                            placeholder="Número do Documento"
                            value={formData.numero_documento || ""}
                            onChange={(e) =>
                                setFormData({
                                    ...formData,
                                    numero_documento: e.target.value,
                                })
                            }
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <input
                            type="number"
                            placeholder="Valor Pago"
                            value={formData.valor_pago}
                            onChange={(e) =>
                                setFormData({
                                    ...formData,
                                    valor_pago: parseFloat(e.target.value),
                                })
                            }
                            step="0.01"
                            className="shadow-lg appearance-none border-2 border-gray-200 rounded-lg w-full py-3 px-4 text-gray-700 text-lg leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
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
                        Salvar
                    </button>
                </div>
            </form>
        </div>
    );
};

export default Residuos;
