import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Alerta from '../components/Alerta'; // Import Alerta

const Compras: React.FC = () => {
  const navigate = useNavigate();
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  // This page is now deprecated in favor of NovaCompraPage
  // Redirect to Nova Compra page
  useEffect(() => {
    setSuccess("Esta página foi substituída. Redirecionando para 'Nova Compra'...");
    const timer = setTimeout(() => {
      navigate('/compras/nova');
    }, 3000); // Redirect after 3 seconds
    return () => clearTimeout(timer);
  }, [navigate]);

  return (
    <div className="page-container p-6 bg-white shadow-md rounded-lg">
      
      {success && <Alerta message={success} onClose={() => setSuccess(null)} />}
      {error && <Alerta message={error} onClose={() => setError(null)} />}

      <div className="text-center p-10">
        <h1 className="text-3xl font-bold text-gray-800 mb-4">Página de Compras Desativada</h1>
        <p className="text-gray-600 mb-6">
          A funcionalidade de gerenciamento de compras foi unificada. Por favor, utilize a nova página de "Nova Compra".
        </p>
        <button 
          onClick={() => navigate('/compras/nova')}
          className="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded-md transition-colors"
        >
          Ir para Nova Compra
        </button>
      </div>
    </div>
  );
};

export default Compras;
