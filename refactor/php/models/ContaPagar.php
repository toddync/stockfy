<?php
class ContaPagar {
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
    public $sinal; // 'D' para débito (a pagar), 'C' para crédito (a receber)
    public $sigla; // 'PAG' para pagar, 'REC' para receber
    public $situacao; // 'A' para aberto, 'B' para baixado
    public $data_pagamento;
    public $vendedor_id;
    public $comissao;
    public $data_baixa;
    public $operador;
    public $cliente_id; // Para contas a receber

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para criar uma nova conta a pagar/receber
    public function create() {
        $query = "INSERT INTO " . $this->table_name . "
                  SET
                    data_emissao=:data_emissao,
                    tipo_documento=:tipo_documento,
                    numero_documento=:numero_documento,
                    parcela=:parcela,
                    historico=:historico,
                    observacoes=:observacoes,
                    valor=:valor,
                    tipo_cobranca=:tipo_cobranca,
                    numero_cobranca=:numero_cobranca,
                    origem_cobranca=:origem_cobranca,
                    data_vencimento=:data_vencimento,
                    sinal=:sinal,
                    sigla=:sigla,
                    situacao=:situacao,
                    data_pagamento=:data_pagamento,
                    vendedor_id=:vendedor_id,
                    comissao=:comissao,
                    data_baixa=:data_baixa,
                    operador=:operador,
                    cliente_id=:cliente_id";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
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
        $this->comissao = htmlspecialchars(strip_tags($this->comissao));
        $this->data_baixa = htmlspecialchars(strip_tags($this->data_baixa));
        $this->operador = htmlspecialchars(strip_tags($this->operador));
        $this->cliente_id = htmlspecialchars(strip_tags($this->cliente_id));

        // Vincular valores
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
        $stmt->bindParam(":comissao", $this->comissao);
        $stmt->bindParam(":data_baixa", $this->data_baixa);
        $stmt->bindParam(":operador", $this->operador);
        $stmt->bindParam(":cliente_id", $this->cliente_id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para ler contas a pagar/receber
    public function read() {
        $query = "SELECT
                    id, data_emissao, tipo_documento, numero_documento, parcela, historico,
                    observacoes, valor, tipo_cobranca, numero_cobranca, origem_cobranca,
                    data_vencimento, sinal, sigla, situacao, data_pagamento, vendedor_id,
                    comissao, data_baixa, operador, cliente_id
                  FROM
                    " . $this->table_name . "
                  ORDER BY
                    data_vencimento ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para ler uma única conta a pagar/receber
    public function readOne() {
        $query = "SELECT
                    id, data_emissao, tipo_documento, numero_documento, parcela, historico,
                    observacoes, valor, tipo_cobranca, numero_cobranca, origem_cobranca,
                    data_vencimento, sinal, sigla, situacao, data_pagamento, vendedor_id,
                    comissao, data_baixa, operador, cliente_id
                  FROM
                    " . $this->table_name . "
                  WHERE
                    id = ?
                  LIMIT
                    0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
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
            $this->comissao = $row['comissao'];
            $this->data_baixa = $row['data_baixa'];
            $this->operador = $row['operador'];
            $this->cliente_id = $row['cliente_id'];
            return true;
        }
        return false;
    }

    // Método para atualizar uma conta a pagar/receber
    public function update() {
        $query = "UPDATE " . $this->table_name . "
                  SET
                    data_emissao=:data_emissao,
                    tipo_documento=:tipo_documento,
                    numero_documento=:numero_documento,
                    parcela=:parcela,
                    historico=:historico,
                    observacoes=:observacoes,
                    valor=:valor,
                    tipo_cobranca=:tipo_cobranca,
                    numero_cobranca=:numero_cobranca,
                    origem_cobranca=:origem_cobranca,
                    data_vencimento=:data_vencimento,
                    sinal=:sinal,
                    sigla=:sigla,
                    situacao=:situacao,
                    data_pagamento=:data_pagamento,
                    vendedor_id=:vendedor_id,
                    comissao=:comissao,
                    data_baixa=:data_baixa,
                    operador=:operador,
                    cliente_id=:cliente_id
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
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
        $this->comissao = htmlspecialchars(strip_tags($this->comissao));
        $this->data_baixa = htmlspecialchars(strip_tags($this->data_baixa));
        $this->operador = htmlspecialchars(strip_tags($this->operador));
        $this->cliente_id = htmlspecialchars(strip_tags($this->cliente_id));
        $this->id = htmlspecialchars(strip_tags($this->id));

        // Vincular valores
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
        $stmt->bindParam(":comissao", $this->comissao);
        $stmt->bindParam(":data_baixa", $this->data_baixa);
        $stmt->bindParam(":operador", $this->operador);
        $stmt->bindParam(":cliente_id", $this->cliente_id);
        $stmt->bindParam(":id", $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para deletar uma conta a pagar/receber
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
}
?>