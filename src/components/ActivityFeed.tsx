import React, { useState, useEffect } from 'react';
import { useSeniorMode } from '../contexts/SeniorModeContext';

interface Movimentacao {
    id: number;
    tipo_movimentacao: 'devolucao' | 'defeito' | 'ajuste' | 'venda' | 'compra';
    produto_descricao: string; // Assuming backend joins this
    quantidade: number;
    data_documento: string;
    observacoes?: string;
}

const ActivityFeed: React.FC = () => {
    const [activities, setActivities] = useState<Movimentacao[]>([]);
    const [loading, setLoading] = useState(true);
    const { isSeniorMode } = useSeniorMode();

    const fetchActivities = async () => {
        try {
            // Assuming a new endpoint or using existing one with sort/limit
            const response = await fetch('http://localhost:3000/api/movimentacoes-estoque?limit=10&sort=desc');
            if (response.ok) {
                const data = await response.json();
                // Adapt data if necessary, assuming backend returns array
                setActivities(Array.isArray(data) ? data : data.data || []);
            }
        } catch (error) {
            console.error("Failed to fetch activities", error);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchActivities();
        const interval = setInterval(fetchActivities, 30000); // Refresh every 30s
        return () => clearInterval(interval);
    }, []);

    if (loading) {
        return <div className="text-center p-4">Carregando atividades...</div>;
    }

    return (
        <div className={`bg-white shadow-md rounded-lg overflow-hidden ${isSeniorMode ? 'p-6' : 'p-4'}`}>
            <h2 className={`font-bold text-gray-800 mb-4 border-b pb-2 ${isSeniorMode ? 'text-3xl' : 'text-xl'}`}>
                Atividades Recentes
            </h2>
            <div className="space-y-4">
                {activities.length === 0 ? (
                    <p className="text-gray-500 text-center">Nenhuma atividade recente.</p>
                ) : (
                    activities.map((activity) => (
                        <div key={activity.id} className={`flex items-start border-b pb-3 last:border-0 ${isSeniorMode ? 'text-xl' : 'text-sm'}`}>
                            <div className={`mr-3 rounded-full p-2 ${activity.tipo_movimentacao === 'venda' ? 'bg-green-100 text-green-600' :
                                    activity.tipo_movimentacao === 'compra' ? 'bg-blue-100 text-blue-600' :
                                        'bg-red-100 text-red-600'
                                }`}>
                                {activity.tipo_movimentacao === 'venda' ? '💰' :
                                    activity.tipo_movimentacao === 'compra' ? '🛒' : '⚠️'}
                            </div>
                            <div>
                                <p className="font-semibold text-gray-800">
                                    {activity.tipo_movimentacao.toUpperCase()} - {activity.produto_descricao || `Produto #${activity.id}`}
                                </p>
                                <p className="text-gray-600">
                                    Quantidade: {activity.quantidade} | {new Date(activity.data_documento).toLocaleDateString()}
                                </p>
                                {activity.observacoes && (
                                    <p className="text-gray-500 italic text-xs mt-1">{activity.observacoes}</p>
                                )}
                            </div>
                        </div>
                    ))
                )}
            </div>
        </div>
    );
};

export default ActivityFeed;
