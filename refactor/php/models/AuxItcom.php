<?php

class AuxItcom {
    public $id;
    public $compraId;
    public $codigoArtigo;
    public $descricao;
    public $quantidade;
    public $precoUnitario;
    public $total;
    public $marcadoParaExclusao;

    public function __construct($data = []) {
        $this->id = $data['id'] ?? null;
        $this->compraId = $data['compraId'] ?? null;
        $this->codigoArtigo = $data['codigoArtigo'] ?? null;
        $this->descricao = $data['descricao'] ?? null;
        $this->quantidade = $data['quantidade'] ?? null;
        $this->precoUnitario = $data['precoUnitario'] ?? null;
        $this->total = $data['total'] ?? null;
        $this->marcadoParaExclusao = $data['marcadoParaExclusao'] ?? false;
    }

    public static function getAll($compraId) {
        // Lógica para buscar todos os itens temporários para uma compra
        // Exemplo de retorno mock
        return [
            new AuxItcom([
                'id' => 1,
                'compraId' => $compraId,
                'codigoArtigo' => 'ART001',
                'descricao' => 'Artigo Um (Temp)',
                'quantidade' => 10,
                'precoUnitario' => 50.00,
                'total' => 500.00,
                'marcadoParaExclusao' => false
            ]),
            new AuxItcom([
                'id' => 2,
                'compraId' => $compraId,
                'codigoArtigo' => 'ART003',
                'descricao' => 'Artigo Três (Temp)',
                'quantidade' => 2,
                'precoUnitario' => 150.00,
                'total' => 300.00,
                'marcadoParaExclusao' => false
            ])
        ];
    }

    public function save() {
        // Lógica para salvar ou atualizar o item temporário
        return true;
    }

    public function delete() {
        // Lógica para marcar para exclusão ou remover do banco de dados temporário
        $this->marcadoParaExclusao = true;
        return true;
    }
}