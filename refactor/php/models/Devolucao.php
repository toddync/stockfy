<?php

class Devolucao {
    private $conn;
    private $table_name = "devolucoes";

    public $id; // NUMNOT
    public $dataNota; // DATNOT
    public $valorNota; // VALNOT
    public $romaneioNota; // ROMNOT
    public $vendedorId; // CODVEN
    public $dataBase; // DATBAS
    public $clienteId; // CLIENOT

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para ler todas as devoluções
    public function read() {
        $query = "SELECT id, data_nota, valor_nota, romaneio_nota, vendedor_id, data_base, cliente_id FROM " . $this->table_name . " ORDER BY id DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler uma única devolução pelo ID
    public function readOne() {
        $query = "SELECT id, data_nota, valor_nota, romaneio_nota, vendedor_id, data_base, cliente_id FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->dataNota = $row['data_nota'];
            $this->valorNota = $row['valor_nota'];
            $this->romaneioNota = $row['romaneio_nota'];
            $this->vendedorId = $row['vendedor_id'];
            $this->dataBase = $row['data_base'];
            $this->clienteId = $row['cliente_id'];
            return true;
        }
        return false;
    }

    // Método para criar uma devolução
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET id=:id, data_nota=:dataNota, valor_nota=:valorNota, romaneio_nota=:romaneioNota, vendedor_id=:vendedorId, data_base=:dataBase, cliente_id=:clienteId";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->dataNota = htmlspecialchars(strip_tags($this->dataNota));
        $this->valorNota = htmlspecialchars(strip_tags($this->valorNota));
        $this->romaneioNota = htmlspecialchars(strip_tags($this->romaneioNota));
        $this->vendedorId = htmlspecialchars(strip_tags($this->vendedorId));
        $this->dataBase = htmlspecialchars(strip_tags($this->dataBase));
        $this->clienteId = htmlspecialchars(strip_tags($this->clienteId));

        // Bind dos valores
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":dataNota", $this->dataNota);
        $stmt->bindParam(":valorNota", $this->valorNota);
        $stmt->bindParam(":romaneioNota", $this->romaneioNota);
        $stmt->bindParam(":vendedorId", $this->vendedorId);
        $stmt->bindParam(":dataBase", $this->dataBase);
        $stmt->bindParam(":clienteId", $this->clienteId);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para atualizar uma devolução
    public function update() {
        $query = "UPDATE " . $this->table_name . " SET data_nota=:dataNota, valor_nota=:valorNota WHERE id = :id";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->dataNota = htmlspecialchars(strip_tags($this->dataNota));
        $this->valorNota = htmlspecialchars(strip_tags($this->valorNota));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Bind dos valores
        $stmt->bindParam(":dataNota", $this->dataNota);
        $stmt->bindParam(":valorNota", $this->valorNota);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar uma devolução
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

    // Método para gerar o próximo ID de devolução (similar a Geracod no Pascal)
    public function generateNextId() {
        $query = "SELECT MAX(id) as max_id FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $maxId = $row['max_id'];
        return str_pad((int)$maxId + 1, 5, '0', STR_PAD_LEFT); // Assumindo 5 dígitos, como no Pascal
    }
}