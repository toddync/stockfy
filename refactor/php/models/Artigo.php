<?php

class Artigo {
    private $conn;
    private $table_name = "artigos"; // Assumindo nome da tabela no plural e snake_case

    public $id; // ID do artigo (auto-incremento, se aplicável)
    public $codigo; // CODIGO
    public $descricao; // DESCRICAO
    public $estoque; // ESTOQ
    public $precoCusto; // PRECUS
    public $precoVenda; // PREVEN

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para ler um artigo pelo código
    public function readOne() {
        $query = "SELECT id, codigo, descricao, estoque, preco_custo, preco_venda FROM " . $this->table_name . " WHERE codigo = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->codigo);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->id = $row['id'];
            $this->codigo = $row['codigo'];
            $this->descricao = $row['descricao'];
            $this->estoque = $row['estoque'];
            $this->precoCusto = $row['preco_custo'];
            $this->precoVenda = $row['preco_venda'];
            return true;
        }
        return false;
    }

    // Método para atualizar o estoque de um artigo
    public function update() {
        $query = "UPDATE " . $this->table_name . " SET estoque=:estoque WHERE codigo = :codigo";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->estoque = htmlspecialchars(strip_tags($this->estoque));
        $this->codigo = htmlspecialchars(strip_tags($this->codigo));

        // Bind dos valores
        $stmt->bindParam(":estoque", $this->estoque);
        $stmt->bindParam(":codigo", $this->codigo);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}