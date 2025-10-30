<?php
class Vendedor {
    private $conn;
    private $table_name = "vendedores"; // Assumindo que a tabela se chamará 'vendedores' no novo DB

    public $codven;
    public $nome;

    public function __construct($db) {
        $this->conn = $db;
    }

    function readOne() {
        $query = "SELECT
                    codven, nome
                FROM
                    " . $this->table_name . "
                WHERE
                    codven = ?
                LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->codven);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->codven = $row['codven'];
            $this->nome = $row['nome'];
            return true;
        }
        return false;
    }
}
?>