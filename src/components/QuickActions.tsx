import React from 'react';
import { Link } from 'react-router-dom';

interface QuickAction {
  name: string;
  path: string;
  icon: string;
  color: string;
}

const QuickActions: React.FC = () => {
  const actions: QuickAction[] = [
    { name: 'Nova Venda', path: '/pedidos/novo', icon: '➕', color: 'blue' },
    { name: 'Ajustar Estoque', path: '/movimentacoes-estoque/ajuste', icon: '📦', color: 'green' },
    { name: 'Novo Produto', path: '/produtos/novo', icon: '👕', color: 'purple' },
    { name: 'Novo Cliente', path: '/clientes/novo', icon: '👤', color: 'orange' },
  ];

  return (
    <div className="bg-white p-6 rounded-lg shadow-md">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Ações Rápidas</h2>
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        {actions.map((action, index) => (
          <Link key={index} to={action.path} className="block">
            <div className={`bg-white border-t-4 border-${action.color}-500 rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 p-4 flex flex-col items-center justify-center text-center h-32`}>
              <div className={`text-4xl mb-2 text-${action.color}-600`}>{action.icon}</div>
              <h3 className="text-md font-semibold text-gray-700">{action.name}</h3>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default QuickActions;
