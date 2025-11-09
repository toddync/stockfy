import React from 'react';

interface AlertaProps {
  message: string;
  onClose: () => void;
}

const Alerta: React.FC<AlertaProps> = ({ message, onClose }) => {
  return (
    <div className="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white p-6 rounded-lg shadow-xl max-w-sm w-full text-center">
        <h2 className="text-2xl font-bold mb-4 text-gray-800">Alerta</h2>
        <p className="text-gray-700 mb-6">{message}</p>
        <button
          onClick={onClose}
          className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition-colors duration-200"
        >
          Fechar
        </button>
      </div>
    </div>
  );
};

export default Alerta;
