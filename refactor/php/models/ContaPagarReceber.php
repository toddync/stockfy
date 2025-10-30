<?php

class ContaPagarReceber {
    private $conn;
    private $table_name = "contas_a_pagar_receber";

    public $id;
    public $data_emissao;
    public $tipo_documento;
    public $numero_documento;
    public $parcela;
    public $historico;
    public $observacoes;
    public $valor;
    public $tipo_cobranca;
    public $numero_cobranca;
    public $origem_cobranca;
    public $data_vencimento;
    public $sinal;
    public $sigla;
    public $situacao;
    public $data_pagamento;
    public $vendedor_id;
    public $valor_comissao_acordada;
    public $valor_comissao_paga;
    public $data_baixa;
    public $operador;
    public $cliente_id;
    public $fornecedor_id; // Adicionado para consistência, se aplicável

    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = "SELECT * FROM " . $this->table_name . " ORDER BY data_emissao DESC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET
                    data_emissao=:data_emissao, tipo_documento=:tipo_documento, numero_documento=:numero_documento,
                    parcela=:parcela, historico=:historico, observacoes=:observacoes, valor=:valor,
                    tipo_cobranca=:tipo_cobranca, numero_cobranca=:numero_cobranca, origem_cobranca=:origem_cobranca,
                    data_vencimento=:data_vencimento, sinal=:sinal, sigla=:sigla, situacao=:situacao,
                    data_pagamento=:data_pagamento, vendedor_id=:vendedor_id, valor_comissao_acordada=:valor_comissao_acordada,
                    valor_comissao_paga=:valor_comissao_paga, data_baixa=:data_baixa, operador=:operador,
                    cliente_id=:cliente_id, fornecedor_id=:fornecedor_id";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->data_emissao = htmlspecialchars(strip_tags($this->data_emissao));
        $this->tipo_documento = htmlspecialchars(strip_tags($this->tipo_documento));
        $this->numero_documento = htmlspecialchars(strip_tags($this->numero_documento));
        $this->parcela = htmlspecialchars(strip_tags($this->parcela));
        $this->historico = htmlspecialchars(strip_tags($this->historico));
        $this->observacoes = htmlspecialchars(strip_tags($this->observacoes));
        $this->valor = htmlspecialchars(strip_tags($this->valor));
        $this->tipo_cobranca = htmlspecialchars(strip_tags($this->tipo_cobranca));
        $this->numero_cobranca = htmlspecialchars(strip_tags($this->numero_cobranca));
        $this->origem_cobranca = htmlspecialchars(strip_tags($this->origem_cobranca));
        $this->data_vencimento = htmlspecialchars(strip_tags($this->data_vencimento));
        $this->sinal = htmlspecialchars(strip_tags($this->sinal));
        $this->sigla = htmlspecialchars(strip_tags($this->sigla));
        $this->situacao = htmlspecialchars(strip_tags($this->situacao));
        $this->data_pagamento = htmlspecialchars(strip_tags($this->data_pagamento));
        $this->vendedor_id = htmlspecialchars(strip_tags($this->vendedor_id));
        $this->valor_comissao_acordada = htmlspecialchars(strip_tags($this->valor_comissao_acordada));
        $this->valor_comissao_paga = htmlspecialchars(strip_tags($this->valor_comissao_paga));
        $this->data_baixa = htmlspecialchars(strip_tags($this->data_baixa));
        $this->operador = htmlspecialchars(strip_tags($this->operador));
        $this->cliente_id = htmlspecialchars(strip_tags($this->cliente_id));
        $this->fornecedor_id = htmlspecialchars(strip_tags($this->fornecedor_id));

