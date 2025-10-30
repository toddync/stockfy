import React, { useState, useEffect } from 'react';
import Alerta from '../components/Alerta'; // Assumindo que existe um componente Alerta

const EtiquetaPage = () => {
    const [formData, setFormData] = useState({
        idcli: '',
        nome: '',
        endereco: '',
        bairro: '',
        cidade: '',
        vendedorCod: '',
        vendedorNome: '',
        cep: '',
        estado: '',
        idetiq: ''
    });
    const [message, setMessage] = useState({ type: '', text: '' });

    const API_BASE_URL = 'http://localhost/api'; // Ajuste conforme a URL da sua API PHP

    useEffect(() => {
        // Carregar o último ID da etiqueta ao montar o componente
        fetchLastEtiquetaId();
    }, []);

    const fetchLastEtiquetaId = async () => {
        try {
            const response = await fetch(`${API_BASE_URL}/etiquetas.php?last_id=true`);
            const data = await response.json();
            if (response.ok) {
                setFormData(prev => ({ ...prev, idetiq: String(data.last_id + 1).padStart(10, '0') })); // Supondo 10 dígitos
            } else {
                setMessage({ type: 'error', text: data.message || 'Erro ao carregar o último ID da etiqueta.' });
            }
        } catch (error) {
            console.error('Erro ao buscar último ID da etiqueta:', error);
            setMessage({ type: 'error', text: 'Erro de conexão ao buscar o último ID da etiqueta.' });
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleIdCliExit = async () => {
        if (!formData.idcli) {
            setMessage({ type: 'error', text: 'Identifique o Cliente !!!!' });
            return;
        }

        const paddedIdCli = String(formData.idcli).padStart(10, '0'); // Supondo 10 dígitos
        setFormData(prev => ({ ...prev, idcli: paddedIdCli }));

        try {
            const clientResponse = await fetch(`${API_BASE_URL}/clientes.php?id=${paddedIdCli}`);
            const clientData = await clientResponse.json();

            if (clientResponse.ok && clientData.idcli) {
                setFormData(prev => ({
                    ...prev,
                    nome: clientData.nome,
                    endereco: clientData.ende,
                    bairro: clientData.bair,
                    cidade: clientData.cida,
                    vendedorCod: clientData.vend,
                    cep: clientData.ncep,
                    estado: clientData.esta,
                }));

                const confirmClient = window.confirm('Confirme o cliente!!!!');
                if (confirmClient) {
                    await fetchVendedor(clientData.vend);
                } else {
                    handleClear();
                }
            } else {
                setMessage({ type: 'error', text: clientData.message || 'Cliente não cadastrado.' });
                handleClear();
            }
        } catch (error) {
            console.error('Erro ao buscar cliente:', error);
            setMessage({ type: 'error', text: 'Erro de conexão ao buscar cliente.' });
            handleClear();
        }
    };

    const fetchVendedor = async (codVen) => {
        try {
            const vendorResponse = await fetch(`${API_BASE_URL}/vendedores.php?codven=${codVen}`);
            const vendorData = await vendorResponse.json();

            if (vendorResponse.ok && vendorData.codven) {
                setFormData(prev => ({ ...prev, vendedorNome: vendorData.nome }));
                await createEtiqueta();
            } else {
                setMessage({ type: 'error', text: vendorData.message || 'Vendedor não reconhecido !!!!' });
                handleClear();
            }
        } catch (error) {
            console.error('Erro ao buscar vendedor:', error);
            setMessage({ type: 'error', text: 'Erro de conexão ao buscar vendedor.' });
            handleClear();
        }
    };

    const createEtiqueta = async () => {
        try {
            const response = await fetch(`${API_BASE_URL}/etiquetas.php`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    codcli: formData.idcli,
                    nomcli: formData.nome,
                    bairro: formData.bairro,
                    codven: formData.vendedorCod,
                    nomven: formData.vendedorNome,
                }),
            });
            const data = await response.json();

            if (response.ok) {
                setMessage({ type: 'success', text: `Etiqueta criada com sucesso! ID: ${data.idetiq}. CONFIRA NUM. DO PEDIDO !!` });
                fetchLastEtiquetaId(); // Atualiza o próximo ID da etiqueta
                handleClear();
            } else {
                setMessage({ type: 'error', text: data.message || 'Não foi possível criar a etiqueta.' });
            }
        } catch (error) {
            console.error('Erro ao criar etiqueta:', error);
            setMessage({ type: 'error', text: 'Erro de conexão ao criar etiqueta.' });
        }
    };

    const handleClear = () => {
        setFormData({
            idcli: '',
            nome: '',
            endereco: '',
            bairro: '',
            cidade: '',
            vendedorCod: '',
            vendedorNome: '',
            cep: '',
            estado: '',
            idetiq: formData.idetiq // Mantém o último ID da etiqueta para o próximo
        });
        setMessage({ type: '', text: '' });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // A lógica de submissão é acionada por handleIdCliExit após a confirmação do cliente
        // Este botão pode ser usado para iniciar o processo se o foco não estiver no idcli
        if (formData.idcli) {
            handleIdCliExit();
        } else {
            setMessage({ type: 'error', text: 'Identifique o Cliente !!!!' });
        }
    };

    return (
        <div className="etiqueta-container">
            <h2>Gerar Etiqueta</h2>
            {message.text && <Alerta type={message.type} message={message.text} />}
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="idetiq">Número da Etiqueta:</label>
                    <input
                        type="text"
                        id="idetiq"
                        name="idetiq"
                        value={formData.idetiq}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="idcli">Código do Cliente:</label>
                    <input
                        type="text"
                        id="idcli"
                        name="idcli"
                        value={formData.idcli}
                        onChange={handleChange}
                        onBlur={handleIdCliExit}
                        maxLength="10"
                        autoFocus
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="nome">Nome do Cliente:</label>
                    <input
                        type="text"
                        id="nome"
                        name="nome"
                        value={formData.nome}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="endereco">Endereço:</label>
                    <input
                        type="text"
                        id="endereco"
                        name="endereco"
                        value={formData.endereco}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="bairro">Bairro:</label>
                    <input
                        type="text"
                        id="bairro"
                        name="bairro"
                        value={formData.bairro}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="cidade">Cidade:</label>
                    <input
                        type="text"
                        id="cidade"
                        name="cidade"
                        value={formData.cidade}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="vendedorCod">Cód. Vendedor:</label>
                    <input
                        type="text"
                        id="vendedorCod"
                        name="vendedorCod"
                        value={formData.vendedorCod}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="vendedorNome">Nome Vendedor:</label>
                    <input
                        type="text"
                        id="vendedorNome"
                        name="vendedorNome"
                        value={formData.vendedorNome}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="cep">CEP:</label>
                    <input
                        type="text"
                        id="cep"
                        name="cep"
                        value={formData.cep}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-group">
                    <label htmlFor="estado">Estado:</label>
                    <input
                        type="text"
                        id="estado"
                        name="estado"
                        value={formData.estado}
                        readOnly
                        className="read-only"
                    />
                </div>
                <div className="form-actions">
                    <button type="button" onClick={handleClear}>Limpar</button>
                    <button type="submit">Confirmar</button>
                </div>
            </form>
        </div>
    );
};

export default EtiquetaPage;