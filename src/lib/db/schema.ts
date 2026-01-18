export default `
    CREATE TABLE IF NOT EXISTS pracas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        nome TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS rotas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        nome TEXT NOT NULL,
        bairro TEXT,
        praca_id INTEGER NOT NULL, -- A route must belong to a praca
        FOREIGN KEY (praca_id) REFERENCES pracas(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS vendedores (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        nome TEXT NOT NULL,
        cpf TEXT UNIQUE,
        rg TEXT,
        email TEXT,
        telefone TEXT,
        -- Address fields
        endereco TEXT,
        bairro TEXT,
        cidade TEXT,
        estado TEXT,
        cep TEXT,
        ativo INTEGER DEFAULT 1,
        data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS vendedor_pracas (
        vendedor_id INTEGER NOT NULL,
        praca_id INTEGER NOT NULL,
        PRIMARY KEY (vendedor_id, praca_id),
        FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE CASCADE,
        FOREIGN KEY (praca_id) REFERENCES pracas(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS fornecedores (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        razao_social TEXT NOT NULL,
        nome_fantasia TEXT, -- Added for brand name
        tipo_pessoa TEXT CHECK(tipo_pessoa IN ('F', 'J')),
        documento TEXT UNIQUE,
        inscricao_estadual TEXT,
        endereco TEXT,
        bairro TEXT,
        cidade TEXT,
        estado TEXT,
        cep TEXT,
        telefone TEXT,
        responsavel TEXT,
        ativo INTEGER DEFAULT 1
    );

    CREATE TABLE IF NOT EXISTS clientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        cpf_cnpj TEXT UNIQUE,
        ie_rg TEXT,
        endereco TEXT,
        bairro TEXT,
        cidade TEXT,
        estado TEXT,
        cep TEXT,
        telefone TEXT,
        email TEXT,
        limite_credito DECIMAL(12, 2) DEFAULT 0,
        tabela_preco TEXT DEFAULT 'A', -- Could be normalized, but acceptable for simple logic
        rota_id INTEGER,
        praca_id INTEGER,
        ativo INTEGER DEFAULT 1,
        data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
        dias_visita TEXT, -- JSON or CSV of days (e.g., "seg,qua")
        hora_visita_inicio TIME,
        hora_visita_fim TIME,
        observacoes TEXT,
        vendedor_id INTEGER,
        FOREIGN KEY (rota_id) REFERENCES rotas(id) ON DELETE SET NULL,
        FOREIGN KEY (praca_id) REFERENCES pracas(id) ON DELETE SET NULL,
        FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS produto_grupos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        descricao TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS tags (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT UNIQUE NOT NULL
    );

    CREATE TABLE IF NOT EXISTS produtos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codigo TEXT UNIQUE NOT NULL,
        descricao TEXT NOT NULL,
        grupo_id INTEGER,
        preco_custo DECIMAL(12, 2),
        preco_venda DECIMAL(12, 2), -- Tabela A
        preco_venda_b DECIMAL(12, 2), -- Tabela B
        preco_minimo DECIMAL(12, 2),
        data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (grupo_id) REFERENCES produto_grupos(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS produto_variacoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        produto_id INTEGER NOT NULL,
        sku TEXT UNIQUE,
        tamanho TEXT,
        cor TEXT,
        estoque_atual DECIMAL(10, 2) DEFAULT 0,
        FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS produto_tags (
        produto_id INTEGER NOT NULL,
        tag_id INTEGER NOT NULL,
        PRIMARY KEY (produto_id, tag_id),
        FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
        FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS pedidos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numero_pedido TEXT UNIQUE NOT NULL,
        cliente_id INTEGER NOT NULL,
        vendedor_id INTEGER,
        data_pedido DATE NOT NULL,
        data_entrega DATE,
        valor_bruto DECIMAL(12, 2),
        valor_desconto DECIMAL(12, 2) DEFAULT 0,
        valor_liquido DECIMAL(12, 2),
        situacao TEXT CHECK(situacao IN ('pendente', 'faturado', 'cancelado', 'devolvido')) DEFAULT 'pendente',
        tipo_pedido TEXT DEFAULT 'venda',
        observacoes TEXT,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
        FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS pedido_itens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pedido_id INTEGER NOT NULL,
        produto_id INTEGER NOT NULL,
        variacao_id INTEGER,
        quantidade_saida INTEGER NOT NULL DEFAULT 0,
        quantidade_retorno INTEGER NOT NULL DEFAULT 0,
        quantidade_vendida INTEGER GENERATED ALWAYS AS (quantidade_saida - quantidade_retorno) VIRTUAL,
        preco_unitario DECIMAL(12, 2) NOT NULL,
        valor_total DECIMAL(12, 2) GENERATED ALWAYS AS ((quantidade_saida - quantidade_retorno) * preco_unitario) VIRTUAL,
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
        FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
        FOREIGN KEY (variacao_id) REFERENCES produto_variacoes(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS compras (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fornecedor_id INTEGER NOT NULL,
        numero_nota TEXT,
        data_emissao DATE NOT NULL,
        data_entrada DATE DEFAULT CURRENT_DATE,
        valor_total DECIMAL(12, 2),
        observacoes TEXT,
        FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS compra_itens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        compra_id INTEGER NOT NULL,
        produto_id INTEGER NOT NULL,
        variacao_id INTEGER,
        quantidade INTEGER NOT NULL,
        preco_custo_un DECIMAL(12, 2) NOT NULL,
        valor_total DECIMAL(12, 2),
        FOREIGN KEY (compra_id) REFERENCES compras(id) ON DELETE CASCADE,
        FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS movimentacoes_estoque (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tipo TEXT CHECK(tipo IN ('entrada_compra', 'saida_venda', 'ajuste_inventario', 'devolucao', 'perda')) NOT NULL,
        variacao_id INTEGER NOT NULL,
        quantidade DECIMAL(10, 2) NOT NULL,
        referencia_id INTEGER,
        referencia_tabela TEXT,
        data_movimento DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (variacao_id) REFERENCES produto_variacoes(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS contas_financeiras (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,
        tipo TEXT CHECK(tipo IN ('receita', 'despesa')) NOT NULL,
        categoria TEXT,

        cliente_id INTEGER,
        fornecedor_id INTEGER,
        pedido_id INTEGER,
        compra_id INTEGER,

        valor_original DECIMAL(12, 2) NOT NULL,
        valor_pago DECIMAL(12, 2) DEFAULT 0,
        valor_restante DECIMAL(12, 2), -- Calculated or Managed


        data_vencimento DATE NOT NULL,
        data_pagamento DATE,
        situacao TEXT CHECK(situacao IN ('pendente', 'pago', 'cancelado', 'atrasado')) DEFAULT 'pendente',
        forma_pagamento TEXT,

        FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE SET NULL,
        FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id) ON DELETE SET NULL,
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE SET NULL,
        FOREIGN KEY (compra_id) REFERENCES compras(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password_hash TEXT NOT NULL,
        role TEXT DEFAULT 'vendedor',
        ativo INTEGER DEFAULT 1,
        vendedor_id INTEGER,
        data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL
    );

    CREATE INDEX idx_clientes_nome ON clientes(nome);
    CREATE INDEX idx_pedidos_cliente ON pedidos(cliente_id);
    CREATE INDEX idx_estoque_variacao ON movimentacoes_estoque(variacao_id);
    CREATE INDEX idx_financeiro_vencimento ON contas_financeiras(data_vencimento);
`;
