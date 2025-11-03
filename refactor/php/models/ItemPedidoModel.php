<?php

class ItemPedidoModel {
    private $conn;
    private $table_name = "ITEMPEDIDO";

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getItemPedidosByPedido($pedido) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Pedido = :pedido ORDER BY Codart";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":pedido", $pedido);
        $stmt->execute();
        return $stmt;
    }
}