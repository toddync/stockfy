<?php
class Pedido {
    private $conn;
    private $table_name = "pedidos";

    public $id;
    public $cliente_id;
    public $vendedor_id;
    public $data_emissao;
    public $data_entrega;
    public $valor_total;
    public $status;
    public $observacoes;
    public $valor_pago; // Novo campo para valor pago acumulado
    public $residuo;    // Novo campo para resíduo
    public $data_pagamento; // Novo campo para data do último pagamento

    // Propriedades adicionais para JOINs
    public $nome_cliente;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Usado para buscar um único pedido pelo número (que é o ID no novo esquema)
    public function readOneByNumero() {
        $query = "SELECT
                    p.id, p.cliente_id, c.nome as nome_cliente, p.vendedor_id,
                    p.data_emissao, p.data_entrega, p.valor_total, p.status, p.observacoes,
                    p.valor_pago, p.residuo, p.data_pagamento
                FROM
                    " . $this->table_name . " p
                LEFT JOIN
                    clientes c ON p.cliente_id = c.id
                WHERE
                    p.id = ?
                LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id); // 'id' é o ID do pedido no novo esquema
        $stmt->execute();

        return $stmt;
    }

    // Usado para atualizar o valor pago, resíduo e data de pagamento de um pedido
    public function updateResiduoAndPayment() {
        $query = "UPDATE
                    " . $this->table_name . "
                SET
                    valor_pago = :valor_pago,
                    residuo = :residuo,
                    data_pagamento = :data_pagamento
                WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->valor_pago = htmlspecialchars(strip_tags($this->valor_pago));
        $this->residuo = htmlspecialchars(strip_tags($this->residuo));
        $this->data_pagamento = htmlspecialchars(strip_tags($this->data_pagamento));
        $this->id = htmlspecialchars(strip_tags($this->id)); // Usar 'id' para a atualização

        // Bind values
        $stmt->bindParam(':valor_pago', $this->valor_pago);
        $stmt->bindParam(':residuo', $this->residuo);
        $stmt->bindParam(':data_pagamento', $this->data_pagamento);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    // Usado para buscar pedidos por data de emissão e status
    public function readByDateAndStatus($data_emissao, $status) {
        $query = "SELECT
                    p.id, p.cliente_id, c.nome as nome_cliente, p.vendedor_id,
                    p.data_emissao, p.data_entrega, p.valor_total, p.status, p.observacoes,
                    p.valor_pago, p.residuo, p.data_pagamento
                FROM
                    " . $this->table_name . " p
                LEFT JOIN
                    clientes c ON p.cliente_id = c.id
                WHERE
                    p.data_emissao = :data_emissao AND p.status = :status
                ORDER BY
                    p.id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":data_emissao", $data_emissao);
        $stmt->bindParam(":status", $status);
        $stmt->execute();

        return $stmt;
    }
}
?>