<?php

class Unidade {
    private $conn;
    private $table_name = "unidades";

    public $id;
    public $codigo;
    public $descricao;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Ler unidades
    public function read() {
        $query = "SELECT id, codigo, descricao FROM " . $this->table_name . " ORDER BY descricao";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Criar unidade
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET codigo=:codigo, descricao=:descricao";
        $stmt = $this->conn->prepare($query);

        $this->codigo = htmlspecialchars(strip_tags($this->codigo));
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));

        $stmt->bindParam(":codigo", $this->codigo);
        $stmt->bindParam(":descricao", $this->descricao);

        if ($stmt->execute()) {
            $this->id = $this->conn->lastInsertId();
            return true;
        }
        return false;
    }

    // Ler uma única unidade
    public function readOne() {
        $query = "SELECT id, codigo, descricao FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            $this->codigo = $row['codigo'];
            $this->descricao = $row['descricao'];
            return true;
        }
        return false;
    }

    // Atualizar unidade
    public function update() {
        $query = "UPDATE " . $this->table_name . " SET codigo=:codigo, descricao=:descricao WHERE id=:id";
        $stmt = $this->conn->prepare($query);

        $this->codigo = htmlspecialchars(strip_tags($this->codigo));
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':codigo', $this->codigo);
        $stmt->bindParam(':descricao', $this->descricao);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Deletar unidade
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