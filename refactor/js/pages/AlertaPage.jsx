import React from 'react';
import '../../css/alerta.css';

const AlertaPage = () => {
  const handleButtonClick = () => {
    // Em um ambiente React, o "Modalresult:=-1" geralmente significa fechar um modal ou navegar de volta.
    // Para simplificar, vamos apenas logar e, em uma aplicação real, isso seria substituído por
    // uma função de navegação ou de fechamento de modal passada via props.
    console.log('Botão de alerta clicado. Fechando alerta.');
    // Exemplo de como você poderia fechar um modal se este componente fosse um modal:
    // if (window.history.length > 1) {
    //   window.history.back();
    // } else {
    //   window.location.href = '/'; // Ou para uma rota padrão
    // }
  };

  return (
    <div className="alerta-container">
      <div className="alerta-box">
        <label className="alerta-label">Label 1</label>
        <label className="alerta-label">Label 2</label>
        <label className="alerta-label">Label 3</label>
        <label className="alerta-label">Label 4</label>
        <label className="alerta-label">Label 5</label>
        <button className="alerta-button" onClick={handleButtonClick}>
          OK
        </button>
      </div>
    </div>
  );
};

export default AlertaPage;