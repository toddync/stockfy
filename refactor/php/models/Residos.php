<?php

class Residos {
    private $conn;
    private $table_name = "Residos";

    public $Datmov;
    public $Item;
    public $Numdoc;
    public $Valpag;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT Datmov, Item, Numdoc, Valpag FROM " . $this->table_name . " ORDER BY Datmov DESC, Item DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET Datmov=:Datmov, Item=:Item, Numdoc=:Numdoc, Valpag=:Valpag";
        $stmt = $this->conn->prepare($query);

        $this->Datmov = htmlspecialchars(strip_tags($this->Datmov));
        $this->Item = htmlspecialchars(strip_tags($this->Item));
        $this->Numdoc = htmlspecialchars(strip_tags($this->Numdoc));
        $this->Valpag = htmlspecialchars(strip_tags($this->Valpag));

        $stmt->bindParam(":Datmov", $this->Datmov);
        $stmt->bindParam(":Item", $this->Item);
        $stmt->bindParam(":Numdoc", $this->Numdoc);
        $stmt->bindParam(":Valpag", $this->Valpag);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " SET Numdoc=:Numdoc, Valpag=:Valpag WHERE Datmov=:Datmov AND Item=:Item";
        $stmt = $this->conn->prepare($query);

        $this->Datmov = htmlspecialchars(strip_tags($this->Datmov));
        $this->Item = htmlspecialchars(strip_tags($this->Item));
        $this->Numdoc = htmlspecialchars(strip_tags($this->Numdoc));
        $this->Valpag = htmlspecialchars(strip_tags($this->Valpag));

        $stmt->bindParam(":Datmov", $this->Datmov);
        $stmt->bindParam(":Item", $this->Item);
        $stmt->bindParam(":Numdoc", $this->Numdoc);
        $stmt->bindParam(":Valpag", $this->Valpag);

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
        $query = "SELECT Datmov, Item, Numdoc, Valpag FROM " . $this->table_name . " WHERE Datmov = ? AND Item = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $datmov);
        $stmt->bindParam(2, $item);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->Datmov = $row['Datmov'];
            $this->Item = $row['Item'];
            $this->Numdoc = $row['Numdoc'];
            $this->Valpag = $row['Valpag'];
            return true;
        }
        return false;
    }
}