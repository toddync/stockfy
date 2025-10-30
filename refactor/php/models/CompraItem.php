<?php
class CompraItem {
    private $conn;
    private $table_name = "compra_itens";

    public $id;
    public $compra_id;
    public $produto_id;
    public $quantidade;
    public $preco_unitario;
    public $valor_total;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para criar um novo item de compra
    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    compra_id=:compra_id,
                    produto_id=:produto_id,
                    quantidade=:quantidade,
                    preco_unitario=:preco_unitario,
                    valor_total=:valor_total";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->compra_id = htmlspecialchars(strip_tags($this->compra_id));
        $this->produto_id = htmlspecialchars(strip_tags($this->produto_id));
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->preco_unitario = htmlspecialchars(strip_tags($this->preco_unitario));
        $this->valor_total = htmlspecialchars(strip_tags($this->valor_total));

        // Vincular valores
        $stmt->bindParam(":compra_id", $this->compra_id);
        $stmt->bindParam(":produto_id", $this->produto_id);
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":preco_unitario", $this->preco_unitario);
        $stmt->bindParam(":valor_total", $this->valor_total);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para ler itens de compra (pode ser por compra_id)
    public function read() {
        $query = "SELECT
                    ci.id, ci.compra_id, ci.produto_id, ci.quantidade, ci.preco_unitario, ci.valor_total,
                    p.descricao as produto_descricao
                  FROM
                    " . $this->table_name . " ci
                  LEFT JOIN
                    produtos p ON ci.produto_id = p.id
                  WHERE
                    ci.compra_id = ?
                  ORDER BY
                    ci.id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->compra_id);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler um único item de compra
    public function readOne() {
        $query = "SELECT
                    ci.id, ci.compra_id, ci.produto_id, ci.quantidade, ci.preco_unitario, ci.valor_total,
                    p.descricao as produto_descricao
                  FROM
                    " . $this->table_name . " ci
                  LEFT JOIN
                    produtos p ON ci.produto_id = p.id
                  WHERE
                    ci.id = ?
                  LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->compra_id = $row['compra_id'];
            $this->produto_id = $row['produto_id'];
            $this->quantidade = $row['quantidade'];
            $this->preco_unitario = $row['preco_unitario'];
            $this->valor_total = $row['valor_total'];
            return true;
        }
        return false;
    }

    // Método para atualizar um item de compra
    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    quantidade=:quantidade,
                    preco_unitario=:preco_unitario,
                    valor_total=:valor_total
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->preco_unitario = htmlspecialchars(strip_tags($this->preco_unitario));
        $this->valor_total = htmlspecialchars(strip_tags($this->valor_total));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Vincular valores
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":preco_unitario", $this->preco_unitario);
        $stmt->bindParam(":valor_total", $this->valor_total);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar um item de compra
    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $this->id = htmlspecialchars(strip_tags($this->id));
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>