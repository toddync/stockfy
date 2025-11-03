<?php

class ItemPedido {
    private $conn;
    private $table_name = "ITEMPEDIDO";

    public $PEDIDO;
    public $CODART;
    public $DESCRICAO;
    public $QTDSAI;
    public $QTDRET;
    public $PRECUS;
    public $PREVEN;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getTableName() {
        return $this->table_name;
    }

    function read() {
        $query = "SELECT * FROM " . $this->table_name . " ORDER BY PEDIDO DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function readOne() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE PEDIDO = ? AND CODART = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->PEDIDO);
        $stmt->bindParam(2, $this->CODART);
        $stmt->execute();
        return $stmt;
    }

    function readByPedido() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE PEDIDO = ? ORDER BY CODART ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->PEDIDO);
        $stmt->execute();
        return $stmt;
    }

    function updateQuantidadeRetornada($pedido, $codart, $qtdret) {
        $query = "UPDATE " . $this->table_name . " SET QTDRET = :qtdret WHERE PEDIDO = :pedido AND CODART = :codart";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':qtdret', $qtdret);
        $stmt->bindParam(':pedido', $pedido);
        $stmt->bindParam(':codart', $codart);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function create() {
        $query = "INSERT INTO " . $this->table_name . " SET PEDIDO=:PEDIDO, CODART=:CODART, DESCRICAO=:DESCRICAO, QTDSAI=:QTDSAI, QTDRET=:QTDRET, PRECUS=:PRECUS, PREVEN=:PREVEN";
        $stmt = $this->conn->prepare($query);

        $this->PEDIDO=htmlspecialchars(strip_tags($this->PEDIDO));
        $this->CODART=htmlspecialchars(strip_tags($this->CODART));
        $this->DESCRICAO=htmlspecialchars(strip_tags($this->DESCRICAO));
        $this->QTDSAI=htmlspecialchars(strip_tags($this->QTDSAI));
        $this->QTDRET=htmlspecialchars(strip_tags($this->QTDRET));
        $this->PRECUS=htmlspecialchars(strip_tags($this->PRECUS));
        $this->PREVEN=htmlspecialchars(strip_tags($this->PREVEN));

        $stmt->bindParam(":PEDIDO", $this->PEDIDO);
        $stmt->bindParam(":CODART", $this->CODART);
        $stmt->bindParam(":DESCRICAO", $this->DESCRICAO);
        $stmt->bindParam(":QTDSAI", $this->QTDSAI);
        $stmt->bindParam(":QTDRET", $this->QTDRET);
        $stmt->bindParam(":PRECUS", $this->PRECUS);
        $stmt->bindParam(":PREVEN", $this->PREVEN);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function update() {
        $query = "UPDATE " . $this->table_name . " SET DESCRICAO=:DESCRICAO, QTDSAI=:QTDSAI, QTDRET=:QTDRET, PRECUS=:PRECUS, PREVEN=:PREVEN WHERE PEDIDO=:PEDIDO AND CODART=:CODART";
        $stmt = $this->conn->prepare($query);

        $this->PEDIDO=htmlspecialchars(strip_tags($this->PEDIDO));
        $this->CODART=htmlspecialchars(strip_tags($this->CODART));
        $this->DESCRICAO=htmlspecialchars(strip_tags($this->DESCRICAO));
        $this->QTDSAI=htmlspecialchars(strip_tags($this->QTDSAI));
        $this->QTDRET=htmlspecialchars(strip_tags($this->QTDRET));
        $this->PRECUS=htmlspecialchars(strip_tags($this->PRECUS));
        $this->PREVEN=htmlspecialchars(strip_tags($this->PREVEN));

        $stmt->bindParam(":PEDIDO", $this->PEDIDO);
        $stmt->bindParam(":CODART", $this->CODART);
        $stmt->bindParam(":DESCRICAO", $this->DESCRICAO);
        $stmt->bindParam(":QTDSAI", $this->QTDSAI);
        $stmt->bindParam(":QTDRET", $this->QTDRET);
        $stmt->bindParam(":PRECUS", $this->PRECUS);
        $stmt->bindParam(":PREVEN", $this->PREVEN);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE PEDIDO = ? AND CODART = ?";
        $stmt = $this->conn->prepare($query);
        $this->PEDIDO=htmlspecialchars(strip_tags($this->PEDIDO));
        $this->CODART=htmlspecialchars(strip_tags($this->CODART));
        $stmt->bindParam(1, $this->PEDIDO);
        $stmt->bindParam(2, $this->CODART);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>