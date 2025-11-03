<?php

class AuxConta {
    public $id;
    public $compraId;
    public $numeroParcela;
    public $valor;
    public $dataVencimento;
    public $status;
    public $marcadoParaExclusao;

    public function __construct($data = []) {
        $this->id = $data['id'] ?? null;
        $this->compraId = $data['compraId'] ?? null;
        $this->numeroParcela = $data['numeroParcela'] ?? null;
        $this->valor = $data['valor'] ?? null;
        $this->dataVencimento = $data['dataVencimento'] ?? null;
        $this->status = $data['status'] ?? 'Pendente';
        $this->marcadoParaExclusao = $data['marcadoParaExclusao'] ?? false;
    }

    public static function getAll($compraId) {
        // Lógica para buscar todas as contas temporárias para uma compra
        // Exemplo de retorno mock
        return [
            new AuxConta([
                'id' => 1,
                'compraId' => $compraId,
                'numeroParcela' => 1,
                'valor' => 500.00,
                'dataVencimento' => '2023-11-26',
                'status' => 'Pendente',
                'marcadoParaExclusao' => false
            ]),
            new AuxConta([
                'id' => 2,
                'compraId' => $compraId,
                'numeroParcela' => 2,
                'valor' => 500.00,
                'dataVencimento' => '2023-12-26',
                'status' => 'Pendente',
                'marcadoParaExclusao' => false
            ])
        ];
    }

    public function save() {
        // Lógica para salvar ou atualizar a conta temporária
        return true;
    }

    public function delete() {
        // Lógica para marcar para exclusão ou remover do banco de dados temporário
        $this->marcadoParaExclusao = true;
        return true;
    }
}