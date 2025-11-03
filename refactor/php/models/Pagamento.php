<?php
class Pagamento {
    private $conn;
    private $table_name = "pagamentos"; // Assumindo uma tabela 'pagamentos'

    public $id;
    public $descricao;
    public $valor;
    public $vencimento; // Data de vencimento

    public function __construct($db) {
        $this->conn = $db;
    }

    function read() {
        $query = "SELECT id, descricao, valor, vencimento FROM " . $this->table_name . " ORDER BY vencimento DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function readOne() {
        $query = "SELECT id, descricao, valor, vencimento FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->descricao = $row['descricao'];
            $this->valor = $row['valor'];
            $this->vencimento = $row['vencimento'];
        }
    }

    function create() {
        $query = "INSERT INTO " . $this->table_name . " SET descricao=:descricao, valor=:valor, vencimento=:vencimento";
        $stmt = $this->conn->prepare($query);

        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->valor = htmlspecialchars(strip_tags($this->valor));
        $this->vencimento = htmlspecialchars(strip_tags($this->vencimento));

        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":valor", $this->valor);
        $stmt->bindParam(":vencimento", $this->vencimento);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function update() {
        $query = "UPDATE " . $this->table_name . " SET descricao = :descricao, valor = :valor, vencimento = :vencimento WHERE id = :id";
        $stmt = $this->conn->prepare($query);

        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->valor = htmlspecialchars(strip_tags($this->valor));
        $this->vencimento = htmlspecialchars(strip_tags($this->vencimento));
        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':descricao', $this->descricao);
        $stmt->bindParam(':valor', $this->valor);
        $stmt->bindParam(':vencimento', $this->vencimento);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>