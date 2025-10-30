<?php
class Etiqueta {
    private $conn;
    private $table_name = "etiquetas"; // Assumindo que a tabela se chamará 'etiquetas' no novo DB

    public $idetiq;
    public $codcli;
    public $nomcli;
    public $sobnom;
    public $bairro;
    public $codven;
    public $nomven;

    public function __construct($db) {
        $this->conn = $db;
    }

    function read() {
        $query = "SELECT
                    idetiq, codcli, nomcli, sobnom, bairro, codven, nomven
                FROM
                    " . $this->table_name . "
                ORDER BY
                    idetiq DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        return $stmt;
    }

    function create() {
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    codcli=:codcli, nomcli=:nomcli, sobnom=:sobnom, bairro=:bairro, codven=:codven, nomven=:nomven";

        $stmt = $this->conn->prepare($query);

        $this->codcli = htmlspecialchars(strip_tags($this->codcli));
        $this->nomcli = htmlspecialchars(strip_tags($this->nomcli));
        $this->sobnom = htmlspecialchars(strip_tags($this->sobnom));
        $this->bairro = htmlspecialchars(strip_tags($this->bairro));
        $this->codven = htmlspecialchars(strip_tags($this->codven));
        $this->nomven = htmlspecialchars(strip_tags($this->nomven));

        $stmt->bindParam(":codcli", $this->codcli);
        $stmt->bindParam(":nomcli", $this->nomcli);
        $stmt->bindParam(":sobnom", $this->sobnom);
        $stmt->bindParam(":bairro", $this->bairro);
        $stmt->bindParam(":codven", $this->codven);
        $stmt->bindParam(":nomven", $this->nomven);

        if ($stmt->execute()) {
            $this->idetiq = $this->conn->lastInsertId();
            return true;
        }

        return false;
    }

    function readOne() {
        $query = "SELECT
                    idetiq, codcli, nomcli, sobnom, bairro, codven, nomven
                FROM
                    " . $this->table_name . "
                WHERE
                    idetiq = ?
                LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->idetiq);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->codcli = $row['codcli'];
            $this->nomcli = $row['nomcli'];
            $this->sobnom = $row['sobnom'];
            $this->bairro = $row['bairro'];
            $this->codven = $row['codven'];
            $this->nomven = $row['nomven'];
            return true;
        }
        return false;
    }

    function getLastId() {
        $query = "SELECT idetiq FROM " . $this->table_name . " ORDER BY idetiq DESC LIMIT 1";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            return $row['idetiq'];
        }
        return false;
    }
}
?>