import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import ManutpedPage from './pages/ManutpedPage';
import AjusteCompraPage from './pages/AjusteCompraPage'; // Importar AjusteCompraPage
import UtilitariosPage from './pages/UtilitariosPage'; // Importar UtilitariosPage
import ClientePage from './pages/ClientePage'; // Importar ClientePage
import AlertaPage from './pages/AlertaPage'; // Importar AlertaPage
import LivroPage from './pages/LivroPage'; // Importar LivroPage
import ResidosPage from './pages/ResidosPage'; // Importar ResidosPage

// Renderiza o componente principal na div#root
const root = ReactDOM.createRoot(document.createRoot(document.getElementById('root')));
root.render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path="/manutped" element={<ManutpedPage />} />
        <Route path="/ajuste-compras/:tipoPedido/:numPedido" element={<AjusteCompraPage />} />
        <Route path="/utilitarios" element={<UtilitariosPage />} /> {/* Nova rota para Utilitarios */}
        <Route path="/clientes" element={<ClientePage />} /> {/* Nova rota para Clientes */}
        <Route path="/alerta" element={<AlertaPage />} /> {/* Nova rota para Alerta */}
        <Route path="/livros" element={<LivroPage />} /> {/* Nova rota para Livros */}
        <Route path="/residos" element={<ResidosPage />} /> {/* Nova rota para Residos */}
        {/* Adicione outras rotas aqui, se houver */}
        <Route path="/" element={<ManutpedPage />} /> {/* Rota padrão */}
      </Routes>
    </Router>
  </React.StrictMode>
);