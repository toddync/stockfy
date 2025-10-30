<?php
class ContagemEstoque {
    private $conn;
    private $table_name = "contagens_estoque";

    public $id;
    public $data_contagem;
    public $tipo;
    public $produto_id;
    public $descricao_produto;
    public $grupo_produto;
    public $quantidade_inicial;
    public $quantidade_sacol;
    public $preco_custo_contagem;
    public $data_registro;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function readByDate($data_contagem, $tipo = null) {
        $query = "SELECT
                    c.id, c.data_contagem, c.tipo, c.produto_id, c.descricao_produto,
                    c.grupo_produto, c.quantidade_inicial, c.quantidade_sacol,
                    c.preco_custo_contagem, c.data_registro
                  FROM
                    " . $this->table_name . " c
                  WHERE
                    c.data_contagem = :data_contagem";
        
        if ($tipo !== null) {
            $query .= " AND c.tipo = :tipo";
        }
        
        $query .= " ORDER BY c.produto_id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":data_contagem", $data_contagem);
        if ($tipo !== null) {
            $stmt->bindParam(":tipo", $tipo);
        }
        $stmt->execute();
        return $stmt;
    }

    public function readByType($tipo) {
        $query = "SELECT
                    c.id, c.data_contagem, c.tipo, c.produto_id, c.descricao_produto,
                    c.grupo_produto, c.quantidade_inicial, c.quantidade_sacol,
                    c.preco_custo_contagem, c.data_registro
                  FROM
                    " . $this->table_name . " c
                  WHERE
                    c.tipo = :tipo
                  ORDER BY
                    c.data_contagem DESC, c.produto_id ASC";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":tipo", $tipo);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = "INSERT INTO
                    " . $this->table_name . "
                  SET
                    data_contagem=:data_contagem, tipo=:tipo, produto_id=:produto_id,
                    descricao_produto=:descricao_produto, grupo_produto=:grupo_produto,
                    quantidade_inicial=:quantidade_inicial, quantidade_sacol=:quantidade_sacol,
                    preco_custo_contagem=:preco_custo_contagem";

        $stmt = $this->conn->prepare($query);

        $this->data_contagem = htmlspecialchars(strip_tags($this->data_contagem));
        $this->tipo = htmlspecialchars(strip_tags($this->tipo));
        $this->produto_id = htmlspecialchars(strip_tags($this->produto_id));
        $this->descricao_produto = htmlspecialchars(strip_tags($this->descricao_produto));
        $this->grupo_produto = htmlspecialchars(strip_tags($this->grupo_produto));
        $this->quantidade_inicial = htmlspecialchars(strip_tags($this->quantidade_inicial));
        $this->quantidade_sacol = htmlspecialchars(strip_tags($this->quantidade_sacol));
        $this->preco_custo_contagem = htmlspecialchars(strip_tags($this->preco_custo_contagem));

        $stmt->bindParam(":data_contagem", $this->data_contagem);
        $stmt->bindParam(":tipo", $this->tipo);
        $stmt->bindParam(":produto_id", $this->produto_id);
        $stmt->bindParam(":descricao_produto", $this->descricao_produto);
        $stmt->bindParam(":grupo_produto", $this->grupo_produto);
        $stmt->bindParam(":quantidade_inicial", $this->quantidade_inicial);
        $stmt->bindParam(":quantidade_sacol", $this->quantidade_sacol);
        $stmt->bindParam(":preco_custo_contagem", $this->preco_custo_contagem);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function update() {
        $query = "UPDATE
                    " . $this->table_name . "
                  SET
                    quantidade_inicial = :quantidade_inicial,
                    preco_custo_contagem = :preco_custo_contagem
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        $this->quantidade_inicial = htmlspecialchars(strip_tags($this->quantidade_inicial));
        $this->preco_custo_contagem = htmlspecialchars(strip_tags($this->preco_custo_contagem));
        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':quantidade_inicial', $this->quantidade_inicial);
        $stmt->bindParam(':preco_custo_contagem', $this->preco_custo_contagem);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function deleteByDate() {
        $query = "DELETE FROM " . $this->table_name . " WHERE data_contagem = :data_contagem";
        $stmt = $this->conn->prepare($query);

        $this->data_contagem = htmlspecialchars(strip_tags($this->data_contagem));
        $stmt->bindParam(":data_contagem", $this->data_contagem);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function existsByDate($data_contagem) {
        $query = "SELECT COUNT(*) as count FROM " . $this->table_name . " WHERE data_contagem = :data_contagem";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":data_contagem", $data_contagem);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row['count'] > 0;
    }

    public function readByProductAndDate($data_contagem, $produto_id, $tipo = 'ajuste') {
        $query = "SELECT
                    c.id, c.data_contagem, c.tipo, c.produto_id, c.descricao_produto,
                    c.grupo_produto, c.quantidade_inicial, c.quantidade_sacol,
                    c.preco_custo_contagem, c.data_registro
                  FROM
                    " . $this->table_name . " c
                  WHERE
                    c.data_contagem = :data_contagem AND c.produto_id = :produto_id AND c.tipo = :tipo
                  LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":data_contagem", $data_contagem);
        $stmt->bindParam(":produto_id", $produto_id);
        $stmt->bindParam(":tipo", $tipo);
        $stmt->execute();

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($row) {
            $this->id = $row['id'];
            $this->data_contagem = $row['data_contagem'];
            $this->tipo = $row['tipo'];
            $this->produto_id = $row['produto_id'];
            $this->descricao_produto = $row['descricao_produto'];
            $this->grupo_produto = $row['grupo_produto'];
            $this->quantidade_inicial = $row['quantidade_inicial'];
            $this->quantidade_sacol = $row['quantidade_sacol'];
            $this->preco_custo_contagem = $row['preco_custo_contagem'];
            $this->data_registro = $row['data_registro'];
            return true;
        }
        return false;
    }

    public function updateSacola($id, $quantidade_sacol) {
        $query = "UPDATE
                    " . $this->table_name . "
                  SET
                    quantidade_sacol = :quantidade_sacol
                  WHERE
                    id = :id";

        $stmt = $this->conn->prepare($query);

        $this->quantidade_sacol = htmlspecialchars(strip_tags($quantidade_sacol));
        $this->id = htmlspecialchars(strip_tags($id));

        $stmt->bindParam(':quantidade_sacol', $this->quantidade_sacol);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>