        // Bind values
        $stmt->bindParam(":data_emissao", $this->data_emissao);
        $stmt->bindParam(":tipo_documento", $this->tipo_documento);
        $stmt->bindParam(":numero_documento", $this->numero_documento);
        $stmt->bindParam(":parcela", $this->parcela);
        $stmt->bindParam(":historico", $this->historico);
        $stmt->bindParam(":observacoes", $this->observacoes);
        $stmt->bindParam(":valor", $this->valor);
        $stmt->bindParam(":tipo_cobranca", $this->tipo_cobranca);
        $stmt->bindParam(":numero_cobranca", $this->numero_cobranca);
        $stmt->bindParam(":origem_cobranca", $this->origem_cobranca);
        $stmt->bindParam(":data_vencimento", $this->data_vencimento);
        $stmt->bindParam(":sinal", $this->sinal);
        $stmt->bindParam(":sigla", $this->sigla);
        $stmt->bindParam(":situacao", $this->situacao);
        $stmt->bindParam(":data_pagamento", $this->data_pagamento);
        $stmt->bindParam(":vendedor_id", $this->vendedor_id);
        $stmt->bindParam(":valor_comissao_acordada", $this->valor_comissao_acordada);
        $stmt->bindParam(":valor_comissao_paga", $this->valor_comissao_paga);
        $stmt->bindParam(":data_baixa", $this->data_baixa);
        $stmt->bindParam(":operador", $this->operador);
        $stmt->bindParam(":cliente_id", $this->cliente_id);
        $stmt->bindParam(":fornecedor_id", $this->fornecedor_id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function readOne() {
        $query = "SELECT * FROM " . $this->table_name . " WHERE id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $this->id = $row['id'];
            $this->data_emissao = $row['data_emissao'];
            $this->tipo_documento = $row['tipo_documento'];
            $this->numero_documento = $row['numero_documento'];
            $this->parcela = $row['parcela'];
            $this->historico = $row['historico'];
            $this->observacoes = $row['observacoes'];
            $this->valor = $row['valor'];
            $this->tipo_cobranca = $row['tipo_cobranca'];
            $this->numero_cobranca = $row['numero_cobranca'];
            $this->origem_cobranca = $row['origem_cobranca'];
            $this->data_vencimento = $row['data_vencimento'];
            $this->sinal = $row['sinal'];
            $this->sigla = $row['sigla'];
            $this->situacao = $row['situacao'];
            $this->data_pagamento = $row['data_pagamento'];
            $this->vendedor_id = $row['vendedor_id'];
            $this->valor_comissao_acordada = $row['valor_comissao_acordada'];
            $this->valor_comissao_paga = $row['valor_comissao_paga'];
            $this->data_baixa = $row['data_baixa'];
            $this->operador = $row['operador'];
            $this->cliente_id = $row['cliente_id'];
            $this->fornecedor_id = $row['fornecedor_id'];
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE " . $this->table_name . " SET
                    data_emissao=:data_emissao, tipo_documento=:tipo_documento, numero_documento=:numero_documento,
                    parcela=:parcela, historico=:historico, observacoes=:observacoes, valor=:valor,
                    tipo_cobranca=:tipo_cobranca, numero_cobranca=:numero_cobranca, origem_cobranca=:origem_cobranca,
                    data_vencimento=:data_vencimento, sinal=:sinal, sigla=:sigla, situacao=:situacao,
                    data_pagamento=:data_pagamento, vendedor_id=:vendedor_id, valor_comissao_acordada=:valor_comissao_acordada,
                    valor_comissao_paga=:valor_comissao_paga, data_baixa=:data_baixa, operador=:operador,
                    cliente_id=:cliente_id, fornecedor_id=:fornecedor_id
                WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Sanitize
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->data_emissao = htmlspecialchars(strip_tags($this->data_emissao));
        $this->tipo_documento = htmlspecialchars(strip_tags($this->tipo_documento));
        $this->numero_documento = htmlspecialchars(strip_tags($this->numero_documento));
        $this->parcela = htmlspecialchars(strip_tags($this->parcela));
        $this->historico = htmlspecialchars(strip_tags($this->historico));
        $this->observacoes = htmlspecialchars(strip_tags($this->observacoes));
        $this->valor = htmlspecialchars(strip_tags($this->valor));
        $this->tipo_cobranca = htmlspecialchars(strip_tags($this->tipo_cobranca));
        $this->numero_cobranca = htmlspecialchars(strip_tags($this->numero_cobranca));
        $this->origem_cobranca = htmlspecialchars(strip_tags($this->origem_cobranca));
        $this->data_vencimento = htmlspecialchars(strip_tags($this->data_vencimento));
        $this->sinal = htmlspecialchars(strip_tags($this->sinal));
        $this->sigla = htmlspecialchars(strip_tags($this->sigla));
        $this->situacao = htmlspecialchars(strip_tags($this->situacao));
        $this->data_pagamento = htmlspecialchars(strip_tags($this->data_pagamento));
        $this->vendedor_id = htmlspecialchars(strip_tags($this->vendedor_id));
        $this->valor_comissao_acordada = htmlspecialchars(strip_tags($this->valor_comissao_acordada));
        $this->valor_comissao_paga = htmlspecialchars(strip_tags($this->valor_comissao_paga));
        $this->data_baixa = htmlspecialchars(strip_tags($this->data_baixa));
        $this->operador = htmlspecialchars(strip_tags($this->operador));
        $this->cliente_id = htmlspecialchars(strip_tags($this->cliente_id));
        $this->fornecedor_id = htmlspecialchars(strip_tags($this->fornecedor_id));

        // Bind values
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":data_emissao", $this->data_emissao);
        $stmt->bindParam(":tipo_documento", $this->tipo_documento);
        $stmt->bindParam(":numero_documento", $this->numero_documento);
        $stmt->bindParam(":parcela", $this->parcela);
        $stmt->bindParam(":historico", $this->historico);
        $stmt->bindParam(":observacoes", $this->observacoes);
        $stmt->bindParam(":valor", $this->valor);
        $stmt->bindParam(":tipo_cobranca", $this->tipo_cobranca);
        $stmt->bindParam(":numero_cobranca", $this->numero_cobranca);
        $stmt->bindParam(":origem_cobranca", $this->origem_cobranca);
        $stmt->bindParam(":data_vencimento", $this->data_vencimento);
        $stmt->bindParam(":sinal", $this->sinal);
        $stmt->bindParam(":sigla", $this->sigla);
        $stmt->bindParam(":situacao", $this->situacao);
        $stmt->bindParam(":data_pagamento", $this->data_pagamento);
        $stmt->bindParam(":vendedor_id", $this->vendedor_id);
        $stmt->bindParam(":valor_comissao_acordada", $this->valor_comissao_acordada);
        $stmt->bindParam(":valor_comissao_paga", $this->valor_comissao_paga);
        $stmt->bindParam(":data_baixa", $this->data_baixa);
        $stmt->bindParam(":operador", $this->operador);
        $stmt->bindParam(":cliente_id", $this->cliente_id);
        $stmt->bindParam(":fornecedor_id", $this->fornecedor_id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

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

    public function readByDocumentoAndParcela($tipo_documento, $numero_documento, $parcela) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE tipo_documento = ? AND numero_documento = ? AND parcela = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $tipo_documento);
        $stmt->bindParam(2, $numero_documento);
        $stmt->bindParam(3, $parcela);
        $stmt->execute();
        return $stmt;
    }

    public function deleteByDocumento($tipo_documento, $numero_documento) {
        $query = "DELETE FROM " . $this->table_name . " WHERE tipo_documento = ? AND numero_documento = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $tipo_documento);
        $stmt->bindParam(2, $numero_documento);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>