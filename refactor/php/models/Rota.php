<?php
class Rota {
    private $conn;
    private $table_name = "Rota";

    public $rota;
    public $bair;
    public $nome;

    public function __construct($db) {
        $this->conn = $db;
    }

    function read() {
        $query = "SELECT DISTINCT Rota, Nome FROM " . $this->table_name . " ORDER BY Nome";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
    
    function readBairrosByRota() {
        $query = "SELECT Bair, Nome FROM " . $this->table_name . " WHERE Rota = :rota ORDER BY Nome";
        $stmt = $this->conn->prepare($query);
        
        $this->rota=htmlspecialchars(strip_tags($this->rota));
        $stmt->bindParam(":rota", $this->rota);
        
        $stmt->execute();
        return $stmt;
    }
}
?>