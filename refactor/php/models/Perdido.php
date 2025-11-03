<?php

require_once 'Database.php';

class Perdido {
    private $conn;
    private $table_name = "Perdido";

    public $Pedido;
    public $Codven;
    public $Codcli;
    public $Nomcli;
    public $Base;
    public $Recol;
    public $Cobran;
    public $Totped;
    public $Situ;
    public $Datped;
    public $Solicit;
    public $Retorno;
    public $Totven;
    public $Datpag;
    public $Valpag;
    public $Residuo;
    public $Cob;
    public $Limite;
    public $Via;
    public $Oldped;
    public $Preco;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    public function readOne(): bool {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Pedido = :pedido LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':pedido', $this->Pedido);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->Pedido = $row['Pedido'];
            $this->Codven = $row['Codven'];
            $this->Codcli = $row['Codcli'];
            $this->Nomcli = $row['Nomcli'];
            $this->Base = $row['Base'];
            $this->Recol = $row['Recol'];
            $this->Cobran = $row['Cobran'];
            $this->Totped = $row['Totped'];
            $this->Situ = $row['Situ'];
            $this->Datped = $row['Datped'];
            $this->Solicit = $row['Solicit'];
            $this->Retorno = $row['Retorno'];
            $this->Totven = $row['Totven'];
            $this->Datpag = $row['Datpag'];
            $this->Valpag = $row['Valpag'];
            $this->Residuo = $row['Residuo'];
            $this->Cob = $row['Cob'];
            $this->Limite = $row['Limite'];
            $this->Via = $row['Via'];
            $this->Oldped = $row['Oldped'];
            $this->Preco = $row['Preco'];
            return true;
        }
        return false;
    }

    public function read(): PDOStatement {
        $query = "SELECT * FROM " . $this->table_name . " ORDER BY Pedido DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function update(): bool {
        $query = "UPDATE " . $this->table_name . " SET
                    Codven = :codven,
                    Codcli = :codcli,
                    Nomcli = :nomcli,
                    Base = :base,
                    Recol = :recol,
                    Cobran = :cobran,
                    Totped = :totped,
                    Situ = :situ,
                    Datped = :datped,
                    Solicit = :solicit,
                    Retorno = :retorno,
                    Totven = :totven,
                    Datpag = :datpag,
                    Valpag = :valpag,
                    Residuo = :residuo,
                    Cob = :cob,
                    Limite = :limite,
                    Via = :via,
                    Oldped = :oldped,
                    Preco = :preco
                WHERE
                    Pedido = :pedido";

        $stmt = $this->conn->prepare($query);

        $this->Codven = htmlspecialchars(strip_tags($this->Codven));
        $this->Codcli = htmlspecialchars(strip_tags($this->Codcli));
        $this->Nomcli = htmlspecialchars(strip_tags($this->Nomcli));
        $this->Base = htmlspecialchars(strip_tags($this->Base));
        $this->Recol = htmlspecialchars(strip_tags($this->Recol));
        $this->Cobran = htmlspecialchars(strip_tags($this->Cobran));
        $this->Totped = htmlspecialchars(strip_tags($this->Totped));
        $this->Situ = htmlspecialchars(strip_tags($this->Situ));
        $this->Datped = htmlspecialchars(strip_tags($this->Datped));
        $this->Solicit = htmlspecialchars(strip_tags($this->Solicit));
        $this->Retorno = htmlspecialchars(strip_tags($this->Retorno));
        $this->Totven = htmlspecialchars(strip_tags($this->Totven));
        $this->Datpag = htmlspecialchars(strip_tags($this->Datpag));
        $this->Valpag = htmlspecialchars(strip_tags($this->Valpag));
        $this->Residuo = htmlspecialchars(strip_tags($this->Residuo));
        $this->Cob = htmlspecialchars(strip_tags($this->Cob));
        $this->Limite = htmlspecialchars(strip_tags($this->Limite));
        $this->Via = htmlspecialchars(strip_tags($this->Via));
        $this->Oldped = htmlspecialchars(strip_tags($this->Oldped));
        $this->Preco = htmlspecialchars(strip_tags($this->Preco));
        $this->Pedido = htmlspecialchars(strip_tags($this->Pedido));

        $stmt->bindParam(':codven', $this->Codven);
        $stmt->bindParam(':codcli', $this->Codcli);
        $stmt->bindParam(':nomcli', $this->Nomcli);
        $stmt->bindParam(':base', $this->Base);
        $stmt->bindParam(':recol', $this->Recol);
        $stmt->bindParam(':cobran', $this->Cobran);
        $stmt->bindParam(':totped', $this->Totped);
        $stmt->bindParam(':situ', $this->Situ);
        $stmt->bindParam(':datped', $this->Datped);
        $stmt->bindParam(':solicit', $this->Solicit);
        $stmt->bindParam(':retorno', $this->Retorno);
        $stmt->bindParam(':totven', $this->Totven);
        $stmt->bindParam(':datpag', $this->Datpag);
        $stmt->bindParam(':valpag', $this->Valpag);
        $stmt->bindParam(':residuo', $this->Residuo);
        $stmt->bindParam(':cob', $this->Cob);
        $stmt->bindParam(':limite', $this->Limite);
        $stmt->bindParam(':via', $this->Via);
        $stmt->bindParam(':oldped', $this->Oldped);
        $stmt->bindParam(':preco', $this->Preco);
        $stmt->bindParam(':pedido', $this->Pedido);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}

?>