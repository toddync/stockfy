<?php
class Regulamento {
    private $conn;
    private $table_name = "regulamentos"; // Não é uma tabela real, mas um nome lógico para o serviço

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para buscar dados para o "Regulamento Velho"
    public function getRegulamentoVelho() {
        // Esta é uma simulação. A lógica real dependerá dos dados específicos
        // que o relatório "Regulamento Velho" exibia.
        // Pode envolver junções de tabelas como 'pedidos', 'clientes', 'produtos'.
        $query = "SELECT p.id as pedido_id, c.nome as cliente_nome, pr.descricao as produto_descricao, pi.quantidade, pi.preco_unitario
                  FROM pedidos p
                  JOIN clientes c ON p.cliente_id = c.id
                  JOIN pedido_itens pi ON p.id = pi.pedido_id
                  JOIN produtos pr ON pi.produto_id = pr.id
                  WHERE p.status = 'emitido' AND p.data_emissao < CURDATE() - INTERVAL 30 DAY
                  ORDER BY p.data_emissao DESC LIMIT 10";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para buscar dados para o "Regulamento Novo"
    public function getRegulamentoNovo() {
        // Simulação para "Regulamento Novo"
        $query = "SELECT p.id as pedido_id, c.nome as cliente_nome, pr.descricao as produto_descricao, pi.quantidade, pi.preco_unitario
                  FROM pedidos p
                  JOIN clientes c ON p.cliente_id = c.id
                  JOIN pedido_itens pi ON p.id = pi.pedido_id
                  JOIN produtos pr ON pi.produto_id = pr.id
                  WHERE p.status = 'emitido' AND p.data_emissao >= CURDATE() - INTERVAL 30 DAY
                  ORDER BY p.data_emissao DESC LIMIT 10";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para buscar dados para o "Regulamento de Depósito"
    public function getRegulamentoDeposito() {
        // Simulação para "Regulamento de Depósito"
        // Pode envolver dados de estoque ou movimentações
        $query = "SELECT pr.descricao as produto_descricao, pr.estoque_atual, me.quantidade as movimentacao_quantidade, me.tipo as movimentacao_tipo
                  FROM produtos pr
                  LEFT JOIN movimentacoes_estoque me ON pr.id = me.produto_id
                  WHERE pr.estoque_atual > 0
                  ORDER BY pr.descricao LIMIT 10";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para buscar dados para a "Ficha de Corte"
    public function getFichaCorte() {
        // Simulação para "Ficha de Corte"
        // Pode envolver detalhes de produtos, grupos, etc.
        $query = "SELECT pr.descricao as produto_descricao, pg.descricao as grupo_descricao, pr.preco_custo, pr.preco_venda
                  FROM produtos pr
                  JOIN produto_grupos pg ON pr.grupo_id = pg.id
                  ORDER BY pr.descricao LIMIT 10";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para buscar dados para "Facção"
    public function getFacao() {
        // Simulação para "Facção"
        // Pode envolver dados de produção, fornecedores, etc.
        $query = "SELECT f.razao_social as fornecedor_nome, pr.descricao as produto_descricao, SUM(ci.quantidade) as total_comprado
                  FROM fornecedores f
                  JOIN compras c ON f.id = c.fornecedor_id
                  JOIN compra_itens ci ON c.id = ci.compra_id
                  JOIN produtos pr ON ci.produto_id = pr.id
                  GROUP BY f.razao_social, pr.descricao
                  ORDER BY f.razao_social, pr.descricao LIMIT 10";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
?>