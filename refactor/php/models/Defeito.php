<?php

require_once __DIR__ . '/../config/database.php';

class Defeito {
    private $conn;
    private $table_name = "Defeito";

    public $Numnot;
    public $Datnot;
    public $Valnot;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT Numnot, Datnot, Valnot FROM " . $this->table_name . " ORDER BY Datnot DESC, Numnot DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readFiltered($dataInicio = null, $dataFim = null, $tipoPesquisa = null, $termoPesquisa = null) {
        $conditions = [];
        $params = [];
        $types = '';
        $join_query = "";
        $select_fields = "d.Numnot, d.Datnot, d.Valnot";

        $query = "SELECT " . $select_fields . " FROM " . $this->table_name . " d";

        if ($dataInicio && $dataFim) {
            $conditions[] = "d.Datnot >= ?";
            $params[] = $dataInicio;
            $types .= 's';
            $conditions[] = "d.Datnot <= ?";
            $params[] = $dataFim;
            $types .= 's';
        }

        if ($termoPesquisa) {
            if ($tipoPesquisa === 'Numnot') {
                $conditions[] = "d.Numnot LIKE ?";
                $params[] = "%" . $termoPesquisa . "%";
                $types .= 's';
            } elseif ($tipoPesquisa === 'Codart' || $tipoPesquisa === 'Descricao') {
                $join_query = " JOIN Itemdefeito id ON d.Numnot = id.Numnot";
                $select_fields .= ", id.Codart, id.Descricao, id.Quant, id.Precus";
                $query = "SELECT " . $select_fields . " FROM " . $this->table_name . " d" . $join_query;

                if ($tipoPesquisa === 'Codart') {
                    $conditions[] = "id.Codart LIKE ?";
                    $params[] = "%" . $termoPesquisa . "%";
                    $types .= 's';
                } elseif ($tipoPesquisa === 'Descricao') {
                    $conditions[] = "id.Descricao LIKE ?";
                    $params[] = "%" . $termoPesquisa . "%";
                    $types .= 's';
                }
            }
        }

        if (count($conditions) > 0) {
            $query .= " WHERE " . implode(" AND ", $conditions);
        }
        $query .= " ORDER BY d.Datnot DESC, d.Numnot DESC";

        $stmt = $this->conn->prepare($query);

        if ($stmt === false) {
            error_log("Erro na preparação da query: " . $this->conn->error);
            return false;
        }

        if (count($params) > 0) {
            $stmt->bind_param($types, ...$params);
        }
        
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " (Numnot, Datnot, Valnot) VALUES (?, ?, ?)";
        $stmt = $this->conn->prepare($query);

        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));
        $this->Datnot = htmlspecialchars(strip_tags($this->Datnot));
        $this->Valnot = htmlspecialchars(strip_tags($this->Valnot));

        $stmt->bind_param("ssd", $this->Numnot, $this->Datnot, $this->Valnot);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " SET Datnot = ?, Valnot = ? WHERE Numnot = ?";
        $stmt = $this->conn->prepare($query);

        $this->Datnot = htmlspecialchars(strip_tags($this->Datnot));
        $this->Valnot = htmlspecialchars(strip_tags($this->Valnot));
        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));

        $stmt->bind_param("sds", $this->Datnot, $this->Valnot, $this->Numnot);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE Numnot = ?";
        $stmt = $this->conn->prepare($query);

        $this->Numnot = htmlspecialchars(strip_tags($this->Numnot));

        $stmt->bind_param("s", $this->Numnot);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function readOne() {
        $query = "SELECT Numnot, Datnot, Valnot FROM " . $this->table_name . " WHERE Numnot = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bind_param("s", $this->Numnot);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        if ($row) {
            $this->Numnot = $row['Numnot'];
            $this->Datnot = $row['Datnot'];
            $this->Valnot = $row['Valnot'];
            return true;
        }
        return false;
    }
}