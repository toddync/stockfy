<?php

require_once __DIR__ . '/../config/database.php';

class ItemDefeito {
    private $conn;
    private $table_name = "Itemdefeito";

    public $Numnot;
    public $Codart;
    public $Descricao;
    public $Quant;
    public $Precus;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT Numnot, Codart, Descricao, Quant, Precus FROM " . $this->table_name . " ORDER BY Numnot, Codart";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readByNumnot() {
        $query = "SELECT Numnot, Codart, Descricao, Quant, Precus FROM " . $this->table_name . " WHERE Numnot = ? ORDER BY Codart";
        $stmt = $this->conn->prepare($query);
        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));
        $stmt->bind_param("s", $this->Numnot);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " (Numnot, Codart, Descricao, Quant, Precus) VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($query);

        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));
        $this->Codart = htmlspecialchars(strip_tags($this->Codart));
        $this->Descricao = htmlspecialchars(strip_tags($this->Descricao));
        $this->Quant = htmlspecialchars(strip_tags($this->Quant));
        $this->Precus = htmlspecialchars(strip_tags($this->Precus));

        $stmt->bind_param("sssid", $this->Numnot, $this->Codart, $this->Descricao, $this->Quant, $this->Precus);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " SET Descricao = ?, Quant = ?, Precus = ? WHERE Numnot = ? AND Codart = ?";
        $stmt = $this->conn->prepare($query);

        $this->Descricao = htmlspecialchars(strip_tags($this->Descricao));
        $this->Quant = htmlspecialchars(strip_tags($this->Quant));
        $this->Precus = htmlspecialchars(strip_tags($this->Precus));
        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));
        $this->Codart = htmlspecialchars(strip_tags($this->Codart));

        $stmt->bind_param("sddss", $this->Descricao, $this->Quant, $this->Precus, $this->Numnot, $this->Codart);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE Numnot = ? AND Codart = ?";
        $stmt = $this->conn->prepare($query);

        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));
        $this->Codart = htmlspecialchars(strip_tags($this->Codart));

        $stmt->bind_param("ss", $this->Numnot, $this->Codart);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}