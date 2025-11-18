import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Alerta from '../components/Alerta'; // Import Alerta

const MovimentacoesEstoque: React.FC = () => {
  const navigate = useNavigate();
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  // This page is now deprecated in favor of DevolucoesPage and future dedicated stock management
  // Redirect to Devolucoes page
  useEffect(() => {
    setSuccess("Esta página de gerenciamento de estoque está sendo substituída. Redirecionando para 'Devoluções'...");
    const timer = setTimeout(() => {
      navigate('/devolucoes');
    }, 3000); // Redirect after 3 seconds
    return () => clearTimeout(timer);
  }, [navigate]);

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="text-center p-10">
        <h1 className="text-3xl font-bold text-gray-800 mb-4">Página de Movimentações de Estoque Desativada</h1>
        <p className="text-gray-600 mb-6">
          A funcionalidade principal de movimentações de estoque foi simplificada e movida para a página de "Devoluções". 
          Outras funcionalidades de ajuste de estoque serão implementadas em uma nova interface dedicada.
        </p>
        <button 
          onClick={() => navigate('/devolucoes')}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors mr-2"
        >
          Ir para Devoluções
        </button>
        {/* Potentially add a button for a future 'New Stock Adjustments' page */}
      </div>
    </div>
  );
};

export default MovimentacoesEstoque;
