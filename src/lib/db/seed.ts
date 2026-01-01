export default `
-- Disable Foreign Key checks temporarily
PRAGMA foreign_keys = OFF;

-- ==========================================
-- 1. BASE TABLES
-- ==========================================

-- Praças
INSERT INTO \`pracas\` (\`id\`, \`codigo\`, \`nome\`) VALUES
(1, '001', 'Rio de Janeiro - Centro'),
(2, '002', 'Niterói');

-- Rotas
INSERT INTO \`rotas\` (\`id\`, \`codigo\`, \`praca_id\`, \`bairro\`, \`nome\`) VALUES
(1, 'R001', 1, 'Centro', 'Rota Central'),
(2, 'R002', 2, 'Zona Sul', 'Rota Costeira'),
(3, 'R003', 1, 'Zona Norte', 'Rota Industrial');

-- Produto Grupos
INSERT INTO \`produto_grupos\` (\`id\`, \`codigo\`, \`descricao\`) VALUES
(1, 'GRP01', 'Vestuário'),
(2, 'GRP02', 'Calçados'),
(3, 'GRP03', 'Acessórios');

-- Tags
INSERT INTO \`tags\` (\`id\`, \`nome\`) VALUES
(1, 'Promoção'),
(2, 'Lançamento'),
(3, 'Outlet');

-- Vendedores
INSERT INTO \`vendedores\` (\`id\`, \`codigo\`, \`nome\`, \`cpf\`, \`email\`, \`tabela_preco\`, \`cidade\`, \`estado\`) VALUES
(1, 'VEND01', 'Carlos Silva', '123.456.789-00', 'carlos@empresa.com', 'A', 'São Paulo', 'SP'),
(2, 'VEND02', 'Mariana Souza', '987.654.321-00', 'mariana@empresa.com', 'B', 'Rio de Janeiro', 'RJ');

-- Fornecedores
INSERT INTO \`fornecedores\` (\`id\`, \`razao_social\`, \`marca\`, \`tipo_pessoa\`, \`cnpj\`, \`cidade\`, \`estado\`, \`ativo\`) VALUES
(1, 'Têxtil Brasil LTDA', 'MegaFabrics', 'J', '12.345.678/0001-90', 'Americana', 'SP', 1),
(2, 'Couros do Sul SA', 'LeatherKing', 'J', '98.765.432/0001-10', 'Porto Alegre', 'RS', 1);

-- Usuarios
INSERT INTO \`usuarios\` (\`id\`, \`nome\`, \`senha_hash\`, \`ativo\`) VALUES
(1, 'admin', 'hash_senha_secreta_123', 1),
(2, 'gerente', 'hash_senha_gerente_456', 1);

-- ==========================================
-- 2. MAIN ENTITIES
-- ==========================================

-- Clientes
-- Note: praça string removed from schema? No, I kept it as praca_id. Schema has praca_id and tabela_preco.
INSERT INTO \`clientes\` (\`id\`, \`nome\`, \`cpf_cnpj\`, \`rota_id\`, \`vendedor_id\`, \`praca_id\`, \`tabela_preco\`, \`cidade\`, \`estado\`, \`limite_credito\`, \`ativo\`) VALUES
(1, 'Loja da Esquina', '11.111.111/0001-11', 1, 1, 1, 'A', 'São Paulo', 'SP', 5000.00, 1),
(2, 'Boutique Chique', '22.222.222/0001-22', 2, 2, 2, 'B', 'Rio de Janeiro', 'RJ', 12000.00, 1),
(3, 'Mercadão Popular', '33.333.333/0001-33', 3, 1, 1, 'A', 'São Paulo', 'SP', 8000.00, 1);

-- Produtos
INSERT INTO \`produtos\` (\`id\`, \`codigo\`, \`descricao\`, \`grupo_id\`, \`preco_custo\`, \`preco_venda_a\`, \`preco_venda_b\`, \`preco_minimo\`) VALUES
(1, 'P001', 'Camiseta Básica Algodão', 1, 15.00, 35.00, 40.00, 30.00),
(2, 'P002', 'Calça Jeans Skinny', 1, 40.00, 120.00, 130.00, 100.00),
(3, 'P003', 'Tênis Esportivo', 2, 80.00, 250.00, 270.00, 220.00),
(4, 'P004', 'Boné Aba Reta', 3, 10.00, 45.00, 50.00, 40.00);

-- ==========================================
-- 3. SUB-ENTITIES
-- ==========================================

-- Produto Variações
INSERT INTO \`produto_variacoes\` (\`id\`, \`produto_id\`, \`sku\`, \`tamanho\`, \`cor\`, \`estoque_atual\`) VALUES
(1, 1, 'P001-P-BR', 'P', 'Branco', 100.00),
(2, 1, 'P001-M-BR', 'M', 'Branco', 150.00),
(3, 1, 'P001-G-PT', 'G', 'Preto', 80.00),
(4, 2, 'P002-38-AZ', '38', 'Azul', 50.00),
(5, 3, 'P003-42-VM', '42', 'Vermelho', 20.00);

-- Produto Tags
INSERT INTO \`produto_tags\` (\`produto_id\`, \`tag_id\`) VALUES
(1, 1),
(3, 2);

-- ==========================================
-- 4. TRANSACTIONS
-- ==========================================

-- Pedidos
INSERT INTO \`pedidos\` (\`id\`, \`numero_pedido\`, \`cliente_id\`, \`vendedor_id\`, \`data_pedido\`, \`valor_total\`, \`situacao\`) VALUES
(1, 'PED-1001', 1, 1, '2023-10-01', 350.00, 'faturado'),
(2, 'PED-1002', 2, 2, '2023-10-02', 1200.00, 'pendente'),
(3, 'PED-1003', 1, 1, '2023-10-03', 70.00, 'cancelado');

-- Pedido Itens
INSERT INTO \`pedido_itens\` (\`id\`, \`pedido_id\`, \`produto_id\`, \`variacao_id\`, \`quantidade_saida\`, \`preco_venda\`) VALUES
(1, 1, 1, 1, 10, 35.00),
(2, 2, 2, 4, 10, 120.00),
(3, 3, 1, 2, 2, 35.00);

-- Compras
INSERT INTO \`compras\` (\`id\`, \`numero_pedido\`, \`fornecedor_id\`, \`data_pedido\`, \`valor_total_nota\`, \`situacao\`) VALUES
(1, 'COMP-500', 1, '2023-09-01', 5000.00, 'finalizado');

-- Compra Itens
INSERT INTO \`compra_itens\` (\`id\`, \`compra_id\`, \`produto_id\`, \`variacao_id\`, \`quantidade\`, \`preco_compra\`, \`valor_total\`) VALUES
(1, 1, 1, 1, 200, 12.50, 2500.00),
(2, 1, 1, 2, 200, 12.50, 2500.00);

-- Contas Financeiras
INSERT INTO \`contas_financeiras\` (\`id\`, \`data_emissao\`, \`tipo_documento\`, \`numero_documento\`, \`valor\`, \`data_vencimento\`, \`situacao\`, \`cliente_id\`, \`vendedor_id\`, \`sinal\`) VALUES
(1, '2023-10-01', 'BOLETO', 'DOC-1001', 350.00, '2023-11-01', 'pendente', 1, 1, '+'),
(2, '2023-09-01', 'NF', 'DOC-COMP500', 5000.00, '2023-10-01', 'pago', NULL, NULL, '-');

-- Movimentações Estoque
INSERT INTO \`movimentacoes_estoque\` (\`id\`, \`tipo_movimentacao\`, \`numero_documento\`, \`data_documento\`, \`cliente_id\`, \`valor_total\`) VALUES
(1, 'devolucao', 'DEV-001', '2023-10-05', 1, 35.00);

-- Movimentação Itens
INSERT INTO \`movimentacao_itens\` (\`id\`, \`movimentacao_id\`, \`produto_id\`, \`variacao_id\`, \`quantidade\`, \`preco_custo\`) VALUES
(1, 1, 1, 1, 1, 15.00);

-- Etiquetas
INSERT INTO \`etiquetas\` (\`id\`, \`cliente_id\`, \`nome_vendedor\`) VALUES
(1, 1, 'Carlos Silva');

-- ==========================================
-- 5. MIGRATION & UPDATES
-- ==========================================

-- Praças
INSERT OR IGNORE INTO \`pracas\` (\`codigo\`, \`nome\`) VALUES
('001', 'Rio de Janeiro - Centro'),
('002', 'Niterói'),
('003', 'Baixada Fluminense'),
('004', 'Região dos Lagos');

-- Permissões
INSERT OR IGNORE INTO \`permissoes\` (\`chave\`, \`descricao\`) VALUES
('ADMIN', 'Acesso total ao sistema'),
('VENDAS_VIEW', 'Visualizar pedidos'),
('VENDAS_EDIT', 'Criar/Editar pedidos'),
('ESTOQUE_MANAGE', 'Gerenciar movimentações de estoque'),
('FINANCEIRO_VIEW', 'Visualizar contas a pagar/receber'),
('FINANCEIRO_BAIXA', 'Realizar baixa de títulos');

-- Usuario Permissões
INSERT OR IGNORE INTO \`usuario_permissoes\` (\`usuario_id\`, \`permissao_id\`)
SELECT 1, id FROM \`permissoes\`;

-- Solicitações
INSERT OR IGNORE INTO \`solicitacoes\` (\`numero\`, \`vendedor_id\`, \`cliente_id\`, \`data_solicitacao\`, \`situacao\`) VALUES
('SOL001', 1, 1, '2023-12-15', 'Pendente'),
('SOL002', 2, 2, '2023-12-16', 'Aprovada'),
('SOL003', 1, 3, '2023-12-17', 'Cancelada');

-- Resíduos
INSERT OR IGNORE INTO \`residuos\` (\`data_movimento\`, \`item\`, \`numero_documento\`, \`valor_pago\`) VALUES
('2023-12-10', 'Retalhos', 'RES001', 50.00),
('2023-12-12', 'Embalagens', 'RES002', 25.50),
('2023-12-14', 'Outros', 'RES003', 15.00);

-- Update relationships
UPDATE \`rotas\` SET \`praca_id\` = 1 WHERE \`id\` = 1;
UPDATE \`rotas\` SET \`praca_id\` = 2 WHERE \`id\` = 2;

UPDATE \`clientes\` SET \`praca_id\` = 1, \`tabela_preco\` = 'A' WHERE \`id\` = 1;
UPDATE \`clientes\` SET \`praca_id\` = 2, \`tabela_preco\` = 'B' WHERE \`id\` = 2;

-- Re-enable Foreign Key checks
PRAGMA foreign_keys = ON;
`;
