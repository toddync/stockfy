import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ManutvenPage = () => {
    const [vendedores, setVendedores] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [searchBy, setSearchBy] = useState('Codven'); // 'Codven' ou 'Nome'
    const [editingVendedor, setEditingVendedor] = useState(null);
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [modalMode, setModalMode] = useState('create'); // 'create', 'edit', 'view'

    const API_URL = 'http://localhost/rosa/refactor/php/api/vendedores_api.php'; // Ajuste a URL da sua API PHP

    useEffect(() => {
        fetchVendedores();
    }, [searchTerm, searchBy]);

    const fetchVendedores = async () => {
        try {
            let url = API_URL;
            if (searchTerm) {
                url += `?search=${searchTerm}`;
            }
            const response = await axios.get(url);
            setVendedores(response.data.records || []);
        } catch (error) {
            console.error("Erro ao buscar vendedores:", error);
            setVendedores([]);
        }
    };

    const handleSearch = () => {
        fetchVendedores();
    };

    const handleCreate = () => {
        setEditingVendedor({
            codven: '', nome: '', ncpf: '', nifp: '', ende: '', bair: '', cida: '', esta: '', ncep: '',
            ntel1: '', ntel2: '', ntel3: '', ntel4: '', praca1: '', praca2: '', praca3: '', praca4: '',
            email: '', datsol: '', numsol: ''
        });
        setModalMode('create');
        setIsModalOpen(true);
    };

    const handleEdit = (vendedor) => {
        setEditingVendedor({ ...vendedor });
        setModalMode('edit');
        setIsModalOpen(true);
    };

    const handleView = (vendedor) => {
        setEditingVendedor({ ...vendedor });
        setModalMode('view');
        setIsModalOpen(true);
    };

    const handleDelete = async (codven) => {
        if (window.confirm(`Tem certeza que deseja excluir o vendedor ${codven}?`)) {
            try {
                await axios.delete(`${API_URL}?codven=${codven}`);
                alert('Vendedor excluído com sucesso!');
                fetchVendedores();
            } catch (error) {
                console.error("Erro ao excluir vendedor:", error);
                alert('Erro ao excluir vendedor.');
            }
        }
    };

    const handleSave = async (e) => {
        e.preventDefault();
        try {
            if (modalMode === 'create') {
                await axios.post(API_URL, editingVendedor);
                alert('Vendedor criado com sucesso!');
            } else if (modalMode === 'edit') {
                await axios.put(API_URL, editingVendedor);
                alert('Vendedor atualizado com sucesso!');
            }
            setIsModalOpen(false);
            fetchVendedores();
        } catch (error) {
            console.error("Erro ao salvar vendedor:", error);
            alert('Erro ao salvar vendedor.');
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setEditingVendedor(prev => ({ ...prev, [name]: value }));
    };

    const handleReport = () => {
        // Lógica para gerar relatório, similar ao FrmRelmapa do Delphi
        alert('Funcionalidade de relatório ainda não implementada.');
    };

    return (
        <div className="manutven-container">
            <h1>Manutenção de Vendedores</h1>

            <div className="controls">
                <select value={searchBy} onChange={(e) => setSearchBy(e.target.value)}>
                    <option value="Codven">Código</option>
                    <option value="Nome">Nome</option>
                </select>
                <input
                    type="text"
                    placeholder={`Buscar por ${searchBy === 'Codven' ? 'código' : 'nome'}`}
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                />
                <button onClick={handleSearch}>Buscar</button>
                <button onClick={handleCreate}>Implantar</button>
                <button onClick={handleReport}>Relatório</button>
            </div>

            <div className="table-responsive">
                <table className="vendedores-table">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>CPF</th>
                            <th>Endereço</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>Telefone 1</th>
                            <th>Email</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {vendedores.length > 0 ? (
                            vendedores.map((vendedor) => (
                                <tr key={vendedor.codven}>
                                    <td>{vendedor.codven}</td>
                                    <td>{vendedor.nome}</td>
                                    <td>{vendedor.ncpf}</td>
                                    <td>{vendedor.ende}</td>
                                    <td>{vendedor.cida}</td>
                                    <td>{vendedor.esta}</td>
                                    <td>{vendedor.ntel1}</td>
                                    <td>{vendedor.email}</td>
                                    <td>
                                        <button onClick={() => handleEdit(vendedor)}>Alterar</button>
                                        <button onClick={() => handleView(vendedor)}>Consultar</button>
                                        <button onClick={() => handleDelete(vendedor.codven)}>Excluir</button>
                                    </td>
                                </tr>
                            ))
                        ) : (
                            <tr>
                                <td colSpan="9">Nenhum vendedor encontrado.</td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>

            {isModalOpen && (
                <div className="modal">
                    <div className="modal-content">
                        <h2>{modalMode === 'create' ? 'Novo Vendedor' : modalMode === 'edit' ? 'Editar Vendedor' : 'Consultar Vendedor'}</h2>
                        <form onSubmit={handleSave}>
                            <div className="form-group">
                                <label>Código:</label>
                                <input
                                    type="text"
                                    name="codven"
                                    value={editingVendedor.codven}
                                    onChange={handleChange}
                                    readOnly={modalMode !== 'create'}
                                    required
                                />
                            </div>
                            <div className="form-group">
                                <label>Nome:</label>
                                <input
                                    type="text"
                                    name="nome"
                                    value={editingVendedor.nome}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                    required
                                />
                            </div>
                            <div className="form-group">
                                <label>CPF:</label>
                                <input
                                    type="text"
                                    name="ncpf"
                                    value={editingVendedor.ncpf}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Inscrição Estadual/RG:</label>
                                <input
                                    type="text"
                                    name="nifp"
                                    value={editingVendedor.nifp}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Endereço:</label>
                                <input
                                    type="text"
                                    name="ende"
                                    value={editingVendedor.ende}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Bairro:</label>
                                <input
                                    type="text"
                                    name="bair"
                                    value={editingVendedor.bair}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Cidade:</label>
                                <input
                                    type="text"
                                    name="cida"
                                    value={editingVendedor.cida}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Estado:</label>
                                <input
                                    type="text"
                                    name="esta"
                                    value={editingVendedor.esta}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>CEP:</label>
                                <input
                                    type="text"
                                    name="ncep"
                                    value={editingVendedor.ncep}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Telefone 1:</label>
                                <input
                                    type="text"
                                    name="ntel1"
                                    value={editingVendedor.ntel1}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Telefone 2:</label>
                                <input
                                    type="text"
                                    name="ntel2"
                                    value={editingVendedor.ntel2}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Telefone 3:</label>
                                <input
                                    type="text"
                                    name="ntel3"
                                    value={editingVendedor.ntel3}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Telefone 4:</label>
                                <input
                                    type="text"
                                    name="ntel4"
                                    value={editingVendedor.ntel4}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Praça 1:</label>
                                <input
                                    type="text"
                                    name="praca1"
                                    value={editingVendedor.praca1}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Praça 2:</label>
                                <input
                                    type="text"
                                    name="praca2"
                                    value={editingVendedor.praca2}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Praça 3:</label>
                                <input
                                    type="text"
                                    name="praca3"
                                    value={editingVendedor.praca3}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Praça 4:</label>
                                <input
                                    type="text"
                                    name="praca4"
                                    value={editingVendedor.praca4}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Email:</label>
                                <input
                                    type="email"
                                    name="email"
                                    value={editingVendedor.email}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Data Solicitação:</label>
                                <input
                                    type="text"
                                    name="datsol"
                                    value={editingVendedor.datsol}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="form-group">
                                <label>Número Solicitação:</label>
                                <input
                                    type="text"
                                    name="numsol"
                                    value={editingVendedor.numsol}
                                    onChange={handleChange}
                                    readOnly={modalMode === 'view'}
                                />
                            </div>
                            <div className="modal-actions">
                                {modalMode !== 'view' && <button type="submit">Salvar</button>}
                                <button type="button" onClick={() => setIsModalOpen(false)}>Fechar</button>
                            </div>
                        </form>
                    </div>
                </div>
            )}
        </div>
    );
};

export default ManutvenPage;