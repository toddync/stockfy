import React from 'react';
import ReactDOM from 'react-dom/client';
import '../../css/parada.css';

function ParadaPage() {
    const handleClose = () => {
        // Em uma aplicação real, isso poderia fechar um modal,
        // redirecionar para outra página, ou enviar dados.
        // Por enquanto, apenas um log para simular a ação.
        console.log('Botão Fechar clicado. Ação de parada concluída.');
        window.close(); // Fecha a janela/aba do navegador
    };

    return (
        <div className="parada-container">
            <h1>Parada</h1>
            <p>Esta é uma tela de parada simples.</p>
            <p>Pressione o botão abaixo para continuar.</p>
            <button onClick={handleClose}>Fechar</button>
        </div>
    );
}

ReactDOM.createRoot(document.getElementById('root')).render(
    <React.StrictMode>
        <ParadaPage />
    </React.StrictMode>
);