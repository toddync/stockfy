<?php
class Cliente {
    private $conn;
    private $table_name = "clientes";

    public $id;
    public $nome;
    public $cpf_cnpj;
    public $ie_rg;
    public $endereco;
    public $bairro;
    public $cidade;
    public $estado;
    public $cep;
    public $telefone;
    public $email;
    public $limite_credito;
    public $data_cadastro;
    public $ativo;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT id, nome, cpf_cnpj, ie_rg, endereco, bairro, cidade, estado, cep, telefone, email, limite_credito, data_cadastro, ativo FROM " . $this->table_name . " ORDER BY nome ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function search($keywords) {
        $query = "SELECT id, nome, cpf_cnpj, ie_rg, endereco, bairro, cidade, estado, cep, telefone, email, limite_credito, data_cadastro, ativo FROM " . $this->table_name . " WHERE nome LIKE ? OR cpf_cnpj LIKE ? OR ie_rg LIKE ? OR id LIKE ? ORDER BY nome ASC";
        $stmt = $this->conn->prepare($query);
        $keywords = htmlspecialchars(strip_tags($keywords));
        $keywords = "%{$keywords}%";
        $stmt->bindParam(1, $keywords);
        $stmt->bindParam(2, $keywords);
        $stmt->bindParam(3, $keywords);
        $stmt->bindParam(4, $keywords);
        $stmt->execute();
        return $stmt;
    }
}
?>