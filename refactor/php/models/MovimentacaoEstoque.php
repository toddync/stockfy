<?php

class MovimentacaoEstoque {
    private $conn;
    private $table_name = "movimentacoes_estoque";

    public $id;
    public $numero_documento;
    public $data_movimentacao;
    public $tipo;
    public $produto_id;
    public $descricao_produto;
    public $quantidade;
    public $preco_custo;
    public $data_registro;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    numero_documento = :numero_documento,
                    data_movimentacao = :data_movimentacao,
                    tipo = :tipo,
                    produto_id = :produto_id,
                    descricao_produto = :descricao_produto,
                    quantidade = :quantidade,
                    preco_custo = :preco_custo";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->numero_documento = htmlspecialchars(strip_tags($this->numero_documento));
        $this->data_movimentacao = htmlspecialchars(strip_tags($this->data_movimentacao));
        $this->tipo = htmlspecialchars(strip_tags($this->tipo));
        $this->produto_id = htmlspecialchars(strip_tags($this->produto_id));
        $this->descricao_produto = htmlspecialchars(strip_tags($this->descricao_produto));
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->preco_custo = htmlspecialchars(strip_tags($this->preco_custo));

        // Bind values
        $stmt->bindParam(":numero_documento", $this->numero_documento);
        $stmt->bindParam(":data_movimentacao", $this->data_movimentacao);
        $stmt->bindParam(":tipo", $this->tipo);
        $stmt->bindParam(":produto_id", $this->produto_id);
        $stmt->bindParam(":descricao_produto", $this->descricao_produto);
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":preco_custo", $this->preco_custo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT
                    id, numero_documento, data_movimentacao, tipo, produto_id,
                    descricao_produto, quantidade, preco_custo, data_registro
                  FROM
                    " . $this->table_name . "
                  ORDER BY
                    data_movimentacao DESC, numero_documento DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readOne() {
        $query = "SELECT
                    id, numero_documento, data_movimentacao, tipo, produto_id,
                    descricao_produto, quantidade, preco_custo, data_registro
                  FROM
                    " . $this->table_name . "
                  WHERE
                    id = ?
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->numero_documento = $row['numero_documento'];
            $this->data_movimentacao = $row['data_movimentacao'];
            $this->tipo = $row['tipo'];
            $this->produto_id = $row['produto_id'];
            $this->descricao_produto = $row['descricao_produto'];
            $this->quantidade = $row['quantidade'];
            $this->preco_custo = $row['preco_custo'];
            $this->data_registro = $row['data_registro'];
            return true;
        }
        return false;
    }

    public function readByNumeroDocumento() {
        $query = "SELECT
                    id, numero_documento, data_movimentacao, tipo, produto_id,
                    descricao_produto, quantidade, preco_custo, data_registro
                  FROM
                    " . $this->table_name . "
                  WHERE
                    numero_documento = ?
                  ORDER BY
                    id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->numero_documento);
        $stmt->execute();
        return $stmt;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    numero_documento = :numero_documento,
                    data_movimentacao = :data_movimentacao,
                    tipo = :tipo,
                    produto_id = :produto_id,
                    descricao_produto = :descricao_produto,
                    quantidade = :quantidade,
                    preco_custo = :preco_custo
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->numero_documento = htmlspecialchars(strip_tags($this->numero_documento));
        $this->data_movimentacao = htmlspecialchars(strip_tags($this->data_movimentacao));
        $this->tipo = htmlspecialchars(strip_tags($this->tipo));
        $this->produto_id = htmlspecialchars(strip_tags($this->produto_id));
        $this->descricao_produto = htmlspecialchars(strip_tags($this->descricao_produto));
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->preco_custo = htmlspecialchars(strip_tags($this->preco_custo));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind values
        $stmt->bindParam(":numero_documento", $this->numero_documento);
        $stmt->bindParam(":data_movimentacao", $this->data_movimentacao);
        $stmt->bindParam(":tipo", $this->tipo);
        $stmt->bindParam(":produto_id", $this->produto_id);
        $stmt->bindParam(":descricao_produto", $this->descricao_produto);
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":preco_custo", $this->preco_custo);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

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

    public function deleteByNumeroDocumento() {
        $query = "DELETE FROM " . $this->table_name . " WHERE numero_documento = ?";
        $stmt = $this->conn->prepare($query);
        $this->numero_documento = htmlspecialchars(strip_tags($this->numero_documento));
        $stmt->bindParam(1, $this->numero_documento);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function generateNumeroDocumento() {
        $query = "SELECT MAX(CAST(numero_documento AS UNSIGNED)) as max_num FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $max_num = $row['max_num'];
        return str_pad($max_num + 1, 6, '0', STR_PAD_LEFT);
    }

    public function calculateTotalValueByNumeroDocumento() {
        $query = "SELECT SUM(quantidade * preco_custo) as total_value
                  FROM " . $this->table_name . "
                  WHERE numero_documento = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->numero_documento);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row['total_value'];
    }
}