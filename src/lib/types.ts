export type TipoPessoa = "F" | "J";
export type SituacaoPedido = "emitido" | "devolvido" | "retornado" | "vendido" | "cancelado";
export type TipoMovimentacao = "devolucao" | "defeito" | "ajuste";

// Helper for optional fields (nullable in DB)
export type Nullable<T> = T | null;

export interface Praca {
    id: number;
    codigo: string;
    nome: string;
}

export interface Rota {
    id: number;
    codigo: string;
    praca_id: number; // FK -> Praca
    bairro: Nullable<string>;
    nome: Nullable<string>;
}

export interface Vendedor {
    id: number;
    codigo: string;
    nome: string;
    cpf: Nullable<string>;
    rg: Nullable<string>;
    endereco: Nullable<string>;
    bairro: Nullable<string>;
    cidade: Nullable<string>;
    estado: Nullable<string>;
    cep: Nullable<string>;
    telefone: Nullable<string>;
    email: Nullable<string>;
    tabela_preco: "A" | "B";
    pracas_atendimento: Nullable<string[] | any>; // JSON column
    data_cadastro: Date;
}

export interface ProdutoGrupo {
    id: number;
    codigo: string;
    descricao: string;
}

export interface Fornecedor {
    id: number;
    marca: Nullable<string>;
    razao_social: string;
    tipo_pessoa: Nullable<TipoPessoa>;
    cpf: Nullable<string>;
    cnpj: Nullable<string>;
    inscricao_estadual: Nullable<string>;
    endereco: Nullable<string>;
    bairro: Nullable<string>;
    cidade: Nullable<string>;
    estado: Nullable<string>;
    cep: Nullable<string>;
    telefone: Nullable<string>;
    responsavel: Nullable<string>;
    telefone_responsavel: Nullable<string>;
    ativo: boolean; // Defaults to true in DB
}

export interface Tag {
    id: number;
    nome: string;
}

export interface Cliente {
    id: number;
    nome: string;
    cpf_cnpj: Nullable<string>;
    ie_rg: Nullable<string>;
    endereco: Nullable<string>;
    bairro: Nullable<string>;
    cidade: Nullable<string>;
    estado: Nullable<string>;
    cep: Nullable<string>;
    telefone: Nullable<string>;
    email: Nullable<string>;
    limite_credito: Nullable<number>; // DECIMAL
    data_nascimento: Nullable<Date>;
    nome_mae: Nullable<string>;
    nome_pai: Nullable<string>;
    naturalidade: Nullable<string>;
    rota_id: Nullable<number>; // FK -> Rota
    vendedor_id: number; // FK -> Vendedor (obrigatório)
    praca_id: Nullable<number>; // FK -> Praca
    tabela_preco: "A" | "B";
    referencia: Nullable<string>;
    ativo: boolean;
    data_cadastro: Date;
    hora_visita_inicio: Nullable<Date | string>; // TIME
    hora_visita_fim: Nullable<Date | string>; // TIME
    dias_visita: Nullable<string>;
    observacoes: Nullable<string>;
}

export interface Produto {
    id: number;
    codigo: string;
    descricao: string;
    grupo_id: number; // FK -> ProdutoGrupo
    preco_compra: Nullable<number>;
    preco_custo: Nullable<number>;
    preco_venda_a: Nullable<number>; // Renamed from preco_venda
    preco_venda_b: Nullable<number>; // New
    tabela_preco: Nullable<string>;
    preco_minimo: Nullable<number>;
    data_atualizacao: Date;
    estoque_atual: Nullable<number>;
}

export interface ProdutoVariacao {
    id: number;
    produto_id: number; // FK -> Produto
    sku: Nullable<string>;
    tamanho: Nullable<string>;
    cor: Nullable<string>;
    estoque_atual: number;
}

// Junction Table
export interface ProdutoTag {
    produto_id: number;
    tag_id: number;
}

