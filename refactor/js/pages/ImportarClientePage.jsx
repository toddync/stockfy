import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import '../css/importar-cliente.css'; // Importa o CSS específico para esta página

const API_BASE_URL = 'http://localhost/refactor/php/api'; // Ajuste conforme sua configuração

const ImportarClientePage = () => {
    const [formData, setFormData] = useState({
        idcli: '',
        nome: '',
        ende: '',
        bair: '',
        cida: '',
        esta: '',
        ncep: '',
        ntel: '',
        conta: '',
        vend: '',
        nomeVendedor: '',
        lcred: '',
        datimp: '',
        nommae: '',
        nompai: '',
        datnasc: '',
        natu: '',
        rota: '',
        nomeRota: '',
        praca: '',
        nomePraca: '',
        refer: '',
        oldcli: ' ',
        situ: '',
        horain: '',
        horafin: '',
        visita: '',
        ativo: 'A',
        esped: '',
        obsv: ''
    });
    const [message, setMessage] = useState('');
    const [messageType, setMessageType] = useState(''); // 'success' or 'error'

    const nomeRef = useRef(null);

    useEffect(() => {
        // Lógica de inicialização similar ao FormShow do Delphi
        const today = new Date();
        const dd = String(today.getDate()).padStart(2, '0');
        const mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
        const yyyy = today.getFullYear();
        setFormData(prev => ({ ...prev, datimp: `${dd}/${mm}/${yyyy}` }));
        nomeRef.current.focus();
    }, []);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prev => ({ ...prev, [name]: value }));
    };

    const handleClear = () => {
        setFormData({
            idcli: '',
            nome: '',
            ende: '',
            bair: '',
            cida: '',
            esta: '',
            ncep: '',
            ntel: '',
            conta: '',
            vend: '',
            nomeVendedor: '',
            lcred: '',
            datimp: formData.datimp, // Mantém a data de importação
            nommae: '',
            nompai: '',
            datnasc: '',
            natu: '',
            rota: '',
            nomeRota: '',
            praca: '',
            nomePraca: '',
            refer: '',
            oldcli: ' ',
            situ: '',
            horain: '',
            horafin: '',
            visita: '',
            ativo: 'A',
            esped: '',
            obsv: ''
        });
        setMessage('');
        setMessageType('');
        nomeRef.current.focus();
    };

    const showMessage = (msg, type) => {
        setMessage(msg);
        setMessageType(type);
        setTimeout(() => {
            setMessage('');
            setMessageType('');
        }, 5000);
    };

    const handleVendExit = async () => {
        if (formData.vend) {
            const paddedVend = formData.vend.padStart(formData.vend.length > 0 ? formData.vend.length : 3, '0'); // Ajuste o MaxLength conforme necessário
            setFormData(prev => ({ ...prev, vend: paddedVend }));
            try {
                const response = await axios.get(`${API_BASE_URL}/vendedores?codven=${paddedVend}`);
                setFormData(prev => ({ ...prev, nomeVendedor: response.data.nome }));
            } catch (error) {
                console.error("Erro ao buscar vendedor:", error);
                setFormData(prev => ({ ...prev, nomeVendedor: '' }));
                showMessage('Vendedor não encontrado.', 'error');
            }
        }
    };

    const handlePracaExit = async () => {
        if (formData.praca) {
            const paddedPraca = formData.praca.padStart(formData.praca.length > 0 ? formData.praca.length : 3, '0'); // Ajuste o MaxLength conforme necessário
            setFormData(prev => ({ ...prev, praca: paddedPraca }));
            try {
                const response = await axios.get(`${API_BASE_URL}/rotas/praca?rota=${paddedPraca}`);
                setFormData(prev => ({ ...prev, nomePraca: response.data.nome }));
            } catch (error) {
                console.error("Erro ao buscar praça:", error);
                setFormData(prev => ({ ...prev, nomePraca: '' }));
                showMessage('Praça não encontrada.', 'error');
            }
        }
    };

    const handleRotaExit = async () => {
        if (formData.rota && formData.praca) {
            const paddedRota = formData.rota.padStart(formData.rota.length > 0 ? formData.rota.length : 3, '0'); // Ajuste o MaxLength conforme necessário
            setFormData(prev => ({ ...prev, rota: paddedRota }));
            try {
                const response = await axios.get(`${API_BASE_URL}/rotas/bairro?rota=${paddedRota}&bair=${formData.praca}`);
                setFormData(prev => ({ ...prev, nomeRota: response.data.nome }));
            } catch (error) {
                console.error("Erro ao buscar rota:", error);
                setFormData(prev => ({ ...prev, nomeRota: '' }));
                showMessage('Rota não encontrada.', 'error');
            }
        }
    };

    const handleEndeExit = () => {
        if (formData.ende.length > 50) {
            showMessage('Endereço muito grande (máx=50). Rebata a informação!', 'error');
            setFormData(prev => ({ ...prev, ende: '' }));
            // Focus no campo de endereço, se possível
        }
    };

    const handleNomeVendExit = async () => {
        if (formData.nome && formData.vend) {
            try {
                const checkResponse = await axios.get(`${API_BASE_URL}/clientes/check?nome=${formData.nome}&vend=${formData.vend}`);
                if (checkResponse.data.exists) {
                    showMessage('Cliente já foi importado!', 'error');
                    handleClear();
                    return;
                }

                const auxResponse = await axios.get(`${API_BASE_URL}/clientes/aux?nome=${formData.nome}&vend=${formData.vend}`);
                const auxData = auxResponse.data;
                setFormData(prev => ({
                    ...prev,
                    ende: auxData.ende || '',
                    bair: auxData.bair || '',
                    cida: auxData.cida || '',
                    ntel: auxData.ntel || '',
                    conta: auxData.conta || '',
                    vend: auxData.vend || '',
                    nifp: auxData.nifp || '',
                    ncep: auxData.ncep || '',
                    ncpf: auxData.ncpf || '',
                    nommae: auxData.nommae || '',
                    nompai: auxData.nompai || '',
                    datimp: auxData.datimp || formData.datimp,
                    datnasc: auxData.datnasc || '',
                    esta: auxData.esta || '',
                    natu: auxData.natu || '',
                    lcred: auxData.lcred ? parseFloat(auxData.lcred).toFixed(2) : '',
                    praca: auxData.praca || '',
                    rota: auxData.rota || '',
                    refer: auxData.refer || '',
                    horain: auxData.horain || '',
                    horafin: auxData.horafin || '',
                    esped: auxData.esped || ''
                }));
                showMessage('Complete as informações do cliente!', 'success');
                // Focus no campo de endereço, se possível
            } catch (error) {
                console.error("Erro ao verificar/buscar cliente auxiliar:", error);
                if (error.response && error.response.status === 404) {
                    // Cliente auxiliar não encontrado, pode prosseguir com a importação
                } else {
                    showMessage('Erro ao verificar cliente.', 'error');
                }
            }
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!formData.nome) {
            showMessage('O nome do cliente é obrigatório para importar.', 'error');
            return;
        }

        try {
            const response = await axios.post(`${API_BASE_URL}/clientes`, formData);
            const newId = String(response.data.id).padStart(formData.idcli.length > 0 ? formData.idcli.length : 5, '0'); // Ajuste o MaxLength conforme necessário
            setFormData(prev => ({ ...prev, idcli: newId }));
            showMessage(`CONFIRA NUM. DO CLIENTE: ${newId} !!`, 'success');
            handleClear(); // Limpa o formulário após a importação
        } catch (error) {
            console.error("Erro ao importar cliente:", error);
            showMessage('Não foi possível importar o cliente. Verifique os dados.', 'error');
        }
    };

    return (
        <div className="importar-cliente-container">
            {message && <div className={`message ${messageType}`}>{message}</div>}
            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="idcli">ID Cliente:</label>
                    <input type="text" id="idcli" name="idcli" value={formData.idcli} readOnly />
                </div>

                <div className="form-group">
                    <label htmlFor="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" value={formData.nome} onChange={handleChange} onBlur={handleNomeVendExit} ref={nomeRef} required />
                </div>

                <div className="form-group">
                    <label htmlFor="vend">Vendedor:</label>
                    <input type="text" id="vend" name="vend" value={formData.vend} onChange={handleChange} onBlur={handleVendExit} />
                    <input type="text" id="nomeVendedor" name="nomeVendedor" value={formData.nomeVendedor} readOnly />
                </div>

                <div className="form-group">
                    <label htmlFor="ende">Endereço:</label>
                    <input type="text" id="ende" name="ende" value={formData.ende} onChange={handleChange} onBlur={handleEndeExit} />
                </div>

                <div className="form-group">
                    <label htmlFor="bair">Bairro:</label>
                    <input type="text" id="bair" name="bair" value={formData.bair} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="cida">Cidade:</label>
                    <input type="text" id="cida" name="cida" value={formData.cida} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="esta">Estado:</label>
                    <select id="esta" name="esta" value={formData.esta} onChange={handleChange}>
                        <option value="">Selecione</option>
                        <option value="AC">AC</option>
                        <option value="AL">AL</option>
                        <option value="AP">AP</option>
                        <option value="AM">AM</option>
                        <option value="BA">BA</option>
                        <option value="CE">CE</option>
                        <option value="DF">DF</option>
                        <option value="ES">ES</option>
                        <option value="GO">GO</option>
                        <option value="MA">MA</option>
                        <option value="MT">MT</option>
                        <option value="MS">MS</option>
                        <option value="MG">MG</option>
                        <option value="PA">PA</option>
                        <option value="PB">PB</option>
                        <option value="PR">PR</option>
                        <option value="PE">PE</option>
                        <option value="PI">PI</option>
                        <option value="RJ">RJ</option>
                        <option value="RN">RN</option>
                        <option value="RS">RS</option>
                        <option value="RO">RO</option>
                        <option value="RR">RR</option>
                        <option value="SC">SC</option>
                        <option value="SP">SP</option>
                        <option value="SE">SE</option>
                        <option value="TO">TO</option>
                    </select>
                </div>

                <div className="form-group">
                    <label htmlFor="ncep">CEP:</label>
                    <input type="text" id="ncep" name="ncep" value={formData.ncep} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="ntel">Telefone:</label>
                    <input type="text" id="ntel" name="ntel" value={formData.ntel} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="conta">Conta:</label>
                    <input type="text" id="conta" name="conta" value={formData.conta} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="lcred">Limite de Crédito:</label>
                    <input type="number" id="lcred" name="lcred" value={formData.lcred} onChange={handleChange} step="0.01" />
                </div>

                <div className="form-group">
                    <label htmlFor="datimp">Data de Importação:</label>
                    <input type="text" id="datimp" name="datimp" value={formData.datimp} readOnly />
                </div>

                <div className="form-group">
                    <label htmlFor="nommae">Nome da Mãe:</label>
                    <input type="text" id="nommae" name="nommae" value={formData.nommae} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="nompai">Nome do Pai:</label>
                    <input type="text" id="nompai" name="nompai" value={formData.nompai} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="datnasc">Data de Nascimento:</label>
                    <input type="text" id="datnasc" name="datnasc" value={formData.datnasc} onChange={handleChange} placeholder="DD/MM/AAAA" />
                </div>

                <div className="form-group">
                    <label htmlFor="natu">Naturalidade:</label>
                    <input type="text" id="natu" name="natu" value={formData.natu} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="rota">Rota:</label>
                    <input type="text" id="rota" name="rota" value={formData.rota} onChange={handleChange} onBlur={handleRotaExit} />
                    <input type="text" id="nomeRota" name="nomeRota" value={formData.nomeRota} readOnly />
                </div>

                <div className="form-group">
                    <label htmlFor="praca">Praça:</label>
                    <input type="text" id="praca" name="praca" value={formData.praca} onChange={handleChange} onBlur={handlePracaExit} />
                    <input type="text" id="nomePraca" name="nomePraca" value={formData.nomePraca} readOnly />
                </div>

                <div className="form-group">
                    <label htmlFor="refer">Referência:</label>
                    <input type="text" id="refer" name="refer" value={formData.refer} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="situ">Situação:</label>
                    <input type="text" id="situ" name="situ" value={formData.situ} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="ncpf">CPF:</label>
                    <input type="text" id="ncpf" name="ncpf" value={formData.ncpf} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="nifp">CNPJ:</label>
                    <input type="text" id="nifp" name="nifp" value={formData.nifp} onChange={handleChange} />
                </div>

                <div className="form-group">
                    <label htmlFor="horain">Hora Início:</label>
                    <input type="text" id="horain" name="horain" value={formData.horain} onChange={handleChange} placeholder="HH:MM" />
                </div>

                <div className="form-group">
                    <label htmlFor="horafin">Hora Fim:</label>
                    <input type="text" id="horafin" name="horafin" value={formData.horafin} onChange={handleChange} placeholder="HH:MM" />
                </div>

                <div className="form-group">
                    <label htmlFor="esped">Tipo de Pedido:</label>
                    <select id="esped" name="esped" value={formData.esped} onChange={handleChange}>
                        <option value="">Selecione</option>
                        {/* Adicionar opções conforme necessário */}
                    </select>
                </div>

                <div className="form-actions">
                    <button type="submit" className="btn-primary">Importar</button>
                    <button type="button" className="btn-secondary" onClick={handleClear}>Limpar</button>
                </div>
            </form>
        </div>
    );
};

export default ImportarClientePage;