<?php

class ContagemModel {
    private $conn;
    private $table_name = "CONTAGEM";

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getContagemByDate($data) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Datcont = :datcont ORDER BY Codigo";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":datcont", $data);
        $stmt->execute();
        return $stmt;
    }

    public function deleteContagemByDate($data) {
        $query = "DELETE FROM " . $this->table_name . " WHERE Datcont = :datcont";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":datcont", $data);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function insertContagem($data, $tipo, $codigo, $grupo, $descricao, $inicial, $sacol, $preco) {
        $query = "INSERT INTO " . $this->table_name . " (DATCONT, TIPO, CODIGO, GRUPO, DESCRICAO, INICIAL, SACOL, PRECO) VALUES (:datcont, :tipo, :codigo, :grupo, :descricao, :inicial, :sacol, :preco)";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":datcont", $data);
        $stmt->bindParam(":tipo", $tipo);
        $stmt->bindParam(":codigo", $codigo);
        $stmt->bindParam(":grupo", $grupo);
        $stmt->bindParam(":descricao", $descricao);
        $stmt->bindParam(":inicial", $inicial);
        $stmt->bindParam(":sacol", $sacol);
        $stmt->bindParam(":preco", $preco);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function getArtigoInContagem($data, $codigo) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Datcont = :datcont AND Codigo = :codigo AND Tipo = '2'";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":datcont", $data);
        $stmt->bindParam(":codigo", $codigo);
        $stmt->execute();
        return $stmt;
    }

    public function updateArtigoInContagem($data, $codigo, $inicial, $preco) {
        $query = "UPDATE " . $this->table_name . " SET INICIAL = :inicial, PRECO = :preco WHERE Datcont = :datcont AND Codigo = :codigo AND Tipo = '2'";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":inicial", $inicial);
        $stmt->bindParam(":preco", $preco);
        $stmt->bindParam(":datcont", $data);
        $stmt->bindParam(":codigo", $codigo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function updateSacolInContagem($data, $codigo, $sacol) {
        $query = "UPDATE " . $this->table_name . " SET SACOL = :sacol WHERE Datcont = :datcont AND Codigo = :codigo AND Tipo = '2'";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":sacol", $sacol);
        $stmt->bindParam(":datcont", $data);
        $stmt->bindParam(":codigo", $codigo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}