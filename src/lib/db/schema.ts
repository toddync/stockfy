export default `
    CREATE TABLE IF NOT EXISTS pracas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      nome TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS rotas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      bairro TEXT,
      nome TEXT,
      praca_id INTEGER,
      FOREIGN KEY (praca_id) REFERENCES pracas(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS vendedores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      nome TEXT NOT NULL,
      cpf TEXT UNIQUE,
      rg TEXT,
      endereco TEXT,
      bairro TEXT,
      cidade TEXT,
      estado TEXT,
      cep TEXT,
      telefone TEXT,
      email TEXT,
      pracas_atendimento TEXT,
      data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS produto_grupos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      descricao TEXT NOT NULL
    );

    CREATE TABLE IF NOT EXISTS fornecedores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      marca TEXT,
      razao_social TEXT NOT NULL,
      tipo_pessoa TEXT CHECK(tipo_pessoa IN ('F', 'J')),
      cpf TEXT,
      cnpj TEXT,
      inscricao_estadual TEXT,
      endereco TEXT,
      bairro TEXT,
      cidade TEXT,
      estado TEXT,
      cep TEXT,
      telefone TEXT,
      responsavel TEXT,
      telefone_responsavel TEXT,
      ativo INTEGER DEFAULT 1
    );

    CREATE TABLE IF NOT EXISTS tags (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT UNIQUE NOT NULL
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
      data_nascimento DATE,
      nome_mae TEXT,
      nome_pai TEXT,
      naturalidade TEXT,
      rota_id INTEGER,
      praca_id INTEGER,
      tabela_preco TEXT DEFAULT 'A',
      praça TEXT,
      referencia TEXT,
      ativo INTEGER DEFAULT 1,
      data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
      hora_visita_inicio TIME,
      hora_visita_fim TIME,
      dias_visita TEXT,
      observacoes TEXT,
      FOREIGN KEY (rota_id) REFERENCES rotas(id) ON DELETE SET NULL,
      FOREIGN KEY (praca_id) REFERENCES pracas(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS produtos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      descricao TEXT NOT NULL,
      grupo_id INTEGER NOT NULL,
      preco_custo DECIMAL(12, 2),
      preco_compra DECIMAL(12, 2),
      preco_venda DECIMAL(12, 2),
      preco_venda_b DECIMAL(12, 2),
      tabela_preco TEXT,
      preco_minimo DECIMAL(12, 2),
      data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (grupo_id) REFERENCES produto_grupos(id) ON DELETE CASCADE
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
      data_base DATE,
      data_recolhimento DATE,
      data_cobranca DATE,
      valor_total DECIMAL(12, 2),
      valor_venda DECIMAL(12, 2),
      valor_pago DECIMAL(12, 2),
      residuo DECIMAL(12, 2),
      situacao TEXT CHECK(situacao IN ('pendente', 'faturado', 'cancelado', 'perdido')) DEFAULT 'pendente',
      solicitacao_numero TEXT,
      retorno TEXT,
      cobranca TEXT,
      limite TEXT,
      via TEXT,
      pedido_antigo TEXT,
      data_pagamento DATE,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
      FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS compras (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      numero_pedido TEXT NOT NULL,
      tipo_pedido TEXT,
      fornecedor_id INTEGER NOT NULL,
      data_pedido DATE NOT NULL,
      data_entrega DATE,
      data_nota DATE,
      tipo_nota TEXT,
      numero_nota TEXT,
      valor_total_pedido DECIMAL(12, 2),
      valor_total_nota DECIMAL(12, 2),
      desconto DECIMAL(12, 2),
      frete DECIMAL(12, 2),
      situacao TEXT,
      parcelas TEXT,
      observacoes TEXT,
      FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS movimentacoes_estoque (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo_movimentacao TEXT CHECK(tipo_movimentacao IN ('devolucao', 'defeito', 'ajuste')) NOT NULL,
      numero_documento TEXT NOT NULL,
      data_documento DATE NOT NULL,
      data_base DATE,
      cliente_id INTEGER,
      vendedor_id INTEGER,
      valor_total DECIMAL(12, 2),
      romaneio TEXT,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE SET NULL,
      FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS solicitacoes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      numero TEXT UNIQUE NOT NULL,
      vendedor_id INTEGER NOT NULL,
      cliente_id INTEGER NOT NULL,
      data_solicitacao DATE NOT NULL,
      situacao TEXT,
      FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE CASCADE,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS contas_financeiras (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data_emissao DATE NOT NULL,
      tipo_documento TEXT NOT NULL,
      numero_documento TEXT NOT NULL,
      parcela TEXT,
      historico TEXT,
      observacoes TEXT,
      valor DECIMAL(12, 2) NOT NULL,
      tipo_cobranca TEXT,
      numero_cobranca TEXT,
      origem_cobranca TEXT,
      data_vencimento DATE NOT NULL,
      sinal TEXT,
      sigla TEXT,
      situacao TEXT DEFAULT 'pendente',
      data_pagamento DATE,
      vendedor_id INTEGER,
      acrescimo DECIMAL(12, 2),
      comissao DECIMAL(12, 2),
      data_baixa DATE,
      operacao TEXT,
      cliente_id INTEGER,
      FOREIGN KEY (vendedor_id) REFERENCES vendedores(id) ON DELETE SET NULL,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS pedido_itens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      pedido_id INTEGER NOT NULL,
      produto_id INTEGER NOT NULL,
      variacao_id INTEGER,
      quantidade_saida INTEGER NOT NULL DEFAULT 0,
      quantidade_retorno INTEGER NOT NULL DEFAULT 0,
      preco_custo DECIMAL(12, 2),
      preco_venda DECIMAL(12, 2) NOT NULL,
      FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
      FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
      FOREIGN KEY (variacao_id) REFERENCES produto_variacoes(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS compra_itens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      compra_id INTEGER NOT NULL,
      produto_id INTEGER NOT NULL,
      variacao_id INTEGER,
      quantidade INTEGER NOT NULL,
      preco_compra DECIMAL(12, 2) NOT NULL,
      desconto DECIMAL(12, 2),
      valor_total DECIMAL(12, 2) NOT NULL,
      FOREIGN KEY (compra_id) REFERENCES compras(id) ON DELETE CASCADE,
      FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
      FOREIGN KEY (variacao_id) REFERENCES produto_variacoes(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS movimentacao_itens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      movimentacao_id INTEGER NOT NULL,
      produto_id INTEGER NOT NULL,
      variacao_id INTEGER,
      quantidade INTEGER NOT NULL,
      preco_custo DECIMAL(12, 2),
      FOREIGN KEY (movimentacao_id) REFERENCES movimentacoes_estoque(id) ON DELETE CASCADE,
      FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
      FOREIGN KEY (variacao_id) REFERENCES produto_variacoes(id) ON DELETE SET NULL
    );

    CREATE TABLE IF NOT EXISTS residuos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data_movimento DATE NOT NULL,
      item TEXT,
      numero_documento TEXT,
      valor_pago DECIMAL(12, 2)
    );

    CREATE TABLE IF NOT EXISTS etiquetas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      cliente_id INTEGER NOT NULL,
      codigo_vendedor TEXT,
      nome_vendedor TEXT,
      sobrenome TEXT,
      FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
    );

    CREATE TABLE IF NOT EXISTS usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL UNIQUE,
      senha_hash TEXT NOT NULL,
      ativo INTEGER DEFAULT 1,
      data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS permissoes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      chave TEXT NOT NULL UNIQUE,
      descricao TEXT
    );

    CREATE TABLE IF NOT EXISTS usuario_permissoes (
      usuario_id INTEGER NOT NULL,
      permissao_id INTEGER NOT NULL,
      PRIMARY KEY (usuario_id, permissao_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
      FOREIGN KEY (permissao_id) REFERENCES permissoes(id) ON DELETE CASCADE
    );

    -- Indexes
    CREATE INDEX IF NOT EXISTS idx_clientes_nome ON clientes(nome);
    CREATE INDEX IF NOT EXISTS idx_clientes_cidade ON clientes(cidade);
    CREATE INDEX IF NOT EXISTS idx_clientes_rota ON clientes(rota_id);
    CREATE INDEX IF NOT EXISTS idx_clientes_ativo ON clientes(ativo);
    CREATE INDEX IF NOT EXISTS idx_clientes_praca ON clientes(praca_id);
    CREATE INDEX IF NOT EXISTS idx_clientes_tabela_preco ON clientes(tabela_preco);

    CREATE INDEX IF NOT EXISTS idx_rotas_praca ON rotas(praca_id);

    CREATE INDEX IF NOT EXISTS idx_produtos_descricao ON produtos(descricao);
    CREATE INDEX IF NOT EXISTS idx_produtos_grupo ON produtos(grupo_id);
    CREATE INDEX IF NOT EXISTS idx_produtos_codigo ON produtos(codigo);
    CREATE INDEX IF NOT EXISTS idx_produtos_preco_venda ON produtos(preco_venda);

    CREATE INDEX IF NOT EXISTS idx_variacoes_produto ON produto_variacoes(produto_id);
    CREATE INDEX IF NOT EXISTS idx_variacoes_sku ON produto_variacoes(sku);

    CREATE INDEX IF NOT EXISTS idx_tags_nome ON tags(nome);

    CREATE INDEX IF NOT EXISTS idx_produto_tags_produto ON produto_tags(produto_id);
    CREATE INDEX IF NOT EXISTS idx_produto_tags_tag ON produto_tags(tag_id);

    CREATE INDEX IF NOT EXISTS idx_pedidos_data ON pedidos(data_pedido);
    CREATE INDEX IF NOT EXISTS idx_pedidos_cliente ON pedidos(cliente_id);
    CREATE INDEX IF NOT EXISTS idx_pedidos_vendedor ON pedidos(vendedor_id);
    CREATE INDEX IF NOT EXISTS idx_pedidos_situacao ON pedidos(situacao);
    CREATE INDEX IF NOT EXISTS idx_pedidos_numero ON pedidos(numero_pedido);

    CREATE INDEX IF NOT EXISTS idx_compras_fornecedor ON compras(fornecedor_id);
    CREATE INDEX IF NOT EXISTS idx_compras_data ON compras(data_pedido);
    CREATE INDEX IF NOT EXISTS idx_compras_situacao ON compras(situacao);

    CREATE INDEX IF NOT EXISTS idx_contas_vencimento ON contas_financeiras(data_vencimento);
    CREATE INDEX IF NOT EXISTS idx_contas_situacao ON contas_financeiras(situacao);
    CREATE INDEX IF NOT EXISTS idx_contas_cliente ON contas_financeiras(cliente_id);
    CREATE INDEX IF NOT EXISTS idx_contas_vendedor ON contas_financeiras(vendedor_id);

    CREATE INDEX IF NOT EXISTS idx_movimentacoes_tipo ON movimentacoes_estoque(tipo_movimentacao);
    CREATE INDEX IF NOT EXISTS idx_movimentacoes_data ON movimentacoes_estoque(data_documento);
    CREATE INDEX IF NOT EXISTS idx_movimentacoes_cliente ON movimentacoes_estoque(cliente_id);

    CREATE INDEX IF NOT EXISTS idx_pedido_itens_pedido ON pedido_itens(pedido_id);
    CREATE INDEX IF NOT EXISTS idx_pedido_itens_produto ON pedido_itens(produto_id);
    CREATE INDEX IF NOT EXISTS idx_pedido_itens_variacao ON pedido_itens(variacao_id);
    CREATE INDEX IF NOT EXISTS idx_compra_itens_compra ON compra_itens(compra_id);
    CREATE INDEX IF NOT EXISTS idx_compra_itens_produto ON compra_itens(produto_id);
    CREATE INDEX IF NOT EXISTS idx_compra_itens_variacao ON compra_itens(variacao_id);
    CREATE INDEX IF NOT EXISTS idx_movimentacao_itens_mov ON movimentacao_itens(movimentacao_id);
    CREATE INDEX IF NOT EXISTS idx_movimentacao_itens_produto ON movimentacao_itens(produto_id);
    CREATE INDEX IF NOT EXISTS idx_movimentacao_itens_variacao ON movimentacao_itens(variacao_id);
`;
