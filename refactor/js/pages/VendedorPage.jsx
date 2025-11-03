import React, { useState, useEffect } from 'react';

const VendedorPage = () => {
    const [vendedores, setVendedores] = useState([]);
    const [rotas, setRotas] = useState([]);
    const [formData, setFormData] = useState({
        codven: '',
        nome: '',
        ncpf: '',
        nifp: '',
        ende: '',
        bair: '',
        cida: '',
        esta: '',
        ncep: '',
        ntel1: '',
        ntel2: '',
        ntel3: '',
        ntel4: '',
        praca1: '',
        praca2: '',
        praca3: '',
        praca4: '',
        email: '',
        datsol: '',
        numsol: ''
    });
    const [isEditing, setIsEditing] = useState(false);

    useEffect(() => {
        fetchVendedores();
        fetchRotas();
    }, []);

    const fetchVendedores = async () => {
        const response = await fetch('http://localhost/rosa/refactor/php/api/vendedores_api.php');
        const data = await response.json();
        setVendedores(data);
    };

    const fetchRotas = async () => {
        const response = await fetch('http://localhost/rosa/refactor/php/api/vendedores_api.php?action=get_rotas');
        const data = await response.json();
        setRotas(data);
    };
    
    const handleNew = async () => {
        const response = await fetch('http://localhost/rosa/refactor/php/api/vendedores_api.php?action=get_new_codven');
        const data = await response.json();
        setFormData({ ...formData, codven: data.new_codven });
        setIsEditing(true);
    };

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = isEditing
            ? `http://localhost/rosa/refactor/php/api/vendedores_api.php`
            : 'http://localhost/rosa/refactor/php/api/vendedores_api.php';
        const method = isEditing ? 'PUT' : 'POST';

        const response = await fetch(url, {
            method: method,
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        });

        if (response.ok) {
            fetchVendedores();
            setIsEditing(false);
            setFormData({
                codven: '', nome: '', ncpf: '', nifp: '', ende: '', bair: '', cida: '', esta: '', ncep: '',
                ntel1: '', ntel2: '', ntel3: '', ntel4: '', praca1: '', praca2: '', praca3: '', praca4: '',
                email: '', datsol: '', numsol: ''
            });
        }
    };

    const handleEdit = (vendedor) => {
        setFormData(vendedor);
        setIsEditing(true);
    };

    const handleDelete = async (codven) => {
        const response = await fetch(`http://localhost/rosa/refactor/php/api/vendedores_api.php?codven=${codven}`, {
            method: 'DELETE'
        });

        if (response.ok) {
            fetchVendedores();
        }
    };

    return (
        <div>
            <h1>Cadastro de Vendedores</h1>
            <button onClick={handleNew}>Novo</button>
            {isEditing && (
                <form onSubmit={handleSubmit}>
                    <input type="text" name="codven" value={formData.codven} onChange={handleInputChange} placeholder="Código" disabled />
                    <input type="text" name="nome" value={formData.nome} onChange={handleInputChange} placeholder="Nome" required />
                    {/* Adicionar outros campos do formulário aqui */}
                    <button type="submit">{isEditing ? 'Atualizar' : 'Salvar'}</button>
                </form>
            )}
            <table>
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Email</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    {vendedores.map(vendedor => (
                        <tr key={vendedor.codven}>
                            <td>{vendedor.codven}</td>
                            <td>{vendedor.nome}</td>
                            <td>{vendedor.ncpf}</td>
                            <td>{vendedor.email}</td>
                            <td>
                                <button onClick={() => handleEdit(vendedor)}>Editar</button>
                                <button onClick={() => handleDelete(vendedor.codven)}>Excluir</button>
                            </td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default VendedorPage;