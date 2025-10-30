import React, { useState, useEffect, useRef } from 'react';
import '../../css/etiqueta-barras.css';

function EtiqbarPage() {
    const [codigoArtigo, setCodigoArtigo] = useState('');
    const [descricaoArtigo, setDescricaoArtigo] = useState('');
    const [nomeCliente, setNomeCliente] = useState('');
    const [sobrenomeCliente, setSobrenomeCliente] = useState('');
    const [bairroCliente, setBairroCliente] = useState('');
    const [quantidade, setQuantidade] = useState(0);
    const [tamanho, setTamanho] = useState('');
    const [message, setMessage] = useState({ type: '', text: '' });

    const codigoArtigoRef = useRef(null);
    const descricaoArtigoRef = useRef(null);
    const nomeClienteRef = useRef(null);
    const sobrenomeClienteRef = useRef(null);
    const bairroClienteRef = useRef(null);
    const quantidadeRef = useRef(null);
    const tamanhoRef = useRef(null);
    const submitButtonRef = useRef(null);

    const tamanhoOptions = [
        { value: 'P', label: 'Pequeno' },
        { value: 'M', label: 'Médio' },
        { value: 'G', label: 'Grande' },
        { value: 'GG', label: 'Extra Grande' },
    ];

    useEffect(() => {
        codigoArtigoRef.current.focus();
    }, []);

    const handleKeyDown = (event, nextFieldRef) => {
        if (event.key === 'Enter' || event.key === 'ArrowDown') {
            event.preventDefault();
            nextFieldRef.current.focus();
        } else if (event.key === 'ArrowUp') {
            event.preventDefault();
            // Lógica para focar no campo anterior, se necessário
            // Por simplicidade, não implementado aqui, mas pode ser adicionado
        }
    };

    const fetchArtigo = async (codigo) => {
        if (!codigo) {
            setDescricaoArtigo('');
            return;
        }
        try {
            const response = await fetch(`http://localhost/api/artigos.php?id=${codigo}`);
            const data = await response.json();
            if (response.ok && data.descricao) {
                setDescricaoArtigo(data.descricao);
                setMessage({ type: '', text: '' });
            } else {
                setDescricaoArtigo('');
                setMessage({ type: 'error', text: 'Artigo não cadastrado!' });
                codigoArtigoRef.current.focus();
            }
        } catch (error) {
            console.error('Erro ao buscar artigo:', error);
            setDescricaoArtigo('');
            setMessage({ type: 'error', text: 'Erro ao buscar artigo.' });
            codigoArtigoRef.current.focus();
        }
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        setMessage({ type: '', text: '' });

        if (!codigoArtigo || !descricaoArtigo) {
            setMessage({ type: 'error', text: 'Código do artigo inválido.' });
            codigoArtigoRef.current.focus();
            return;
        }

        if (!tamanho) {
            setMessage({ type: 'error', text: 'Selecione um tamanho.' });
            tamanhoRef.current.focus();
            return;
        }

        if (quantidade <= 0) {
            setMessage({ type: 'error', text: 'Quantidade deve ser maior que zero.' });
            quantidadeRef.current.focus();
            return;
        }

        const etiquetaData = {
            codigoArtigo,
            descricaoArtigo,
            nomeCliente,
            sobrenomeCliente,
            bairroCliente,
            quantidade,
            tamanho,
        };

        try {
            const response = await fetch('http://localhost/api/etiquetas_barras.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(etiquetaData),
            });
            const data = await response.json();

            if (response.ok) {
                setMessage({ type: 'success', text: data.message || 'Etiquetas geradas com sucesso!' });
                // Aqui você pode adicionar a lógica para exibir o relatório ou as etiquetas geradas
                // Por exemplo, abrir uma nova janela com o PDF ou renderizar na tela
                console.log('Etiquetas geradas:', data.etiquetas);
                resetForm();
            } else {
                setMessage({ type: 'error', text: data.message || 'Erro ao gerar etiquetas.' });
            }
        } catch (error) {
            console.error('Erro ao enviar dados:', error);
            setMessage({ type: 'error', text: 'Erro de comunicação com o servidor.' });
        }
    };

    const resetForm = () => {
        setCodigoArtigo('');
        setDescricaoArtigo('');
        setNomeCliente('');
        setSobrenomeCliente('');
        setBairroCliente('');
        setQuantidade(0);
        setTamanho('');
        codigoArtigoRef.current.focus();
    };

    return (
        <div className="etiqueta-barras-container">
            <h2>Geração de Etiquetas de Barras</h2>
            <form onSubmit={handleSubmit} className="etiqueta-barras-form">
                <div className="form-group">
                    <label htmlFor="codigoArtigo">Código do Artigo:</label>
                    <input
                        type="text"
                        id="codigoArtigo"
                        value={codigoArtigo}
                        onChange={(e) => setCodigoArtigo(e.target.value)}
                        onBlur={() => fetchArtigo(codigoArtigo)}
                        onKeyDown={(e) => handleKeyDown(e, tamanhoRef)}
                        ref={codigoArtigoRef}
                        required
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="descricaoArtigo">Descrição do Artigo:</label>
                    <input
                        type="text"
                        id="descricaoArtigo"
                        value={descricaoArtigo}
                        readOnly
                        ref={descricaoArtigoRef}
                        className={descricaoArtigo ? '' : 'invalid'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="tamanho">Tamanho:</label>
                    <select
                        id="tamanho"
                        value={tamanho}
                        onChange={(e) => setTamanho(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, quantidadeRef)}
                        ref={tamanhoRef}
                        required
                    >
                        <option value="">Selecione</option>
                        {tamanhoOptions.map((option) => (
                            <option key={option.value} value={option.value}>
                                {option.label}
                            </option>
                        ))}
                    </select>
                </div>

                <div className="form-group">
                    <label htmlFor="quantidade">Quantidade:</label>
                    <input
                        type="number"
                        id="quantidade"
                        value={quantidade}
                        onChange={(e) => setQuantidade(parseInt(e.target.value) || 0)}
                        onKeyDown={(e) => handleKeyDown(e, nomeClienteRef)}
                        ref={quantidadeRef}
                        min="1"
                        required
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="nomeCliente">Nome Cliente:</label>
                    <input
                        type="text"
                        id="nomeCliente"
                        value={nomeCliente}
                        onChange={(e) => setNomeCliente(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, sobrenomeClienteRef)}
                        ref={nomeClienteRef}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="sobrenomeCliente">Sobrenome Cliente:</label>
                    <input
                        type="text"
                        id="sobrenomeCliente"
                        value={sobrenomeCliente}
                        onChange={(e) => setSobrenomeCliente(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, bairroClienteRef)}
                        ref={sobrenomeClienteRef}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="bairroCliente">Bairro Cliente:</label>
                    <input
                        type="text"
                        id="bairroCliente"
                        value={bairroCliente}
                        onChange={(e) => setBairroCliente(e.target.value)}
                        onKeyDown={(e) => handleKeyDown(e, submitButtonRef)}
                        ref={bairroClienteRef}
                    />
                </div>

                {message.text && (
                    <div className={`message ${message.type}-message`}>
                        {message.text}
                    </div>
                )}

                <button type="submit" ref={submitButtonRef}>Gerar Etiquetas</button>
            </form>
        </div>
    );
}

export default EtiqbarPage;