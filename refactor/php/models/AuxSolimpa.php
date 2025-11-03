<?php
class AuxSolimpa {
    private $conn;
    private $table_name = "Auxsolimpa";

    public $codart;
    public $descricao;

    public function __construct($db){
        $this->conn = $db;
    }

    function read() {
        $query = "SELECT codart, descricao FROM " . $this->table_name . " ORDER BY codart";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function readOne() {
        $query = "SELECT codart, descricao FROM " . $this->table_name . " WHERE codart = :codart LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":codart", $this->codart);
        $stmt->execute();
        return $stmt;
    }

    function create() {
        $query = "INSERT INTO " . $this->table_name . " (codart, descricao) VALUES (:codart, :descricao)";
        $stmt = $this->conn->prepare($query);

        $this->codart = htmlspecialchars(strip_tags($this->codart));
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));

        $stmt->bindParam(":codart", $this->codart);
        $stmt->bindParam(":descricao", $this->descricao);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE codart = :codart";
        $stmt = $this->conn->prepare($query);

        $this->codart = htmlspecialchars(strip_tags($this->codart));
        $stmt->bindParam(":codart", $this->codart);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function emptyTable() {
        $query = "DELETE FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function countAll() {
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row['total_rows'];
    }
}
?>