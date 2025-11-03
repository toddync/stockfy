<?php

class Permissao {
    private $conn;
    private $table_name = "permissoes";
    private $user_permission_table = "usuario_permissoes";

    public $id;
    public $chave;
    public $descricao;
    public $usuario_id;
    public $permissao_id;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET chave=:chave, descricao=:descricao";

        $stmt = $this->conn->prepare($query);

        $this->chave = htmlspecialchars(strip_tags($this->chave));
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));

        $stmt->bindParam(":chave", $this->chave);
        $stmt->bindParam(":descricao", $this->descricao);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT id, chave, descricao
                  FROM " . $this->table_name . "
                  ORDER BY chave ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    public function readOne() {
        $query = "SELECT id, chave, descricao
                  FROM " . $this->table_name . "
                  WHERE chave = :chave
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":chave", $this->chave);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->id = $row['id'];
            $this->chave = $row['chave'];
            $this->descricao = $row['descricao'];
            return true;
        }
        return false;
    }

    public function assignPermissionToUser() {
        $query = "INSERT INTO " . $this->user_permission_table . "
                  SET usuario_id=:usuario_id, permissao_id=:permissao_id";

        $stmt = $this->conn->prepare($query);

        $this->usuario_id = htmlspecialchars(strip_tags($this->usuario_id));
        $this->permissao_id = htmlspecialchars(strip_tags($this->permissao_id));

        $stmt->bindParam(":usuario_id", $this->usuario_id);
        $stmt->bindParam(":permissao_id", $this->permissao_id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function removePermissionFromUser() {
        $query = "DELETE FROM " . $this->user_permission_table . "
                  WHERE usuario_id = :usuario_id AND permissao_id = :permissao_id";

        $stmt = $this->conn->prepare($query);

        $this->usuario_id = htmlspecialchars(strip_tags($this->usuario_id));
        $this->permissao_id = htmlspecialchars(strip_tags($this->permissao_id));

        $stmt->bindParam(":usuario_id", $this->usuario_id);
        $stmt->bindParam(":permissao_id", $this->permissao_id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function getUserPermissions($usuario_id) {
        $query = "SELECT p.chave, p.descricao
                  FROM " . $this->user_permission_table . " up
                  JOIN " . $this->table_name . " p ON up.permissao_id = p.id
                  WHERE up.usuario_id = :usuario_id";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":usuario_id", $usuario_id);
        $stmt->execute();

        return $stmt;
    }
}