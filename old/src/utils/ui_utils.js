// Funções utilitárias para a interface do usuário

/**
 * Formata uma string de data para o formato DD/MM/AAAA.
 * @param {string} dateString A string de data a ser formatada (ex: YYYY-MM-DD).
 * @returns {string} A data formatada (DD/MM/AAAA) ou string vazia se inválida.
 */
export function formatarData(dateString) {
    if (!dateString) return '';
    const date = new Date(dateString);
    if (isNaN(date.getTime())) return ''; // Verifica se a data é válida
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}

/**
 * Valida se uma string é um CPF válido.
 * @param {string} cpf A string contendo o CPF.
 * @returns {boolean} True se o CPF for válido, false caso contrário.
 */
export function validarCPF(cpf) {
    cpf = cpf.replace(/[^\d]+/g, '');
    if (cpf.length !== 11 || !!cpf.match(/(\d)\1{10}/)) return false;
    let sum = 0;
    let remainder;
    for (let i = 1; i <= 9; i++) sum = sum + parseInt(cpf.substring(i - 1, i)) * (11 - i);
    remainder = (sum * 10) % 11;
    if ((remainder === 10) || (remainder === 11)) remainder = 0;
    if (remainder !== parseInt(cpf.substring(9, 10))) return false;
    sum = 0;
    for (let i = 1; i <= 10; i++) sum = sum + parseInt(cpf.substring(i - 1, i)) * (12 - i);
    remainder = (sum * 10) % 11;
    if ((remainder === 10) || (remainder === 11)) remainder = 0;
    if (remainder !== parseInt(cpf.substring(10, 11))) return false;
    return true;
}

/**
 * Formata um número para moeda brasileira (R$ X.XXX,XX).
 * @param {number} value O valor numérico a ser formatado.
 * @returns {string} O valor formatado como moeda.
 */
export function formatarMoeda(value) {
    return new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    }).format(value);
}

// Adicione outras funções utilitárias de UI aqui conforme necessário