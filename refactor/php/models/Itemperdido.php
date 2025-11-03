<?php

class Itemperdido {
    private $conn;
    private $table_name = "Itemperdido";

    public $Pedido;
    public $Codart;
    public $Descricao;
    public $Qtdsai;
    public $Qtdret;
    public $Precus;
    public $Preven;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT
                    i.Pedido, i.Codart, i.Descricao, i.Qtdsai, i.Qtdret, i.Precus, i.Preven
                  FROM
                    " . $this->table_name . " i
                  ORDER BY
                    i.Pedido DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readByPedido() {
        $query = "SELECT
                    i.Pedido, i.Codart, i.Descricao, i.Qtdsai, i.Qtdret, i.Precus, i.Preven
                  FROM
                    " . $this->table_name . " i
                  WHERE
                    i.Pedido = ?
                  ORDER BY
                    i.Codart ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->Pedido);
        $stmt->execute();
        return $stmt;
    }

    public function update() {
        $query = "UPDATE
                    " . $this->table_name . "
                  SET
                    Descricao = :Descricao,
                    Qtdsai = :Qtdsai,
                    Qtdret = :Qtdret,
                    Precus = :Precus,
                    Preven = :Preven
                  WHERE
                    Pedido = :Pedido AND Codart = :Codart";

        $stmt = $this->conn->prepare($query);

        $this->Descricao = htmlspecialchars(strip_tags($this->Descricao));
        $this->Qtdsai = htmlspecialchars(strip_tags($this->Qtdsai));
        $this->Qtdret = htmlspecialchars(strip_tags($this->Qtdret));
        $this->Precus = htmlspecialchars(strip_tags($this->Precus));
        $this->Preven = htmlspecialchars(strip_tags($this->Preven));
        $this->Pedido = htmlspecialchars(strip_tags($this->Pedido));
        $this->Codart = htmlspecialchars(strip_tags($this->Codart));

        $stmt->bindParam(':Descricao', $this->Descricao);
        $stmt->bindParam(':Qtdsai', $this->Qtdsai);
        $stmt->bindParam(':Qtdret', $this->Qtdret);
        $stmt->bindParam(':Precus', $this->Precus);
        $stmt->bindParam(':Preven', $this->Preven);
        $stmt->bindParam(':Pedido', $this->Pedido);
        $stmt->bindParam(':Codart', $this->Codart);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}