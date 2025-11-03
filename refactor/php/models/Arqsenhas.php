<?php

require_once 'Database.php';

class Arqsenhas {
    private $conn;
    private $table_name = "Arqsenhas";

    public $Nome;
    public $Senha;
    public $Senhas;
    public $Tabelas;
    public $Cliente;
    public $Vendedor;
    public $Produto;
    public $Transpo;
    public $Fornece;
    public $Matprim;
    public $Compra;
    public $Acabado;
    public $Relent;
    public $Pedido;
    public $Pagar;
    public $Relsai;
    public $Romane;
    public $Fincli;
    public $Finvend;
    public $Fechamento;
    public $Ajuste;
    public $Utilita;
    public $Modbf;
    public $Modcb;
    public $Modpr;
    public $Modrv;
    public $Modve;
    public $Datxi;
    public $Datxl;
    public $Estoqp;
    public $Estoqm;
    public $Receber;
    public $Bloqueio;

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    public function authenticate(string $nome, string $senha): array {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Nome = :nome AND Senha = :senha LIMIT 0,1";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':senha', $senha);

        $stmt->execute();

        $num = $stmt->rowCount();

        if ($num > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            return $row;
        }
        return [];
    }

    public function getPermissions(string $nome): array {
        $query = "SELECT * FROM " . $this->table_name . " WHERE Nome = :nome LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':nome', $nome);
        $stmt->execute();
        $num = $stmt->rowCount();
        if ($num > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            return $row;
        }
        return [];
    }
}

?>