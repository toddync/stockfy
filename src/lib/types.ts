export type ISO8601Date = string; // YYYY-MM-DD
export type ISO8601DateTime = string; // YYYY-MM-DD HH:MM:SS
export type TimeString = string; // HH:MM

export type TipoPessoa = "F" | "J";
export type SituacaoPedido =
    | "pendente"
    | "faturado"
    | "cancelado"
    | "devolvido";
export type TipoPedido = "venda" | "troca" | "bonificacao";
export type TipoMovimentacaoEstoque =
    | "entrada_compra"
    | "saida_venda"
    | "ajuste_inventario"
    | "devolucao"
    | "perda";
export type TipoContaFinanceira = "receita" | "despesa";
export type SituacaoConta = "pendente" | "pago" | "cancelado" | "atrasado";

export interface Praca {
    id: number;
    codigo: string;
    nome: string;
}

export interface Rota {
    id: number;
    codigo: string;
    nome: string;
    bairro: string | null;
    praca_id: number;
}

export interface Vendedor {
    id: number;
    codigo: string;
    nome: string;
    cpf: string | null;
    rg: string | null;
    email: string | null;
    telefone: string | null;
    endereco: string | null;
    bairro: string | null;
    cidade: string | null;
    estado: string | null;
    cep: string | null;
    ativo: number; // 0 or 1
    data_cadastro: ISO8601DateTime;
}

export interface VendedorPraca {
    vendedor_id: number;
    praca_id: number;
}

export interface Fornecedor {
    id: number;
    razao_social: string;
    nome_fantasia: string | null;
    tipo_pessoa: TipoPessoa | null;
    documento: string | null;
    inscricao_estadual: string | null;
    endereco: string | null;
    bairro: string | null;
    cidade: string | null;
    estado: string | null;
    cep: string | null;
    telefone: string | null;
    responsavel: string | null;
    ativo: number; // 0 or 1
}

export interface Cliente {
    id: number;
    nome: string;
    limite_credito: number;
    ativo: number; // 0 or 1
    data_cadastro: ISO8601DateTime;
    cpf_cnpj: string | null;
    ie_rg: string | null;
    endereco: string | null;
    bairro: string | null;
    cidade: string | null;
    estado: string | null;
    cep: string | null;
    telefone: string | null;
    email: string | null;
    tabela_preco: string | null; // Defaults to 'A'
    rota_id: number | null;
    praca_id: number | null;
    dias_visita: string | null; // JSON string or CSV
    hora_visita_inicio: TimeString | null;
    hora_visita_fim: TimeString | null;
    observacoes: string | null;
    vendedor_id: number | null;
}

export interface ProdutoGrupo {
    id: number;
    codigo: string;
    descricao: string;
}

export interface Tag {
    id: number;
    nome: string;
}

export interface Produto {
    id: number;
    codigo: string;
    descricao: string;
    grupo_id: number | null;
    preco_custo: number | null;
    preco_venda: number | null;
    preco_venda_b: number | null;
    preco_minimo: number | null;
    data_atualizacao: ISO8601DateTime;
}

export interface ProdutoVariacao {
    id: number;
    produto_id: number;
    sku: string | null;
    tamanho: string | null;
    cor: string | null;
    estoque_atual: number;
}

export interface ProdutoTag {
    produto_id: number;
    tag_id: number;
}

export interface Pedido {
    id: number;
    numero_pedido: string;
    cliente_id: number;
    vendedor_id: number | null;
    data_pedido: ISO8601Date;
    data_entrega: ISO8601Date | null;
    valor_bruto: number | null;
    valor_desconto: number | null;
    valor_liquido: number | null;
    situacao: SituacaoPedido;
    tipo_pedido: TipoPedido | null;
    observacoes: string | null;
}

export interface PedidoItem {
    id: number;
    pedido_id: number;
    produto_id: number;
    variacao_id: number | null;
    quantidade_saida: number;
    quantidade_retorno: number;
    readonly quantidade_vendida?: number;
    preco_unitario: number;
    readonly valor_total?: number;
}

export interface Compra {
    id: number;
    fornecedor_id: number;
    numero_nota: string | null;
    data_emissao: ISO8601Date;
    data_entrada: ISO8601Date | null;
    valor_total: number | null;
    observacoes: string | null;
}

export interface CompraItem {
    id: number;
    compra_id: number;
    produto_id: number;
    variacao_id: number | null;
    quantidade: number;
    preco_custo_un: number;
    valor_total: number | null;
}

export interface MovimentacaoEstoque {
    id: number;
    tipo: TipoMovimentacaoEstoque;
    variacao_id: number;
    quantidade: number;
    referencia_id: number | null;
    referencia_tabela: "pedidos" | "compras" | null;
    data_movimento: ISO8601DateTime;
}

export interface ContaFinanceira {
    id: number;
    descricao: string;
    tipo: TipoContaFinanceira;
    categoria: string | null;
    cliente_id: number | null;
    fornecedor_id: number | null;
    pedido_id: number | null;
    compra_id: number | null;
    valor_original: number;
    valor_pago: number | null;
    valor_restante: number | null;
    data_vencimento: ISO8601Date;
    data_pagamento: ISO8601Date | null;
    situacao: SituacaoConta;
    forma_pagamento: string | null;
}

export interface Usuario {
    id: number;
    username: string;
    password_hash: string;
    role: string | null;
    ativo: number; // 0 or 1
    vendedor_id: number | null;
    data_criacao: ISO8601DateTime;
}
