<?php

class Usuario {
    private $conn;
    private $table_name = "usuarios";

    public $id;
    public $nome;
    public $senha_hash;
    public $ativo;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET nome=:nome, senha_hash=:senha_hash, ativo=:ativo";

        $stmt = $this->conn->prepare($query);

        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $this->senha_hash = htmlspecialchars(strip_tags($this->senha_hash));
        $this->ativo = htmlspecialchars(strip_tags($this->ativo));

        $stmt->bindParam(":nome", $this->nome);
        $stmt->bindParam(":senha_hash", $this->senha_hash);
        $stmt->bindParam(":ativo", $this->ativo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT id, nome, senha_hash, ativo
                  FROM " . $this->table_name . "
                  ORDER BY nome ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    public function readOne() {
        $query = "SELECT id, nome, senha_hash, ativo
                  FROM " . $this->table_name . "
                  WHERE nome = :nome
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":nome", $this->nome);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->id = $row['id'];
            $this->nome = $row['nome'];
            $this->senha_hash = $row['senha_hash'];
            $this->ativo = $row['ativo'];
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET senha_hash = :senha_hash, ativo = :ativo
                  WHERE nome = :nome";

        $stmt = $this->conn->prepare($query);

        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $this->senha_hash = htmlspecialchars(strip_tags($this->senha_hash));
        $this->ativo = htmlspecialchars(strip_tags($this->ativo));

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':senha_hash', $this->senha_hash);
        $stmt->bindParam(':ativo', $this->ativo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE nome = :nome";

        $stmt = $this->conn->prepare($query);
        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $stmt->bindParam(':nome', $this->nome);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}