<?php

class AuxCliente {
    private $conn;
    private $table_name = "aux_clientes"; // Assumindo que a tabela normalizada será 'aux_clientes'

    public $id; // Adicionar um ID auto-incremento para a chave primária
    public $codcli;
    public $ncpf;
    public $nifp;
    public $bair;
    public $cida;
    public $esta;
    public $ncep;
    public $ntel;
    public $conta;
    public $vend;
    public $lcred;
    public $datimp;
    public $nommae;
    public $nompai;
    public $datnasc;
    public $natu;
    public $rota;
    public $praca;
    public $refer;
    public $oldcli;
    public $situ;
    public $nome;
    public $ende;
    public $horain;
    public $horafin;
    public $visita;
    public $ativo;
    public $esped;
    public $obsv;

    public function __construct($db) {
        $this->conn = $db;
    }

    // Método para ler todos os clientes
    public function read() {
        $query = "SELECT * FROM " . $this->table_name . " ORDER BY codcli ASC";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    // Método para criar um novo cliente
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " SET
                    codcli=:codcli, ncpf=:ncpf, nifp=:nifp, bair=:bair, cida=:cida, esta=:esta,
                    ncep=:ncep, ntel=:ntel, conta=:conta, vend=:vend, lcred=:lcred, datimp=:datimp,
                    nommae=:nommae, nompai=:nompai, datnasc=:datnasc, natu=:natu, rota=:rota,
                    praca=:praca, refer=:refer, oldcli=:oldcli, situ=:situ, nome=:nome, ende=:ende,
                    horain=:horain, horafin=:horafin, visita=:visita, ativo=:ativo, esped=:esped, obsv=:obsv";

        $stmt = $this->conn->prepare($query);

        // Limpar dados
        $this->codcli = htmlspecialchars(strip_tags($this->codcli));
        $this->ncpf = htmlspecialchars(strip_tags($this->ncpf));
        $this->nifp = htmlspecialchars(strip_tags($this->nifp));
        $this->bair = htmlspecialchars(strip_tags($this->bair));
        $this->cida = htmlspecialchars(strip_tags($this->cida));
        $this->esta = htmlspecialchars(strip_tags($this->esta));
        $this->ncep = htmlspecialchars(strip_tags($this->ncep));
        $this->ntel = htmlspecialchars(strip_tags($this->ntel));
        $this->conta = htmlspecialchars(strip_tags($this->conta));
        $this->vend = htmlspecialchars(strip_tags($this->vend));
        $this->lcred = htmlspecialchars(strip_tags($this->lcred));
        $this->datimp = htmlspecialchars(strip_tags($this->datimp));
        $this->nommae = htmlspecialchars(strip_tags($this->nommae));
        $this->nompai = htmlspecialchars(strip_tags($this->nompai));
        $this->datnasc = htmlspecialchars(strip_tags($this->datnasc));
        $this->natu = htmlspecialchars(strip_tags($this->natu));
        $this->rota = htmlspecialchars(strip_tags($this->rota));
        $this->praca = htmlspecialchars(strip_tags($this->praca));
        $this->refer = htmlspecialchars(strip_tags($this->refer));
        $this->oldcli = htmlspecialchars(strip_tags($this->oldcli));
        $this->situ = htmlspecialchars(strip_tags($this->situ));
        $this->nome = htmlspecialchars(strip_tags($this->nome));
        $this->ende = htmlspecialchars(strip_tags($this->ende));
        $this->horain = htmlspecialchars(strip_tags($this->horain));
        $this->horafin = htmlspecialchars(strip_tags($this->horafin));
        $this->visita = htmlspecialchars(strip_tags($this->visita));
        $this->ativo = htmlspecialchars(strip_tags($this->ativo));
        $this->esped = htmlspecialchars(strip_tags($this->esped));
        // OBSV é um BLOB, pode precisar de tratamento especial dependendo do conteúdo
        // Por enquanto, vamos assumir que é uma string simples ou nulo
        $this->obsv = $this->obsv; // Não strip_tags para BLOBs

        // Bind dos valores
        $stmt->bindParam(":codcli", $this->codcli);
        $stmt->bindParam(":ncpf", $this->ncpf);
        $stmt->bindParam(":nifp", $this->nifp);
        $stmt->bindParam(":bair", $this->bair);
        $stmt->bindParam(":cida", $this->cida);
        $stmt->bindParam(":esta", $this->esta);
        $stmt->bindParam(":ncep", $this->ncep);
        $stmt->bindParam(":ntel", $this->ntel);
        $stmt->bindParam(":conta", $this->conta);
        $stmt->bindParam(":vend", $this->vend);
        $stmt->bindParam(":lcred", $this->lcred);
        $stmt->bindParam(":datimp", $this->datimp);
        $stmt->bindParam(":nommae", $this->nommae);
        $stmt->bindParam(":nompai", $this->nompai);
        $stmt->bindParam(":datnasc", $this->datnasc);
        $stmt->bindParam(":natu", $this->natu);
        $stmt->bindParam(":rota", $this->rota);
        $stmt->bindParam(":praca", $this->praca);
        $stmt->bindParam(":refer", $this->refer);
        $stmt->bindParam(":oldcli", $this->oldcli);
        $stmt->bindParam(":situ", $this->situ);
        $stmt->bindParam(":nome", $this->nome);
        $stmt->bindParam(":ende", $this->ende);
        $stmt->bindParam(":horain", $this->horain);
        $stmt->bindParam(":horafin", $this->horafin);
        $stmt->bindParam(":visita", $this->visita);
        $stmt->bindParam(":ativo", $this->ativo);
        $stmt->bindParam(":esped", $this->esped);
        $stmt->bindParam(":obsv", $this->obsv);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    // Método para pesquisar clientes
    public function search($keywords, $search_by) {
        $query = "SELECT * FROM " . $this->table_name . " WHERE ";

        switch ($search_by) {
            case 'codcli':
                $query .= "codcli = :keywords";
                break;
            case 'nome':
                $query .= "nome LIKE :keywords";
                $keywords = "%{$keywords}%";
                break;
            case 'ncpf':
                $query .= "ncpf = :keywords";
                break;
            case 'nifp':
                $query .= "nifp = :keywords";
                break;
            default:
                // Caso padrão ou erro
                return false;
        }
        $query .= " ORDER BY codcli ASC";

        $stmt = $this->conn->prepare($query);
        $keywords = htmlspecialchars(strip_tags($keywords));
        $stmt->bindParam(":keywords", $keywords);
        $stmt->execute();
        return $stmt;
    }

    // Método para limpar a tabela (EmptyTable)
    public function clearTable() {
        $query = "TRUNCATE TABLE " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}