<?php

class AuxTabula {
    public $artigo;
    public $descricao;
    public $pequeno;
    public $medio;
    public $grande;
    public $xgrande;
    public $total;

    public function __construct($artigo, $descricao, $pequeno, $medio, $grande, $xgrande, $total) {
        $this->artigo = $artigo;
        $this->descricao = $descricao;
        $this->pequeno = $pequeno;
        $this->medio = $medio;
        $this->grande = $grande;
        $this->xgrande = $xgrande;
        $this->total = $total;
    }

    public static function fromArray(array $data) {
        return new self(
            $data['artigo'] ?? null,
            $data['descricao'] ?? null,
            $data['pequeno'] ?? null,
            $data['medio'] ?? null,
            $data['grande'] ?? null,
            $data['xgrande'] ?? null,
            $data['total'] ?? null
        );
    }

    public function toArray() {
        return [
            'artigo' => $this->artigo,
            'descricao' => $this->descricao,
            'pequeno' => $this->pequeno,
            'medio' => $this->medio,
            'grande' => $this->grande,
            'xgrande' => $this->xgrande,
            'total' => $this->total
        ];
    }
}

?>