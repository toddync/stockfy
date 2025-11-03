import React, { useState, useEffect } from 'react';
import axios from 'axios';

const FornecedorPage = () => {
    const [formData, setFormData] = useState({
        codigo_fornecedor: '',
        razao_social: '',
        nome_fantasia: '',
        tipo_pessoa: 'J', // Default para Jurídica
        cpf: '',
        cnpj: '',
        ie: '',
        endereco: '',
        bairro: '',
        cidade: '',
        estado: '',
        cep: '',
        telefone: '',
        responsavel: '',
        telefone_responsavel: '',
        situacao: ' ',
    });
    const [operation, setOperation] = useState('Implantar'); // Implantar, Alterar, Consultar, Excluir
    const [message, setMessage] = useState('');
    const [fornecedorCompras, setFornecedorCompras] = useState([]);
    const [showCompras, setShowCompras] = useState(false);

    const estados = [
        'AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT',
        'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO'
    ];

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prevData => ({
            ...prevData,
            [name]: value
        }));
    };

    const handleOperationChange = (e) => {
        setOperation(e.target.value);
        clearForm();
        setMessage('');
        setShowCompras(false);
    };

    const clearForm = () => {
        setFormData({
            codigo_fornecedor: '',
            razao_social: '',
            nome_fantasia: '',
            tipo_pessoa: 'J',
            cpf: '',
            cnpj: '',
            ie: '',
            endereco: '',
            bairro: '',
            cidade: '',
            estado: '',
            cep: '',
            telefone: '',
            responsavel: '',
            telefone_responsavel: '',
            situacao: ' ',
        });
        setFornecedorCompras([]);
        setShowCompras(false);
    };

    const fetchFornecedor = async (codigo_fornecedor) => {
        try {
            const response = await axios.get(`http://localhost/refactor/php/api/fornecedores.php?codigo_fornecedor=${codigo_fornecedor}`);
            const data = response.data;
            setFormData(prevData => ({
                ...prevData,
                ...data,
                // Ensure fields that might be null from API are handled
                nome_fantasia: data.nome_fantasia || '',
                cpf: data.cpf || '',
                cnpj: data.cnpj || '',
                ie: data.ie || '',
                endereco: data.endereco || '',
                bairro: data.bairro || '',
                cidade: data.cidade || '',
                estado: data.estado || '',
                cep: data.cep || '',
                telefone: data.telefone || '',
                responsavel: data.responsavel || '',
                telefone_responsavel: data.telefone_responsavel || '',
                situacao: data.situacao || ' ',
            }));
            setMessage('');
            if (operation === 'Consultar') {
                fetchCompras(codigo_fornecedor);
                setShowCompras(true);
            }
        } catch (error) {
            console.error("Erro ao buscar fornecedor:", error);
            setMessage("Fornecedor não encontrado.");
            clearForm();
        }
    };

    const fetchCompras = async (codigo_fornecedor) => {
        try {
            // Supondo que exista um endpoint para compras por fornecedor
            const response = await axios.get(`http://localhost/refactor/php/api/compras.php?fornecedor_codigo=${codigo_fornecedor}`);
            setFornecedorCompras(response.data.records || []);
        } catch (error) {
            console.error("Erro ao buscar compras:", error);
            setFornecedorCompras([]);
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setMessage('');

        if (!formData.codigo_fornecedor || !formData.razao_social) {
            setMessage("Marca e Razão Social são campos obrigatórios.");
            return;
        }

        try {
            let response;
            if (operation === 'Implantar') {
                response = await axios.post('http://localhost/refactor/php/api/fornecedores.php', formData);
            } else if (operation === 'Alterar') {
                response = await axios.put('http://localhost/refactor/php/api/fornecedores.php', formData);
            } else if (operation === 'Excluir') {
                response = await axios.delete('http://localhost/refactor/php/api/fornecedores.php', { data: { codigo_fornecedor: formData.codigo_fornecedor } });
            }

            setMessage(response.data.message);
            clearForm();
        } catch (error) {
            console.error("Erro na operação:", error);
            setMessage(error.response?.data?.message || "Ocorreu um erro na operação.");
        }
    };

    useEffect(() => {
        if (operation === 'Implantar') {
            clearForm();
        }
    }, [operation]);

    return (
        <div className="fornecedor-container">
            <h1>Cadastro de Fornecedor</h1>
            {message && <div className="message">{message}</div>}

            <div className="operation-selector">
                <label>Operação:</label>
                <select name="operation" value={operation} onChange={handleOperationChange}>
                    <option value="Implantar">Implantar</option>
                    <option value="Alterar">Alterar</option>
                    <option value="Consultar">Consultar</option>
                    <option value="Excluir">Excluir</option>
                </select>
            </div>

            <form onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="codigo_fornecedor">Marca:</label>
                    <input
                        type="text"
                        id="codigo_fornecedor"
                        name="codigo_fornecedor"
                        value={formData.codigo_fornecedor}
                        onChange={handleChange}
                        onBlur={() => formData.codigo_fornecedor && fetchFornecedor(formData.codigo_fornecedor)}
                        required
                        readOnly={operation === 'Alterar' || operation === 'Excluir' || operation === 'Consultar'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="razao_social">Razão Social:</label>
                    <input
                        type="text"
                        id="razao_social"
                        name="razao_social"
                        value={formData.razao_social}
                        onChange={handleChange}
                        required
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="nome_fantasia">Nome Fantasia:</label>
                    <input
                        type="text"
                        id="nome_fantasia"
                        name="nome_fantasia"
                        value={formData.nome_fantasia}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="tipo_pessoa">Pessoa:</label>
                    <select
                        id="tipo_pessoa"
                        name="tipo_pessoa"
                        value={formData.tipo_pessoa}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    >
                        <option value="F">Física</option>
                        <option value="J">Jurídica</option>
                    </select>
                </div>

                {formData.tipo_pessoa === 'F' && (
                    <div className="form-group">
                        <label htmlFor="cpf">CPF:</label>
                        <input
                            type="text"
                            id="cpf"
                            name="cpf"
                            value={formData.cpf}
                            onChange={handleChange}
                            maxLength="14" // Ex: 999.999.999-99
                            readOnly={operation === 'Consultar' || operation === 'Excluir'}
                        />
                    </div>
                )}

                {formData.tipo_pessoa === 'J' && (
                    <div className="form-group">
                        <label htmlFor="cnpj">CNPJ:</label>
                        <input
                            type="text"
                            id="cnpj"
                            name="cnpj"
                            value={formData.cnpj}
                            onChange={handleChange}
                            maxLength="18" // Ex: 99.999.999/9999-99
                            readOnly={operation === 'Consultar' || operation === 'Excluir'}
                        />
                    </div>
                )}

                <div className="form-group">
                    <label htmlFor="ie">Inscrição Estadual:</label>
                    <input
                        type="text"
                        id="ie"
                        name="ie"
                        value={formData.ie}
                        onChange={handleChange}
                        maxLength="14" // Ex: 999.999.999.999
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="endereco">Endereço:</label>
                    <input
                        type="text"
                        id="endereco"
                        name="endereco"
                        value={formData.endereco}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="bairro">Bairro:</label>
                    <input
                        type="text"
                        id="bairro"
                        name="bairro"
                        value={formData.bairro}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="cidade">Cidade:</label>
                    <input
                        type="text"
                        id="cidade"
                        name="cidade"
                        value={formData.cidade}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="estado">Estado:</label>
                    <select
                        id="estado"
                        name="estado"
                        value={formData.estado}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    >
                        <option value="">Selecione</option>
                        {estados.map(uf => (
                            <option key={uf} value={uf}>{uf}</option>
                        ))}
                    </select>
                </div>

                <div className="form-group">
                    <label htmlFor="cep">CEP:</label>
                    <input
                        type="text"
                        id="cep"
                        name="cep"
                        value={formData.cep}
                        onChange={handleChange}
                        maxLength="9" // Ex: 99999-999
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="telefone">Telefone(s):</label>
                    <input
                        type="text"
                        id="telefone"
                        name="telefone"
                        value={formData.telefone}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="responsavel">Responsável:</label>
                    <input
                        type="text"
                        id="responsavel"
                        name="responsavel"
                        value={formData.responsavel}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-group">
                    <label htmlFor="telefone_responsavel">Telefone(s) Responsável:</label>
                    <input
                        type="text"
                        id="telefone_responsavel"
                        name="telefone_responsavel"
                        value={formData.telefone_responsavel}
                        onChange={handleChange}
                        readOnly={operation === 'Consultar' || operation === 'Excluir'}
                    />
                </div>

                <div className="form-actions">
                    <button type="submit" disabled={operation === 'Consultar'}>
                        {operation === 'Implantar' && 'Implantar'}
                        {operation === 'Alterar' && 'Alterar'}
                        {operation === 'Excluir' && 'Excluir'}
                    </button>
                    <button type="button" onClick={clearForm}>Restaurar</button>
                </div>
            </form>

            {showCompras && fornecedorCompras.length > 0 && (
                <div className="compras-realizadas">
                    <h2>Compras Realizadas</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Pedido</th>
                                <th>Data</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            {fornecedorCompras.map((compra, index) => (
                                <tr key={index}>
                                    <td>{compra.numped}</td>
                                    <td>{compra.datped}</td>
                                    <td>{compra.totped}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            )}
            {showCompras && fornecedorCompras.length === 0 && operation === 'Consultar' && (
                <div className="compras-realizadas">
                    <p>Nenhuma compra encontrada para este fornecedor.</p>
                </div>
            )}
        </div>
    );
};

export default FornecedorPage;