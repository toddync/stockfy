<?php

class Livro {
    private $conn;
    private $table_name = "Livro";

    public $Datmov;
    public $Item;
    public $Histor;
    public $Observ;
    public $Oripag;
    public $Tippag;
    public $Numpag;
    public $Valpag;
    public $Sinal;
    public $Tipdoc;
    public $Numdoc;
    public $Parcel;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT Datmov, Item, Histor, Observ, Oripag, Tippag, Numpag, Valpag, Sinal, Tipdoc, Numdoc, Parcel FROM " . $this->table_name . " ORDER BY Datmov DESC, Item DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET Datmov=:Datmov, Item=:Item, Histor=:Histor, Observ=:Observ, Oripag=:Oripag, Tippag=:Tippag, Numpag=:Numpag, Valpag=:Valpag, Sinal=:Sinal, Tipdoc=:Tipdoc, Numdoc=:Numdoc, Parcel=:Parcel";
        $stmt = $this->conn->prepare($query);

        $this->Datmov = htmlspecialchars(strip_tags($this->Datmov));
        $this->Item = htmlspecialchars(strip_tags($this->Item));
        $this->Histor = htmlspecialchars(strip_tags($this->Histor));
        $this->Observ = htmlspecialchars(strip_tags($this->Observ));
        $this->Oripag = htmlspecialchars(strip_tags($this->Oripag));
        $this->Tippag = htmlspecialchars(strip_tags($this->Tippag));
        $this->Numpag = htmlspecialchars(strip_tags($this->Numpag));
        $this->Valpag = htmlspecialchars(strip_tags($this->Valpag));
        $this->Sinal = htmlspecialchars(strip_tags($this->Sinal));
        $this->Tipdoc = htmlspecialchars(strip_tags($this->Tipdoc));
        $this->Numdoc = htmlspecialchars(strip_tags($this->Numdoc));
        $this->Parcel = htmlspecialchars(strip_tags($this->Parcel));

        $stmt->bindParam(":Datmov", $this->Datmov);
        $stmt->bindParam(":Item", $this->Item);
        $stmt->bindParam(":Histor", $this->Histor);
        $stmt->bindParam(":Observ", $this->Observ);
        $stmt->bindParam(":Oripag", $this->Oripag);
        $stmt->bindParam(":Tippag", $this->Tippag);
        $stmt->bindParam(":Numpag", $this->Numpag);
        $stmt->bindParam(":Valpag", $this->Valpag);
        $stmt->bindParam(":Sinal", $this->Sinal);
        $stmt->bindParam(":Tipdoc", $this->Tipdoc);
        $stmt->bindParam(":Numdoc", $this->Numdoc);
        $stmt->bindParam(":Parcel", $this->Parcel);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " SET Histor=:Histor, Observ=:Observ, Oripag=:Oripag, Tippag=:Tippag, Numpag=:Numpag, Valpag=:Valpag, Sinal=:Sinal, Tipdoc=:Tipdoc, Numdoc=:Numdoc, Parcel=:Parcel WHERE Datmov=:Datmov AND Item=:Item";
        $stmt = $this->conn->prepare($query);

        $this->Datmov = htmlspecialchars(strip_tags($this->Datmov));
        $this->Item = htmlspecialchars(strip_tags($this->Item));
        $this->Histor = htmlspecialchars(strip_tags($this->Histor));
        $this->Observ = htmlspecialchars(strip_tags($this->Observ));
        $this->Oripag = htmlspecialchars(strip_tags($this->Oripag));
        $this->Tippag = htmlspecialchars(strip_tags($this->Tippag));
        $this->Numpag = htmlspecialchars(strip_tags($this->Numpag));
        $this->Valpag = htmlspecialchars(strip_tags($this->Valpag));
        $this->Sinal = htmlspecialchars(strip_tags($this->Sinal));
        $this->Tipdoc = htmlspecialchars(strip_tags($this->Tipdoc));
        $this->Numdoc = htmlspecialchars(strip_tags($this->Numdoc));
        $this->Parcel = htmlspecialchars(strip_tags($this->Parcel));

        $stmt->bindParam(":Datmov", $this->Datmov);
        $stmt->bindParam(":Item", $this->Item);
        $stmt->bindParam(":Histor", $this->Histor);
        $stmt->bindParam(":Observ", $this->Observ);
        $stmt->bindParam(":Oripag", $this->Oripag);
        $stmt->bindParam(":Tippag", $this->Tippag);
        $stmt->bindParam(":Numpag", $this->Numpag);
        $stmt->bindParam(":Valpag", $this->Valpag);
        $stmt->bindParam(":Sinal", $this->Sinal);
        $stmt->bindParam(":Tipdoc", $this->Tipdoc);
        $stmt->bindParam(":Numdoc", $this->Numdoc);
        $stmt->bindParam(":Parcel", $this->Parcel);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE Datmov=:Datmov AND Item=:Item";
        $stmt = $this->conn->prepare($query);

        $this->Datmov = htmlspecialchars(strip_tags($this->Datmov));
        $this->Item = htmlspecialchars(strip_tags($this->Item));

        $stmt->bindParam(":Datmov", $this->Datmov);
        $stmt->bindParam(":Item", $this->Item);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function findByPrimaryKey($datmov, $item) {
        $query = "SELECT Datmov, Item, Histor, Observ, Oripag, Tippag, Numpag, Valpag, Sinal, Tipdoc, Numdoc, Parcel FROM " . $this->table_name . " WHERE Datmov = ? AND Item = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $datmov);
        $stmt->bindParam(2, $item);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->Datmov = $row['Datmov'];
            $this->Item = $row['Item'];
            $this->Histor = $row['Histor'];
            $this->Observ = $row['Observ'];
            $this->Oripag = $row['Oripag'];
            $this->Tippag = $row['Tippag'];
            $this->Numpag = $row['Numpag'];
            $this->Valpag = $row['Valpag'];
            $this->Sinal = $row['Sinal'];
            $this->Tipdoc = $row['Tipdoc'];
            $this->Numdoc = $row['Numdoc'];
            $this->Parcel = $row['Parcel'];
            return true;
        }
        return false;
    }
}