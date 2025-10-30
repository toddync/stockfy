<?php

class ItemDevolucao {
    private $conn;
    private $table_name = "itens_devolucao";

    public $id; // ID do item de devolução (auto-incremento, se aplicável)
    public $devolucaoId; // NUMNOT
    public $artigoId; // CODART
    public $descricao; // DESCRICAO
    public $quantidade; // QUANT
    public $precoCusto; // PRECUS

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para ler todos os itens de devolução
    public function read() {
        $query = "SELECT id, devolucao_id, artigo_id, descricao, quantidade, preco_custo FROM " . $this->table_name . " ORDER BY id DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler itens de devolução por ID de devolução
    public function readByDevolucaoId() {
        $query = "SELECT id, devolucao_id, artigo_id, descricao, quantidade, preco_custo FROM " . $this->table_name . " WHERE devolucao_id = ? ORDER BY artigo_id ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->devolucaoId);
        $stmt->execute();
        return $stmt;
    }

    // Método para criar um item de devolução
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET devolucao_id=:devolucaoId, artigo_id=:artigoId, descricao=:descricao, quantidade=:quantidade, preco_custo=:precoCusto";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->devolucaoId = htmlspecialchars(strip_tags($this->devolucaoId));
        $this->artigoId = htmlspecialchars(strip_tags($this->artigoId));
        $this->descricao = htmlspecialchars(strip_tags($this->descricao));
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->precoCusto = htmlspecialchars(strip_tags($this->precoCusto));

        // Bind dos valores
        $stmt->bindParam(":devolucaoId", $this->devolucaoId);
        $stmt->bindParam(":artigoId", $this->artigoId);
        $stmt->bindParam(":descricao", $this->descricao);
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":precoCusto", $this->precoCusto);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para atualizar um item de devolução
    public function update() {
        $query = "UPDATE " . $this->table_name . " SET quantidade=:quantidade, preco_custo=:precoCusto WHERE devolucao_id = :devolucaoId AND artigo_id = :artigoId";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->quantidade = htmlspecialchars(strip_tags($this->quantidade));
        $this->precoCusto = htmlspecialchars(strip_tags($this->precoCusto));
        $this->devolucaoId = htmlspecialchars(strip_tags($this->devolucaoId));
        $this->artigoId = htmlspecialchars(strip_tags($this->artigoId));

        // Bind dos valores
        $stmt->bindParam(":quantidade", $this->quantidade);
        $stmt->bindParam(":precoCusto", $this->precoCusto);
        $stmt->bindParam(":devolucaoId", $this->devolucaoId);
        $stmt->bindParam(":artigoId", $this->artigoId);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar um item de devolução
    public function delete() {
        $query = "DELETE FROM " . $this->table_name . " WHERE devolucao_id = ? AND artigo_id = ?";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->devolucaoId = htmlspecialchars(strip_tags($this->devolucaoId));
        $this->artigoId = htmlspecialchars(strip_tags($this->artigoId));

        // Bind dos IDs
        $stmt->bindParam(1, $this->devolucaoId);
        $stmt->bindParam(2, $this->artigoId);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar todos os itens de devolução de uma devolução específica
    public function deleteByDevolucaoId() {
        $query = "DELETE FROM " . $this->table_name . " WHERE devolucao_id = ?";
        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->devolucaoId = htmlspecialchars(strip_tags($this->devolucaoId));

        // Bind do ID da devolução
        $stmt->bindParam(1, $this->devolucaoId);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}