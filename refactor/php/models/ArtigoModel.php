<?php

class ArtigoModel {
    private $conn;
    private $table_name = "ARTIGO";

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getAllArtigos() {
        $query = "SELECT * FROM " . $this->table_name . " ORDER BY Codigo";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function getArtigoByCodigo($codigo) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Codigo = :codigo";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":codigo", $codigo);
        $stmt->execute();
        return $stmt;
    }
}