export interface Pedido {
    id: number;
    numero_pedido: string;
    cliente_id: number; // FK -> Cliente
    vendedor_id: Nullable<number>; // FK -> Vendedor
    data_pedido: Date;
    data_base: Nullable<Date>;
    data_recolhimento: Nullable<Date>;
    data_cobranca: Nullable<Date>;
    valor_total: Nullable<number>;
    valor_venda: Nullable<number>;
    valor_pago: Nullable<number>;
    residuo: Nullable<number>;
    situacao: SituacaoPedido;
    solicitacao_numero: Nullable<string>;
    retorno: Nullable<string>;
    cobranca: Nullable<string>;
    limite: Nullable<string>;
    via: Nullable<string>;
    pedido_antigo: Nullable<string>;
    data_pagamento: Nullable<Date>;
}

export interface Compra {
    id: number;
    numero_pedido: string;
    tipo_pedido: Nullable<string>;
    fornecedor_id: number; // FK -> Fornecedor
    data_pedido: Date;
    data_entrega: Nullable<Date>;
    data_nota: Nullable<Date>;
    tipo_nota: Nullable<string>;
    numero_nota: Nullable<string>;
    valor_total_pedido: Nullable<number>;
    valor_total_nota: Nullable<number>;
    desconto: Nullable<number>;
    frete: Nullable<number>;
    situacao: Nullable<string>;
    parcelas: Nullable<string>;
    observacoes: Nullable<string>;
}

export interface MovimentacaoEstoque {
    id: number;
    tipo_movimentacao: TipoMovimentacao;
    numero_documento: string;
    data_documento: Date;
    data_base: Nullable<Date>;
    cliente_id: Nullable<number>; // FK
    vendedor_id: Nullable<number>; // FK
    valor_total: Nullable<number>;
    romaneio: Nullable<string>;
}

export interface Solicitacao {
    id: number;
    numero: string;
    vendedor_id: number;
    cliente_id: number;
    data_solicitacao: Date;
    situacao: Nullable<string>;
}

export interface ContaFinanceira {
    id: number;
    data_emissao: Date;
    tipo_documento: string;
    numero_documento: string;
    parcela: Nullable<string>;
    historico: Nullable<string>;
    observacoes: Nullable<string>;
    valor: number;
    tipo_cobranca: Nullable<string>;
    numero_cobranca: Nullable<string>;
    origem_cobranca: Nullable<string>;
    data_vencimento: Date;
    sinal: Nullable<string>;
    sigla: Nullable<string>;
    situacao: Nullable<string>; // Default 'pendente'
    data_pagamento: Nullable<Date>;
    vendedor_id: Nullable<number>;
    acrescimo: Nullable<number>;
    comissao: Nullable<number>;
    data_baixa: Nullable<Date>;
    operacao: Nullable<string>;
    cliente_id: Nullable<number>;
}

export interface Residuo {
    id: number;
    data_movimento: Date;
    item: Nullable<string>;
    numero_documento: Nullable<string>;
    valor_pago: Nullable<number>;
}

export interface PedidoItem {
    id: number;
    pedido_id: number;
    produto_id: number;
    variacao_id: Nullable<number>;
    quantidade_saida: number;
    quantidade_retorno: number;
    preco_custo: Nullable<number>;
    preco_venda: number;
}

export interface CompraItem {
    id: number;
    compra_id: number;
    produto_id: number;
    variacao_id: Nullable<number>;
    quantidade: number;
    preco_compra: number;
    desconto: Nullable<number>;
    valor_total: number;
}

export interface MovimentacaoItem {
    id: number;
    movimentacao_id: number;
    produto_id: number;
    variacao_id: Nullable<number>;
    quantidade: number;
    preco_custo: Nullable<number>;
}

export interface Etiqueta {
    id: number;
    cliente_id: number;
    codigo_vendedor: Nullable<string>;
    nome_vendedor: Nullable<string>;
    sobrenome: Nullable<string>;
}

export interface Usuario {
    id: number;
    nome: string;
    senha_hash: string;
    ativo: boolean;
    data_criacao: Date;
}

export interface Permissao {
    id: number;
    chave: string;
    descricao: Nullable<string>;
}

export interface UsuarioPermissao {
    usuario_id: number;
    permissao_id: number;
}
