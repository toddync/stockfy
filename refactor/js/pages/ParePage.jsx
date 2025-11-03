import React, { useRef, useEffect } from 'react';

const ParePage = () => {
  const buttonRef = useRef(null);

  const handleClose = () => {
    alert('Ação de "Pare" executada. Fechando...');
    // Em uma aplicação real, aqui você chamaria uma função para fechar um modal ou navegar para outra página.
    console.log('Fechando o formulário de erro.');
  };

  const handleKeyDown = (event) => {
    if (event.key === 'Enter' || event.key === 'ArrowDown') {
      event.preventDefault(); // Previne o comportamento padrão do navegador
      // Em um cenário com múltiplos componentes focáveis, você implementaria a lógica de foco aqui.
      // Por simplicidade, para um único botão, o Enter/ArrowDown pode acionar o clique.
      buttonRef.current.click();
    } else if (event.key === 'ArrowUp') {
      event.preventDefault(); // Previne o comportamento padrão do navegador
      // Em um cenário com múltiplos componentes focáveis, você implementaria a lógica de foco aqui.
      // Para um único botão, ArrowUp pode não ter um efeito visível sem outros elementos.
      console.log('Seta para cima pressionada no botão.');
    }
  };

  useEffect(() => {
    if (buttonRef.current) {
      buttonRef.current.focus(); // Foca no botão ao carregar a página/componente
    }
  }, []);

  return (
    <div className="pare-container">
      <p className="pare-label">Ocorreu um erro inesperado.</p>
      <p className="pare-label">Por favor, tente novamente.</p>
      <p className="pare-label">Se o problema persistir, contate o suporte.</p>
      <button
        ref={buttonRef}
        className="pare-button"
        onClick={handleClose}
        onKeyDown={handleKeyDown}
      >
        OK
      </button>
    </div>
  );
};

export default ParePage;