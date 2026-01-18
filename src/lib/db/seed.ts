export default `
    INSERT INTO pracas (id, codigo, nome) VALUES
    (1, 'RJ01', 'Rio de Janeiro - Zona Sul'),
    (2, 'RJ02', 'Baixada Fluminense');

    INSERT INTO rotas (id, codigo, nome, bairro, praca_id) VALUES
    (1, 'R001', 'Rota Copacabana', 'Copacabana', 1),
    (2, 'R002', 'Rota Caxias Centro', 'Centro', 2);

    INSERT INTO produto_grupos (id, codigo, descricao) VALUES
    (1, 'BEB', 'Bebidas'),
    (2, 'ALI', 'Alimentos'),
    (3, 'LIM', 'Limpeza');

    INSERT INTO tags (id, nome) VALUES
    (1, 'Refrigerante'),
    (2, 'Alcoólico'),
    (3, 'Snack'),
    (4, 'Promoção');

    INSERT INTO vendedores (id, codigo, nome, email, telefone, ativo) VALUES
    (1, 'V01', 'Carlos Silva', 'carlos@vendas.com', '21999998888', 1),
    (2, 'V02', 'Mariana Souza', 'mariana@vendas.com', '21988887777', 1);

    INSERT INTO vendedor_pracas (vendedor_id, praca_id) VALUES
    (1, 1), -- Carlos works in Zona Sul
    (2, 2); -- Mariana works in Baixada

    INSERT INTO fornecedores (id, razao_social, nome_fantasia, tipo_pessoa, documento, cidade) VALUES
    (1, 'Distribuidora de Bebidas Rio Ltda', 'Rio Drinks', 'J', '12345678000199', 'Rio de Janeiro'),
    (2, 'Indústria de Alimentos Saboroso', 'Saboroso', 'J', '98765432000100', 'São Paulo');

    INSERT INTO clientes (id, nome, cpf_cnpj, endereco, bairro, cidade, rota_id, praca_id, limite_credito) VALUES
    (1, 'Bar do Zé', '11122233344', 'Av. Atlântica, 100', 'Copacabana', 'Rio de Janeiro', 1, 1, 5000.00),
    (2, 'Mercadinho da Família', '55566677788', 'Rua José de Alencar, 50', 'Centro', 'Duque de Caxias', 2, 2, 2000.00);

    INSERT INTO produtos (id, codigo, descricao, grupo_id, preco_custo, preco_venda, preco_venda_b) VALUES
    (1, 'COCA2L', 'Coca Cola 2 Litros', 1, 5.50, 8.00, 7.50);

    INSERT INTO produto_variacoes (id, produto_id, sku, estoque_atual) VALUES
    (1, 1, 'COCA2L-UNI', 100.00); -- 100 units in stock

    INSERT INTO produto_tags (produto_id, tag_id) VALUES (1, 1); -- Coca is Refrigerante

    INSERT INTO produtos (id, codigo, descricao, grupo_id, preco_custo, preco_venda, preco_venda_b) VALUES
    (2, 'CHIPS100', 'Batata Chips Clássica 100g', 2, 3.00, 5.50, 5.00);

    INSERT INTO produto_variacoes (id, produto_id, sku, estoque_atual) VALUES
    (2, 2, 'CHIPS100-UNI', 50.00); -- 50 units in stock

    INSERT INTO produto_tags (produto_id, tag_id) VALUES (2, 3); -- Chips is Snack

    INSERT INTO movimentacoes_estoque (tipo, variacao_id, quantidade, data_movimento) VALUES
    ('entrada_compra', 1, 100, CURRENT_TIMESTAMP), -- 100 Cocas
    ('entrada_compra', 2, 50, CURRENT_TIMESTAMP);  -- 50 Chips

    INSERT INTO pedidos (id, numero_pedido, cliente_id, vendedor_id, data_pedido, situacao, valor_bruto, valor_liquido, tipo_pedido) VALUES
    (1, 'PED-1001', 1, 1, DATE('now', '-1 day'), 'faturado', 80.00, 80.00, 'venda');

    INSERT INTO pedido_itens (pedido_id, produto_id, variacao_id, quantidade_saida, quantidade_retorno, preco_unitario) VALUES
    (1, 1, 1, 10, 0, 8.00); -- 10 Cocas * 8.00 = 80.00

    INSERT INTO movimentacoes_estoque (tipo, variacao_id, quantidade, referencia_id, referencia_tabela) VALUES
    ('saida_venda', 1, -10, 1, 'pedidos');
    UPDATE produto_variacoes SET estoque_atual = 90 WHERE id = 1;

    INSERT INTO pedidos (id, numero_pedido, cliente_id, vendedor_id, data_pedido, situacao, valor_bruto, valor_liquido) VALUES
    (2, 'PED-1002', 2, 2, DATE('now'), 'pendente', 0, 0);

    INSERT INTO pedido_itens (pedido_id, produto_id, variacao_id, quantidade_saida, quantidade_retorno, preco_unitario) VALUES
    (2, 2, 2, 20, 0, 5.50);


    INSERT INTO contas_financeiras (descricao, tipo, categoria, cliente_id, pedido_id, valor_original, valor_restante, data_vencimento, situacao) VALUES
    ('Venda PED-1001', 'receita', 'Vendas', 1, 1, 80.00, 80.00, DATE('now', '+7 days'), 'pendente');

    INSERT INTO contas_financeiras (descricao, tipo, categoria, valor_original, valor_restante, data_vencimento, situacao) VALUES
    ('Conta de Luz - Depósito', 'despesa', 'Administrativo', 250.00, 250.00, DATE('now', '+5 days'), 'pendente');


    INSERT INTO usuarios (username, password_hash, role, vendedor_id) VALUES
    ('admin', 'admin', 'admin', NULL),
    ('carlos_vendedor', 'carlos123', 'user', 1);
`;
