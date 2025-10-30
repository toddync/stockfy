<?php
class Fornecedor {
    private $conn;
    private $table_name = "fornecedores";

    public $id;
    public $razao_social;
    public $nome_fantasia;
    public $cnpj;
    public $ie;
    public $endereco;
    public $cidade;
    public $estado;
    public $telefone;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para criar um novo fornecedor
    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    razao_social=:razao_social,
                    nome_fantasia=:nome_fantasia,
                    cnpj=:cnpj,
                    ie=:ie,
                    endereco=:endereco,
                    cidade=:cidade,
                    estado=:estado,
                    telefone=:telefone";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->razao_social = htmlspecialchars(strip_tags($this->razao_social));
        $this->nome_fantasia = htmlspecialchars(strip_tags($this->nome_fantasia));
        $this->cnpj = htmlspecialchars(strip_tags($this->cnpj));
        $this->ie = htmlspecialchars(strip_tags($this->ie));
        $this->endereco = htmlspecialchars(strip_tags($this->endereco));
        $this->cidade = htmlspecialchars(strip_tags($this->cidade));
        $this->estado = htmlspecialchars(strip_tags($this->estado));
        $this->telefone = htmlspecialchars(strip_tags($this->telefone));

        // Vincular valores
        $stmt->bindParam(":razao_social", $this->razao_social);
        $stmt->bindParam(":nome_fantasia", $this->nome_fantasia);
        $stmt->bindParam(":cnpj", $this->cnpj);
        $stmt->bindParam(":ie", $this->ie);
        $stmt->bindParam(":endereco", $this->endereco);
        $stmt->bindParam(":cidade", $this->cidade);
        $stmt->bindParam(":estado", $this->estado);
        $stmt->bindParam(":telefone", $this->telefone);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para ler todos os fornecedores
    public function read() {
        $query = "SELECT
                    id, razao_social, nome_fantasia, cnpj, ie, endereco, cidade, estado, telefone
                  FROM
                    " . $this->table_name . "
                  ORDER BY
                    razao_social ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler um único fornecedor
    public function readOne() {
        $query = "SELECT
                    id, razao_social, nome_fantasia, cnpj, ie, endereco, cidade, estado, telefone
                  FROM
                    " . $this->table_name . "
                  WHERE
                    id = ?
                  LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->razao_social = $row['razao_social'];
            $this->nome_fantasia = $row['nome_fantasia'];
            $this->cnpj = $row['cnpj'];
            $this->ie = $row['ie'];
            $this->endereco = $row['endereco'];
            $this->cidade = $row['cidade'];
            $this->estado = $row['estado'];
            $this->telefone = $row['telefone'];
            return true;
        }
        return false;
    }

    // Método para atualizar um fornecedor
    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    razao_social=:razao_social,
                    nome_fantasia=:nome_fantasia,
                    cnpj=:cnpj,
                    ie=:ie,
                    endereco=:endereco,
                    cidade=:cidade,
                    estado=:estado,
                    telefone=:telefone
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->razao_social = htmlspecialchars(strip_tags($this->razao_social));
        $this->nome_fantasia = htmlspecialchars(strip_tags($this->nome_fantasia));
        $this->cnpj = htmlspecialchars(strip_tags($this->cnpj));
        $this->ie = htmlspecialchars(strip_tags($this->ie));
        $this->endereco = htmlspecialchars(strip_tags($this->endereco));
        $this->cidade = htmlspecialchars(strip_tags($this->cidade));
        $this->estado = htmlspecialchars(strip_tags($this->estado));
        $this->telefone = htmlspecialchars(strip_tags($this->telefone));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Vincular valores
        $stmt->bindParam(":razao_social", $this->razao_social);
        $stmt->bindParam(":nome_fantasia", $this->nome_fantasia);
        $stmt->bindParam(":cnpj", $this->cnpj);
        $stmt->bindParam(":ie", $this->ie);
        $stmt->bindParam(":endereco", $this->endereco);
        $stmt->bindParam(":cidade", $this->cidade);
        $stmt->bindParam(":estado", $this->estado);
        $stmt->bindParam(":telefone", $this->telefone);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar um fornecedor
    public function delete() {
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