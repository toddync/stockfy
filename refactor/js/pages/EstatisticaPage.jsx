import React from 'react';
import '../../css/estatistica.css';

const EstatisticaPage = () => {
  return (
    <div className="estatistica-container">
      <h1>Estatísticas</h1>
      <div className="estatistica-group-box">
        <label htmlFor="maskEdit1">Data Inicial:</label>
        <input type="text" id="maskEdit1" className="mask-edit" placeholder="DD/MM/AAAA" />

        <label htmlFor="maskEdit2">Data Final:</label>
        <input type="text" id="maskEdit2" className="mask-edit" placeholder="DD/MM/AAAA" />

        <div className="estatistica-buttons">
          <button className="estatistica-button">Botão 1</button>
          <button className="estatistica-button">Botão 2</button>
          <button className="estatistica-button">Botão 3</button>
          <button className="estatistica-button">Botão 4</button>
        </div>
      </div>
    </div>
  );
};

export default EstatisticaPage;