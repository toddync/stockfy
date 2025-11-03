<?php

class PedidoModel {
    private $conn;
    private $table_name = "PEDIDO";

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getPedidosByDateAndStatus($dataFim, $status) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Base <= :dataFim AND Situ = :status ORDER BY Pedido";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":dataFim", $dataFim);
        $stmt->bindParam(":status", $status);
        $stmt->execute();
        return $stmt;
    }
}