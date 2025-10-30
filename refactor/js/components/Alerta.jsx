import React from 'react';
import '../../css/alerta.css';

const Alerta = ({ message, onClose }) => {
  return (
    <div className="alerta-container">
      <div className="alerta-box">
        <h2>Alerta</h2>
        <p>{message}</p>
        <button onClick={onClose}>Fechar</button>
      </div>
    </div>
  );
};

export default Alerta;