<?php
// refactor/php/models/ContasAPagarReceber.php

class ContasAPagarReceber {
    private $conn;
    private $table_name = "contas_a_pagar_receber";

    public $id;
    public $tipo_documento;
    public $numero_documento;
    public $parcela;
    public $data_vencimento;
    public $valor_original;
    public $valor_pago;
    public $data_pagamento;
    public $status; // 'pendente', 'pago', 'cancelado'
    public $fornecedor_id; // ou cliente_id, dependendo do tipo de conta

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT
                    id, tipo_documento, numero_documento, parcela, data_vencimento,
                    valor_original, valor_pago, data_pagamento, status, fornecedor_id
                  FROM
                    " . $this->table_name . "
                  ORDER BY
                    data_vencimento DESC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function updateStatus() {
        $query = "UPDATE
                    " . $this->table_name . "
                  SET
                    status = :status,
                    valor_pago = :valor_pago,
                    data_pagamento = :data_pagamento
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->valor_pago = htmlspecialchars(strip_tags($this->valor_pago));
        $this->data_pagamento = htmlspecialchars(strip_tags($this->data_pagamento));
        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':status', $this->status);
        $stmt->bindParam(':valor_pago', $this->valor_pago);
        $stmt->bindParam(':data_pagamento', $this->data_pagamento);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}