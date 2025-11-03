import React, { useState, useEffect } from 'react';
import axios from 'axios';

const API_URL = 'http://localhost/rosa/refactor/php/api/fornecedores_api.php'; // Ajuste a URL da sua API

function ManutforPage() {
    const [fornecedores, setFornecedores] = useState([]);
    const [fornecedorAtual, setFornecedorAtual] = useState({
        id: null,
        codigo_fornecedor: '',
        razao_social: '',
        nome_fantasia: '',
        tipo_pessoa: '',
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
        situacao: ''
    });
    const [termoBusca, setTermoBusca] = useState('');
    const [modoEdicao, setModoEdicao] = useState(false);
    const [mensagem, setMensagem] = useState('');

    useEffect(() => {
        carregarFornecedores();
    }, []);

    const carregarFornecedores = async () => {
        try {
            const response = await axios.get(API_URL);
            setFornecedores(response.data.records);
        } catch (error) {
            console.error("Erro ao carregar fornecedores:", error);
            setMensagem("Erro ao carregar fornecedores.");
        }
    };

    const buscarFornecedores = async () => {
        try {
            const response = await axios.get(`${API_URL}?search=${termoBusca}`);
            setFornecedores(response.data.records);
        } catch (error) {
            console.error("Erro ao buscar fornecedores:", error);
            setMensagem("Erro ao buscar fornecedores.");
            setFornecedores([]); // Limpa a lista se não encontrar
        }
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFornecedorAtual(prevState => ({
            ...prevState,
            [name]: value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            if (modoEdicao) {
                await axios.put(API_URL, fornecedorAtual);
                setMensagem("Fornecedor atualizado com sucesso!");
            } else {
                await axios.post(API_URL, fornecedorAtual);
                setMensagem("Fornecedor criado com sucesso!");
            }
            limparFormulario();
            carregarFornecedores();
        } catch (error) {
            console.error("Erro ao salvar fornecedor:", error);
            setMensagem("Erro ao salvar fornecedor.");
        }
    };

    const editarFornecedor = (fornecedor) => {
        setFornecedorAtual(fornecedor);
        setModoEdicao(true);
    };

    const excluirFornecedor = async (id) => {
        if (window.confirm("Tem certeza que deseja excluir este fornecedor?")) {
            try {
                await axios.delete(API_URL, { data: { id: id } });
                setMensagem("Fornecedor excluído com sucesso!");
                carregarFornecedores();
            } catch (error) {
                console.error("Erro ao excluir fornecedor:", error);
                setMensagem("Erro ao excluir fornecedor.");
            }
        }
    };

    const limparFormulario = () => {
        setFornecedorAtual({
            id: null,
            codigo_fornecedor: '',
            razao_social: '',
            nome_fantasia: '',
            tipo_pessoa: '',
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
            situacao: ''
        });
        setModoEdicao(false);
    };

    return (
        <div className="manutfor-container">
            <h1>Manutenção de Fornecedores</h1>

            {mensagem && <div className="mensagem">{mensagem}</div>}

            <div className="form-section">
                <h2>{modoEdicao ? 'Editar Fornecedor' : 'Novo Fornecedor'}</h2>
                <form onSubmit={handleSubmit}>
                    <input type="text" name="codigo_fornecedor" placeholder="Código Fornecedor" value={fornecedorAtual.codigo_fornecedor} onChange={handleChange} required />
                    <input type="text" name="razao_social" placeholder="Razão Social" value={fornecedorAtual.razao_social} onChange={handleChange} required />
                    <input type="text" name="nome_fantasia" placeholder="Nome Fantasia" value={fornecedorAtual.nome_fantasia} onChange={handleChange} />
                    <input type="text" name="tipo_pessoa" placeholder="Tipo Pessoa (F/J)" value={fornecedorAtual.tipo_pessoa} onChange={handleChange} maxLength="1" />
                    <input type="text" name="cpf" placeholder="CPF" value={fornecedorAtual.cpf} onChange={handleChange} />
                    <input type="text" name="cnpj" placeholder="CNPJ" value={fornecedorAtual.cnpj} onChange={handleChange} />
                    <input type="text" name="ie" placeholder="Inscrição Estadual" value={fornecedorAtual.ie} onChange={handleChange} />
                    <input type="text" name="endereco" placeholder="Endereço" value={fornecedorAtual.endereco} onChange={handleChange} />
                    <input type="text" name="bairro" placeholder="Bairro" value={fornecedorAtual.bairro} onChange={handleChange} />
                    <input type="text" name="cidade" placeholder="Cidade" value={fornecedorAtual.cidade} onChange={handleChange} />
                    <input type="text" name="estado" placeholder="Estado (UF)" value={fornecedorAtual.estado} onChange={handleChange} maxLength="2" />
                    <input type="text" name="cep" placeholder="CEP" value={fornecedorAtual.cep} onChange={handleChange} />
                    <input type="text" name="telefone" placeholder="Telefone" value={fornecedorAtual.telefone} onChange={handleChange} />
                    <input type="text" name="responsavel" placeholder="Responsável" value={fornecedorAtual.responsavel} onChange={handleChange} />
                    <input type="text" name="telefone_responsavel" placeholder="Telefone Responsável" value={fornecedorAtual.telefone_responsavel} onChange={handleChange} />
                    <input type="text" name="situacao" placeholder="Situação (A/I)" value={fornecedorAtual.situacao} onChange={handleChange} maxLength="1" />
                    <button type="submit">{modoEdicao ? 'Atualizar' : 'Adicionar'}</button>
                    <button type="button" onClick={limparFormulario}>Cancelar</button>
                </form>
            </div>

            <div className="search-section">
                <input
                    type="text"
                    placeholder="Buscar por Razão Social ou Código"
                    value={termoBusca}
                    onChange={(e) => setTermoBusca(e.target.value)}
                />
                <button onClick={buscarFornecedores}>Buscar</button>
                <button onClick={carregarFornecedores}>Limpar Busca</button>
            </div>

            <div className="table-section">
                <h2>Lista de Fornecedores</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Código</th>
                            <th>Razão Social</th>
                            <th>Nome Fantasia</th>
                            <th>Tipo Pessoa</th>
                            <th>CPF/CNPJ</th>
                            <th>Telefone</th>
                            <th>Situação</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        {fornecedores.map(fornecedor => (
                            <tr key={fornecedor.id}>
                                <td>{fornecedor.id}</td>
                                <td>{fornecedor.codigo_fornecedor}</td>
                                <td>{fornecedor.razao_social}</td>
                                <td>{fornecedor.nome_fantasia}</td>
                                <td>{fornecedor.tipo_pessoa}</td>
                                <td>{fornecedor.cpf || fornecedor.cnpj}</td>
                                <td>{fornecedor.telefone}</td>
                                <td>{fornecedor.situacao}</td>
                                <td>
                                    <button onClick={() => editarFornecedor(fornecedor)}>Editar</button>
                                    <button onClick={() => excluirFornecedor(fornecedor.id)}>Excluir</button>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}

export default ManutforPage;