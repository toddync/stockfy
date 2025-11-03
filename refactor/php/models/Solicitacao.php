<?php

class Solicitacao {
    private $conn;
    private $table_name = "SOLICITACAO";

    public $vendedor;
    public $numero;
    public $cliente;
    public $nomcli;
    public $datsol;
    public $situ;

    public function __construct($db){
        $this->conn = $db;
    }

    public function readOne() {
        $query = "SELECT vendedor, numero, cliente, nomcli, datsol, situ
                  FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor AND numero = :numero
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);

        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->vendedor = $row['vendedor'];
            $this->numero = $row['numero'];
            $this->cliente = $row['cliente'];
            $this->nomcli = $row['nomcli'];
            $this->datsol = $row['datsol'];
            $this->situ = $row['situ'];
            return true;
        }
        return false;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET vendedor = :vendedor, numero = :numero, cliente = :cliente,
                      nomcli = :nomcli, datsol = :datsol, situ = :situ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);
        $stmt->bindParam(":cliente", $this->cliente);
        $stmt->bindParam(":nomcli", $this->nomcli);
        $stmt->bindParam(":datsol", $this->datsol);
        $stmt->bindParam(":situ", $this->situ);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET cliente = :cliente, nomcli = :nomcli, datsol = :datsol, situ = :situ
                  WHERE vendedor = :vendedor AND numero = :numero";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":cliente", $this->cliente);
        $stmt->bindParam(":nomcli", $this->nomcli);
        $stmt->bindParam(":datsol", $this->datsol);
        $stmt->bindParam(":situ", $this->situ);
        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "UPDATE " . $this->table_name . "
                  SET situ = 'X'
                  WHERE vendedor = :vendedor AND numero = :numero";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function generateNewNumero($vendedor) {
        $query = "SELECT MAX(CAST(numero AS UNSIGNED)) as max_numero
                  FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":vendedor", $vendedor);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $max_numero = $row['max_numero'];

        if ($max_numero === null) {
            return "000001";
        } else {
            $new_numero = $max_numero + 1;
            return str_pad($new_numero, 6, "0", STR_PAD_LEFT);
        }
    }
}
?>