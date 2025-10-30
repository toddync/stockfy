import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ClientePage = () => {
    const [clientes, setClientes] = useState([]);
    const [cliente, setCliente] = useState({
        id: null,
        nome: '',
        cpf_cnpj: '',
        ie_rg: '',
        endereco: '',
        bairro: '',
        cidade: '',
        estado: '',
        cep: '',
        telefone: '',
        email: '',
        limite_credito: 0,
        ativo: true
    });
    const [isEditing, setIsEditing] = useState(false);

    const API_URL = 'http://localhost/rosa/refactor/php/api/clientes.php';

    useEffect(() => {
        fetchClientes();
    }, []);

    const fetchClientes = async () => {
        try {
            const response = await axios.get(API_URL);
            setClientes(response.data.records || []);
        } catch (error) {
            console.error("Erro ao buscar clientes:", error);
        }
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setCliente({ ...cliente, [name]: value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (isEditing) {
            await axios.put(API_URL, cliente);
        } else {
            await axios.post(API_URL, cliente);
        }
        fetchClientes();
        resetForm();
    };

    const handleEdit = (clienteParaEditar) => {
        setCliente(clienteParaEditar);
        setIsEditing(true);
    };

    const handleDelete = async (id) => {
        await axios.delete(API_URL, { data: { id: id } });
        fetchClientes();
    };

    const resetForm = () => {
        setCliente({
            id: null,
            nome: '',
            cpf_cnpj: '',
            ie_rg: '',
            endereco: '',
            bairro: '',
            cidade: '',
            estado: '',
            cep: '',
            telefone: '',
            email: '',
            limite_credito: 0,
            ativo: true
        });
        setIsEditing(false);
    };

    return (
        <div>
            <h1>Cadastro de Clientes</h1>
            <form onSubmit={handleSubmit}>
                <input type="text" name="nome" value={cliente.nome} onChange={handleInputChange} placeholder="Nome" required />
                <input type="text" name="cpf_cnpj" value={cliente.cpf_cnpj} onChange={handleInputChange} placeholder="CPF/CNPJ" required />
                <input type="text" name="telefone" value={cliente.telefone} onChange={handleInputChange} placeholder="Telefone" />
                <input type="text" name="cidade" value={cliente.cidade} onChange={handleInputChange} placeholder="Cidade" />
                <button type="submit">{isEditing ? 'Atualizar' : 'Salvar'}</button>
                {isEditing && <button type="button" onClick={resetForm}>Cancelar</button>}
            </form>

            <h2>Lista de Clientes</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>CPF/CNPJ</th>
                        <th>Telefone</th>
                        <th>Cidade</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    {clientes.map(c => (
                        <tr key={c.id}>
                            <td>{c.nome}</td>
                            <td>{c.cpf_cnpj}</td>
                            <td>{c.telefone}</td>
                            <td>{c.cidade}</td>
                            <td>
                                <button onClick={() => handleEdit(c)}>Editar</button>
                                <button onClick={() => handleDelete(c.id)}>Excluir</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default ClientePage;