<?php

class ItemSolicitacao {
    private $conn;
    private $table_name = "ITSOLICIT";

    public $vendedor;
    public $numero;
    public $artigo;
    public $descricao;
    public $pequeno;
    public $medio;
    public $grande;
    public $xgrande;
    public $obser;

    public function __construct($db){
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT vendedor, numero, artigo, descricao, pequeno, medio, grande, xgrande, obser
                  FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor AND numero = :numero
                  ORDER BY artigo";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);

        $stmt->execute();

        return $stmt;
    }

    public function readOne() {
        $query = "SELECT vendedor, numero, artigo, descricao, pequeno, medio, grande, xgrande, obser
                  FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor AND numero = :numero AND artigo = :artigo
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);
        $stmt->bindParam(":artigo", $this->artigo);

        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->vendedor = $row['vendedor'];
            $this->numero = $row['numero'];
            $this->artigo = $row['artigo'];
            $this->descricao = $row['descricao'];
            $this->pequeno = $row['pequeno'];
            $this->medio = $row['medio'];
            $this->grande = $row['grande'];
            $this->xgrande = $row['xgrande'];
            $this->obser = $row['obser'];
            return true;
        }
        return false;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET vendedor = :vendedor, numero = :numero, artigo = :artigo,
                      descricao = :descricao, pequeno = :pequeno, medio = :medio,
                      grande = :grande, xgrande = :xgrande, obser = :obser";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);
        $stmt->bindParam(":artigo", $this->artigo);
        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":pequeno", $this->pequeno);
        $stmt->bindParam(":medio", $this->medio);
        $stmt->bindParam(":grande", $this->grande);
        $stmt->bindParam(":xgrande", $this->xgrande);
        $stmt->bindParam(":obser", $this->obser);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET descricao = :descricao, pequeno = :pequeno, medio = :medio,
                      grande = :grande, xgrande = :xgrande, obser = :obser
                  WHERE vendedor = :vendedor AND numero = :numero AND artigo = :artigo";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":pequeno", $this->pequeno);
        $stmt->bindParam(":medio", $this->medio);
        $stmt->bindParam(":grande", $this->grande);
        $stmt->bindParam(":xgrande", $this->xgrande);
        $stmt->bindParam(":obser", $this->obser);
        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);
        $stmt->bindParam(":artigo", $this->artigo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor AND numero = :numero AND artigo = :artigo";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);
        $stmt->bindParam(":artigo", $this->artigo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function deleteAllBySolicitacao() {
        $query = "DELETE FROM " . $this->table_name . "
                  WHERE vendedor = :vendedor AND numero = :numero";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(":vendedor", $this->vendedor);
        $stmt->bindParam(":numero", $this->numero);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>