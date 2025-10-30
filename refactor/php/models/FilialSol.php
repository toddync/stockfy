<?php

class FilialSol {
    private $conn;
    private $table_name = "filiais"; // Assumindo o nome da tabela como 'filiais'

    public $id;
    public $nome;
    public $endereco;
    public $telefone;
    public $data_cadastro;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para ler filiais
    public function read() {
        $query = "SELECT id, nome, endereco, telefone, data_cadastro FROM " . $this->table_name . " ORDER BY nome ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler uma única filial
    public function readOne() {
        $query = "SELECT id, nome, endereco, telefone, data_cadastro FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        return $stmt;
    }

    // Método para criar filial
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET nome=:nome, endereco=:endereco, telefone=:telefone, data_cadastro=:data_cadastro";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $this->endereco = htmlspecialchars(strip_tags($this->endereco));
        $this->telefone = htmlspecialchars(strip_tags($this->telefone));
        $this->data_cadastro = htmlspecialchars(strip_tags($this->data_cadastro));

        // Bind dos valores
        $stmt->bindParam(":nome", $this->nome);
        $stmt->bindParam(":endereco", $this->endereco);
        $stmt->bindParam(":telefone", $this->telefone);
        $stmt->bindParam(":data_cadastro", $this->data_cadastro);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para atualizar filial
    public function update() {
        $query = "UPDATE " . $this->table_name . " SET nome=:nome, endereco=:endereco, telefone=:telefone WHERE id=:id";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $this->endereco = htmlspecialchars(strip_tags($this->endereco));
        $this->telefone = htmlspecialchars(strip_tags($this->telefone));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind dos valores
        $stmt->bindParam(":nome", $this->nome);
        $stmt->bindParam(":endereco", $this->endereco);
        $stmt->bindParam(":telefone", $this->telefone);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar filial
    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind do ID
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}