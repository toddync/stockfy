<?php

class Pendencia {
    // Campos da tabela EXTRATO
    public $codcli;
    public $item;
    public $pedido;
    public $emissao;
    public $descricao;
    public $valsaida;
    public $retorno;
    public $valvend;
    public $valresi;
    public $datpag;
    public $situ;
    public $vencto;

    // Campos adicionais do CLIENTE e ROTA
    public $nome_cliente;
    public $endereco_cliente;
    public $bairro_cliente;
    public $cidade_cliente;
    public $estado_cliente;
    public $telefone_cliente;
    public $horain_cliente;
    public $horafin_cliente;
    public $nome_praca; // Do ROTA

    public function __construct(
        $codcli, $item, $pedido, $emissao, $descricao, $valsaida, $retorno,
        $valvend, $valresi, $datpag, $situ, $vencto,
        $nome_cliente = null, $endereco_cliente = null, $bairro_cliente = null,
        $cidade_cliente = null, $estado_cliente = null, $telefone_cliente = null,
        $horain_cliente = null, $horafin_cliente = null, $nome_praca = null
    ) {
        $this->codcli = $codcli;
        $this->item = $item;
        $this->pedido = $pedido;
        $this->emissao = $emissao;
        $this->descricao = $descricao;
        $this->valsaida = $valsaida;
        $this->retorno = $retorno;
        $this->valvend = $valvend;
        $this->valresi = $valresi;
        $this->datpag = $datpag;
        $this->situ = $situ;
        $this->vencto = $vencto;
        $this->nome_cliente = $nome_cliente;
        $this->endereco_cliente = $endereco_cliente;
        $this->bairro_cliente = $bairro_cliente;
        $this->cidade_cliente = $cidade_cliente;
        $this->estado_cliente = $estado_cliente;
        $this->telefone_cliente = $telefone_cliente;
        $this->horain_cliente = $horain_cliente;
        $this->horafin_cliente = $horafin_cliente;
        $this->nome_praca = $nome_praca;
    }

    // Métodos getters para cada propriedade
    public function getCodcli() { return $this->codcli; }
    public function getItem() { return $this->item; }
    public function getPedido() { return $this->pedido; }
    public function getEmissao() { return $this->emissao; }
    public function getDescricao() { return $this->descricao; }
    public function getValsaida() { return $this->valsaida; }
    public function getRetorno() { return $this->retorno; }
    public function getValvend() { return $this->valvend; }
    public function getValresi() { return $this->valresi; }
    public function getDatpag() { return $this->datpag; }
    public function getSitu() { return $this->situ; }
    public function getVencto() { return $this->vencto; }
    public function getNomeCliente() { return $this->nome_cliente; }
    public function getEnderecoCliente() { return $this->endereco_cliente; }
    public function getBairroCliente() { return $this->bairro_cliente; }
    public function getCidadeCliente() { return $this->cidade_cliente; }
    public function getEstadoCliente() { return $this->estado_cliente; }
    public function getTelefoneCliente() { return $this->telefone_cliente; }
    public function getHorainCliente() { return $this->horain_cliente; }
    public function getHorafinCliente() { return $this->horafin_cliente; }
    public function getNomePraca() { return $this->nome_praca; }

    // Métodos setters para cada propriedade
    public function setCodcli($codcli) { $this->codcli = $codcli; }
    public function setItem($item) { $this->item = $item; }
    public function setPedido($pedido) { $this->pedido = $pedido; }
    public function setEmissao($emissao) { $this->emissao = $emissao; }
    public function setDescricao($descricao) { $this->descricao = $descricao; }
    public function setValsaida($valsaida) { $this->valsaida = $valsaida; }
    public function setRetorno($retorno) { $this->retorno = $retorno; }
    public function setValvend($valvend) { $this->valvend = $valvend; }
    public function setValresi($valresi) { $this->valresi = $valresi; }
    public function setDatpag($datpag) { $this->datpag = $datpag; }
    public function setSitu($situ) { $this->situ = $situ; }
    public function setVencto($vencto) { $this->vencto = $vencto; }
    public function setNomeCliente($nome_cliente) { $this->nome_cliente = $nome_cliente; }
    public function setEnderecoCliente($endereco_cliente) { $this->endereco_cliente = $endereco_cliente; }
    public function setBairroCliente($bairro_cliente) { $this->bairro_cliente = $bairro_cliente; }
    public function setCidadeCliente($cidade_cliente) { $this->cidade_cliente = $cidade_cliente; }
    public function setEstadoCliente($estado_cliente) { $this->estado_cliente = $estado_cliente; }
    public function setTelefoneCliente($telefone_cliente) { $this->telefone_cliente = $telefone_cliente; }
    public function setHorainCliente($horain_cliente) { $this->horain_cliente = $horain_cliente; }
    public function setHorafinCliente($horafin_cliente) { $this->horafin_cliente = $horafin_cliente; }
    public function setNomePraca($nome_praca) { $this->nome_praca = $nome_praca; }

    // Método para converter o objeto em um array associativo (útil para JSON)
    public function toArray() {
        return [
            'codcli' => $this->codcli,
            'item' => $this->item,
            'pedido' => $this->pedido,
            'emissao' => $this->emissao,
            'descricao' => $this->descricao,
            'valsaida' => $this->valsaida,
            'retorno' => $this->retorno,
            'valvend' => $this->valvend,
            'valresi' => $this->valresi,
            'datpag' => $this->datpag,
            'situ' => $this->situ,
            'vencto' => $this->vencto,
            'nome_cliente' => $this->nome_cliente,
            'endereco_cliente' => $this->endereco_cliente,
            'bairro_cliente' => $this->bairro_cliente,
            'cidade_cliente' => $this->cidade_cliente,
            'estado_cliente' => $this->estado_cliente,
            'telefone_cliente' => $this->telefone_cliente,
            'horain_cliente' => $this->horain_cliente,
            'horafin_cliente' => $this->horafin_cliente,
            'nome_praca' => $this->nome_praca,
        ];
    }
}

?>