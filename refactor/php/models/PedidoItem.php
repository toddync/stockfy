<?php
class PedidoItem {
    private $conn;
    private $table_name = "pedido_itens";

    public $id;
    public $pedido_id;
    public $produto_id;
    public $quantidade;
    public $preco_unitario;
    public $valor_total;

    // Propriedades adicionais para JOINs
    public $descricao_produto;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Usado para buscar itens de um pedido específico
    public function readByPedidoId() {
        $query = "SELECT
                    pi.id, pi.pedido_id, pi.produto_id, p.descricao as descricao_produto,
                    pi.quantidade, pi.preco_unitario, pi.valor_total
                FROM
                    " . $this->table_name . " pi
                LEFT JOIN
                    produtos p ON pi.produto_id = p.id
                WHERE
                    pi.pedido_id = ?
                ORDER BY
                    p.descricao";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->pedido_id);
        $stmt->execute();

        return $stmt;
    }
}
?>