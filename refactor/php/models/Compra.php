<?php
class Compra {
    private $conn;
    private $table_name = "compras";

    public $id;
    public $fornecedor_id;
    public $data_pedido;
    public $data_entrega;
    public $valor_total;
    public $desconto;
    public $frete;
    public $observacoes;
    public $status;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para criar uma nova compra
    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    fornecedor_id=:fornecedor_id,
                    data_pedido=:data_pedido,
                    data_entrega=:data_entrega,
                    valor_total=:valor_total,
                    desconto=:desconto,
                    frete=:frete,
                    observacoes=:observacoes,
                    status=:status";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->fornecedor_id = htmlspecialchars(strip_tags($this->fornecedor_id));
        $this->data_pedido = htmlspecialchars(strip_tags($this->data_pedido));
        $this->data_entrega = htmlspecialchars(strip_tags($this->data_entrega));
        $this->valor_total = htmlspecialchars(strip_tags($this->valor_total));
        $this->desconto = htmlspecialchars(strip_tags($this->desconto));
        $this->frete = htmlspecialchars(strip_tags($this->frete));
        $this->observacoes = htmlspecialchars(strip_tags($this->observacoes));
        $this->status = htmlspecialchars(strip_tags($this->status));

        // Vincular valores
        $stmt->bindParam(":fornecedor_id", $this->fornecedor_id);
        $stmt->bindParam(":data_pedido", $this->data_pedido);
        $stmt->bindParam(":data_entrega", $this->data_entrega);
        $stmt->bindParam(":valor_total", $this->valor_total);
        $stmt->bindParam(":desconto", $this->desconto);
        $stmt->bindParam(":frete", $this->frete);
        $stmt->bindParam(":observacoes", $this->observacoes);
        $stmt->bindParam(":status", $this->status);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para ler todas as compras
    public function read() {
        $query = "SELECT
                    c.id, c.fornecedor_id, c.data_pedido, c.data_entrega, c.valor_total,
                    c.desconto, c.frete, c.observacoes, c.status, f.razao_social as fornecedor_nome
                  FROM
                    " . $this->table_name . " c
                  LEFT JOIN
                    fornecedores f ON c.fornecedor_id = f.id
                  ORDER BY
                    c.data_pedido DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler uma única compra
    public function readOne() {
        $query = "SELECT
                    c.id, c.fornecedor_id, c.data_pedido, c.data_entrega, c.valor_total,
                    c.desconto, c.frete, c.observacoes, c.status, f.razao_social as fornecedor_nome
                  FROM
                    " . $this->table_name . " c
                  LEFT JOIN
                    fornecedores f ON c.fornecedor_id = f.id
                  WHERE
                    c.id = ?
                  LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->fornecedor_id = $row['fornecedor_id'];
            $this->data_pedido = $row['data_pedido'];
            $this->data_entrega = $row['data_entrega'];
            $this->valor_total = $row['valor_total'];
            $this->desconto = $row['desconto'];
            $this->frete = $row['frete'];
            $this->observacoes = $row['observacoes'];
            $this->status = $row['status'];
            return true;
        }
        return false;
    }

    // Método para atualizar uma compra
    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    fornecedor_id=:fornecedor_id,
                    data_pedido=:data_pedido,
                    data_entrega=:data_entrega,
                    valor_total=:valor_total,
                    desconto=:desconto,
                    frete=:frete,
                    observacoes=:observacoes,
                    status=:status
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->fornecedor_id = htmlspecialchars(strip_tags($this->fornecedor_id));
        $this->data_pedido = htmlspecialchars(strip_tags($this->data_pedido));
        $this->data_entrega = htmlspecialchars(strip_tags($this->data_entrega));
        $this->valor_total = htmlspecialchars(strip_tags($this->valor_total));
        $this->desconto = htmlspecialchars(strip_tags($this->desconto));
        $this->frete = htmlspecialchars(strip_tags($this->frete));
        $this->observacoes = htmlspecialchars(strip_tags($this->observacoes));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Vincular valores
        $stmt->bindParam(":fornecedor_id", $this->fornecedor_id);
        $stmt->bindParam(":data_pedido", $this->data_pedido);
        $stmt->bindParam(":data_entrega", $this->data_entrega);
        $stmt->bindParam(":valor_total", $this->valor_total);
        $stmt->bindParam(":desconto", $this->desconto);
        $stmt->bindParam(":frete", $this->frete);
        $stmt->bindParam(":observacoes", $this->observacoes);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar uma compra
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