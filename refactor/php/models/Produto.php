<?php

class Produto {
    private $conn;
    private $table_name = "produtos";

    public $id;
    public $descricao;
    public $codigo_barras;
    public $grupo_id;
    public $preco_custo;
    public $preco_venda;
    public $estoque_atual;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    descricao = :descricao,
                    codigo_barras = :codigo_barras,
                    grupo_id = :grupo_id,
                    preco_custo = :preco_custo,
                    preco_venda = :preco_venda,
                    estoque_atual = :estoque_atual";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->codigo_barras = htmlspecialchars(strip_tags($this->codigo_barras));
        $this->grupo_id = htmlspecialchars(strip_tags($this->grupo_id));
        $this->preco_custo = htmlspecialchars(strip_tags($this->preco_custo));
        $this->preco_venda = htmlspecialchars(strip_tags($this->preco_venda));
        $this->estoque_atual = htmlspecialchars(strip_tags($this->estoque_atual));

        // Bind values
        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":codigo_barras", $this->codigo_barras);
        $stmt->bindParam(":grupo_id", $this->grupo_id);
        $stmt->bindParam(":preco_custo", $this->preco_custo);
        $stmt->bindParam(":preco_venda", $this->preco_venda);
        $stmt->bindParam(":estoque_atual", $this->estoque_atual);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function readAll() {
        $query = "SELECT
                    p.id, p.descricao, p.codigo_barras, p.grupo_id, p.preco_custo,
                    p.preco_venda, p.estoque_atual, pg.descricao as grupo_descricao
                  FROM
                    " . $this->table_name . " p
                  LEFT JOIN
                    produto_grupos pg
                  ON
                    p.grupo_id = pg.id
                  ORDER BY
                    p.descricao ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readOne() {
        $query = "SELECT
                    p.id, p.descricao, p.codigo_barras, p.grupo_id, p.preco_custo,
                    p.preco_venda, p.estoque_atual, pg.descricao as grupo_descricao
                  FROM
                    " . $this->table_name . " p
                  LEFT JOIN
                    produto_grupos pg
                  ON
                    p.grupo_id = pg.id
                  WHERE
                    p.id = ?
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->descricao = $row['descricao'];
            $this->codigo_barras = $row['codigo_barras'];
            $this->grupo_id = $row['grupo_id'];
            $this->preco_custo = $row['preco_custo'];
            $this->preco_venda = $row['preco_venda'];
            $this->estoque_atual = $row['estoque_atual'];
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    descricao = :descricao,
                    codigo_barras = :codigo_barras,
                    grupo_id = :grupo_id,
                    preco_custo = :preco_custo,
                    preco_venda = :preco_venda,
                    estoque_atual = :estoque_atual
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->codigo_barras = htmlspecialchars(strip_tags($this->codigo_barras));
        $this->grupo_id = htmlspecialchars(strip_tags($this->grupo_id));
        $this->preco_custo = htmlspecialchars(strip_tags($this->preco_custo));
        $this->preco_venda = htmlspecialchars(strip_tags($this->preco_venda));
        $this->estoque_atual = htmlspecialchars(strip_tags($this->estoque_atual));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind values
        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":codigo_barras", $this->codigo_barras);
        $stmt->bindParam(":grupo_id", $this->grupo_id);
        $stmt->bindParam(":preco_custo", $this->preco_custo);
        $stmt->bindParam(":preco_venda", $this->preco_venda);
        $stmt->bindParam(":estoque_atual", $this->estoque_atual);
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
}