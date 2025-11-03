<?php

class ItemCompra {
    public $id;
    public $compraId;
    public $codigoArtigo;
    public $descricao;
    public $quantidade;
    public $precoUnitario;
    public $total;

    public function __construct($data = []) {
        $this->id = $data['id'] ?? null;
        $this->compraId = $data['compraId'] ?? null;
        $this->codigoArtigo = $data['codigoArtigo'] ?? null;
        $this->descricao = $data['descricao'] ?? null;
        $this->quantidade = $data['quantidade'] ?? null;
        $this->precoUnitario = $data['precoUnitario'] ?? null;
        $this->total = $data['total'] ?? null;
    }

    public static function findByCompra($compraId) {
        // Lógica para buscar itens de compra no banco de dados
        // Exemplo de retorno mock
        return [
            new ItemCompra([
                'id' => 101,
                'compraId' => $compraId,
                'codigoArtigo' => 'ART001',
                'descricao' => 'Artigo Um',
                'quantidade' => 10,
                'precoUnitario' => 50.00,
                'total' => 500.00
            ]),
            new ItemCompra([
                'id' => 102,
                'compraId' => $compraId,
                'codigoArtigo' => 'ART002',
                'descricao' => 'Artigo Dois',
                'quantidade' => 5,
                'precoUnitario' => 200.00,
                'total' => 1000.00
            ])
        ];
    }

    public function save() {
        // Lógica para salvar ou atualizar o item de compra no banco de dados
        return true;
    }
}