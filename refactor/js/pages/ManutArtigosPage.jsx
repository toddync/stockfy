import React, { useState, useEffect } from 'react';
import '../../css/manut-artigos.css'; // Importa o CSS específico para esta página

const ManutArtigosPage = () => {
    const [artigos, setArtigos] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchBy, setSearchBy] = useState('codigo'); // 'codigo' ou 'descricao'
    const [selectedArtigo, setSelectedArtigo] = useState(null);
    const [message, setMessage] = useState(''); // Para mensagens de feedback ao usuário

    const API_BASE_URL = 'http://localhost/refactor/php/api/artigos.php'; // Ajuste conforme sua configuração

    useEffect(() => {
        fetchArtigos();
    }, []);

    const fetchArtigos = async (search = '', by = 'codigo') => {
        let url = `${API_BASE_URL}?permission_code=Col022`; // Simula permissão para listar
        if (search) {
            url += `&search=${search}&search_by=${by}`;
        }

        try {
            const response = await fetch(url);
            const data = await response.json();
            if (response.ok) {
                setArtigos(data);
                setMessage('');
            } else {
                setArtigos([]);
                setMessage(data.message || 'Erro ao buscar artigos.');
            }
        } catch (error) {
            console.error("Erro ao buscar artigos:", error);
            setMessage('Erro de conexão com a API.');
        }
    };

    const handleSearch = () => {
        fetchArtigos(searchTerm, searchBy);
    };

    const handleClearSearch = () => {
        setSearchTerm('');
        setSearchBy('codigo');
        fetchArtigos();
    };

    const handleRowClick = (artigo) => {
        setSelectedArtigo(artigo);
        // Aqui você pode adicionar lógica para exibir detalhes do artigo selecionado
        // ou preencher um formulário de edição/consulta.
    };

    // Funções para os botões de operação (Implantar, Alterar, Consultar, Excluir, etc.)
    // Por enquanto, apenas logs no console e mensagens de simulação.
    // Em uma implementação real, estes abririam modais ou navegariam para outras páginas.

    const handleImplantar = async () => {
        // Simula a verificação de permissão
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col022`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Funcionalidade "Implantar" (Adicionar Novo Artigo) - Abrir modal/página de criação.');
            // Exemplo de como você chamaria uma API para criar um artigo
            /*
            const newArtigo = { codigo: '0005', descricao: 'Novo Artigo', custo: 10.00, venda: 20.00, estoque: 100, previp: 0 };
            const response = await fetch(API_BASE_URL + '?permission_code=Col022', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(newArtigo)
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                fetchArtigos();
            } else {
                setMessage(data.message || 'Erro ao criar artigo.');
            }
            */
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleAlterar = async () => {
        if (!selectedArtigo) {
            setMessage('Selecione um artigo para alterar.');
            return;
        }
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col023`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage(`Funcionalidade "Alterar" (Editar Artigo ${selectedArtigo.codigo}) - Abrir modal/página de edição.`);
            // Exemplo de como você chamaria uma API para atualizar um artigo
            /*
            const updatedArtigo = { ...selectedArtigo, descricao: 'Artigo Alterado' };
            const response = await fetch(API_BASE_URL + '?permission_code=Col023', {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(updatedArtigo)
            });
            const data = await response.json();
            if (response.ok) {
                setMessage(data.message);
                fetchArtigos();
            } else {
                setMessage(data.message || 'Erro ao atualizar artigo.');
            }
            */
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleConsultar = async () => {
        if (!selectedArtigo) {
            setMessage('Selecione um artigo para consultar.');
            return;
        }
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col024`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage(`Funcionalidade "Consultar" (Visualizar Artigo ${selectedArtigo.codigo}) - Abrir modal/página de consulta.`);
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleExcluir = async () => {
        if (!selectedArtigo) {
            setMessage('Selecione um artigo para excluir.');
            return;
        }
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col025`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            if (window.confirm(`Tem certeza que deseja excluir o artigo ${selectedArtigo.codigo} - ${selectedArtigo.descricao}?`)) {
                const response = await fetch(`${API_BASE_URL}?id=${selectedArtigo.id}&permission_code=Col025`, {
                    method: 'DELETE'
                });
                const data = await response.json();
                if (response.ok) {
                    setMessage(data.message);
                    fetchArtigos();
                    setSelectedArtigo(null);
                } else {
                    setMessage(data.message || 'Erro ao excluir artigo.');
                }
            }
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleContagem = async () => {
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col026`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Funcionalidade "Contagem" - Abrir página/modal de contagem de estoque.');
            // Navegar para a página de contagem, por exemplo:
            // window.location.href = '/refactor/pages/ajuste-contagem.html';
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!!');
        }
    };

    const handleCadAlfa = async () => {
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col027`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Gerando relatório "Cadastro Alfabético"...');
            try {
                const response = await fetch(`${API_BASE_URL}?report_type=cad_alfa&permission_code=Col027`);
                const data = await response.json();
                if (response.ok) {
                    console.log("Dados para relatório CAD.ALFA:", data);
                    setMessage('Relatório "Cadastro Alfabético" gerado no console. Em uma aplicação real, seria um PDF/CSV.');
                    // Em uma aplicação real, você processaria 'data' para gerar um PDF ou CSV
                    // window.open('/path/to/generated_report.pdf', '_blank');
                } else {
                    setMessage(data.message || 'Erro ao gerar relatório.');
                }
            } catch (error) {
                console.error("Erro ao gerar relatório CAD.ALFA:", error);
                setMessage('Erro de conexão ao gerar relatório.');
            }
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleEtiqCodBar = async () => {
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col028`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Funcionalidade "Etiquetas Código de Barras" - Abrir página/modal de emissão.');
            // Navegar para a página de etiquetas, por exemplo:
            // window.location.href = '/refactor/pages/etiq-cod-bar.html';
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleCadastrao = async () => {
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col029`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Gerando relatório "Cadastrão"...');
            try {
                const response = await fetch(`${API_BASE_URL}?report_type=cadastrao&permission_code=Col029`);
                const data = await response.json();
                if (response.ok) {
                    console.log("Dados para relatório CADASTRAO:", data);
                    setMessage('Relatório "Cadastrão" gerado no console. Em uma aplicação real, seria um PDF/CSV.');
                    // Em uma aplicação real, você processaria 'data' para gerar um PDF ou CSV
                    // window.open('/path/to/generated_report.pdf', '_blank');
                } else {
                    setMessage(data.message || 'Erro ao gerar relatório.');
                }
            } catch (error) {
                console.error("Erro ao gerar relatório CADASTRAO:", error);
                setMessage('Erro de conexão ao gerar relatório.');
            }
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    const handleMovimentos = async () => {
        const permissionCheck = await fetch(`${API_BASE_URL}?permission_code=Col030`);
        const permissionData = await permissionCheck.json();
        if (permissionCheck.ok) {
            setMessage('Funcionalidade "Movimentos" - Abrir página/modal de relatório de movimentos.');
            // Navegar para a página de movimentos, por exemplo:
            // window.location.href = '/refactor/pages/rel-movimentos.html';
        } else {
            setMessage(permissionData.message || 'Não Autorizado !!!');
        }
    };

    return (
        <div className="manut-artigos-container">
            <div className="panel-top">
                <label>PESQUISAR</label>
                <select value={searchBy} onChange={(e) => setSearchBy(e.target.value)}>
                    <option value="codigo">CÓDIGO</option>
                    <option value="descricao">DESCRIÇÃO</option>
                </select>
                <label>CONTEÚDO</label>
                <input
                    type="text"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    onKeyPress={(e) => { if (e.key === 'Enter') handleSearch(); }}
                />
                <button onClick={handleSearch}>Buscar</button>
                <button onClick={handleClearSearch}>Limpar</button>
            </div>

            {message && <div className="message">{message}</div>}

            <div className="main-content">
                <div className="sidebar-buttons">
                    <div className="button-group">
                        <label>OPERAÇÕES</label>
                        <button onClick={handleImplantar}>IMPLANTAR</button>
                        <button onClick={handleAlterar}>ALTERAR</button>
                        <button onClick={handleConsultar}>CONSULTAR</button>
                        <button onClick={handleExcluir}>EXCLUIR</button>
                    </div>
                    <div className="button-group">
                        <label>ESTOQUE</label>
                        <button onClick={handleContagem}>CONTAGEM</button>
                    </div>
                    <div className="button-group">
                        <label>EMISSÕES</label>
                        <button onClick={handleCadAlfa}>CAD.ALFA</button>
                        <button onClick={handleEtiqCodBar}>ETIQ.COD.BAR.</button>
                        <button onClick={handleCadastrao}>CADASTRAO</button>
                    </div>
                    <div className="button-group">
                        <label>MAPAS</label>
                        <button onClick={handleMovimentos}>MOVIMENTOS</button>
                    </div>
                </div>

                <div className="dbgrid-container">
                    <table className="dbgrid">
                        <thead>
                            <tr>
                                <th>CÓDIGO</th>
                                <th>DESCRIÇÃO</th>
                                <th>CUSTO</th>
                                <th>VENDA</th>
                                <th>ESTOQUE</th>
                            </tr>
                        </thead>
                        <tbody>
                            {artigos.length > 0 ? (
                                artigos.map((artigo) => (
                                    <tr
                                        key={artigo.id}
                                        className={selectedArtigo && selectedArtigo.id === artigo.id ? 'selected-row' : ''}
                                        onClick={() => handleRowClick(artigo)}
                                    >
                                        <td>{artigo.codigo}</td>
                                        <td>{artigo.descricao}</td>
                                        <td>{parseFloat(artigo.custo).toFixed(2)}</td>
                                        <td>{parseFloat(artigo.venda).toFixed(2)}</td>
                                        <td>{artigo.estoque}</td>
                                    </tr>
                                ))
                            ) : (
                                <tr>
                                    <td colSpan="5">Nenhum artigo encontrado.</td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
};

export default ManutArtigosPage;