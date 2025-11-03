<?php

require_once __DIR__ . '/../core/Database.php';

class RelatorioSaida {
    private $db;

    public function __construct() {
        $this->db = Database::getInstance();
    }

    /**
     * Busca os dados para um relatório de pedido individual.
     * @param string $numeroPedido O número do pedido.
     * @return array|false Os dados do pedido e seus itens, ou false se não encontrado.
     */
    public function getPedidoIndividual(string $numeroPedido) {
        $sql = "
            SELECT
                p.id AS pedido_id,
                p.data_emissao,
                p.data_entrega,
                p.valor_total,
                p.status,
                p.observacoes,
                c.nome AS cliente_nome,
                c.cpf_cnpj AS cliente_documento,
                c.endereco AS cliente_endereco,
                c.cidade AS cliente_cidade,
                c.estado AS cliente_estado,
                v.nome AS vendedor_nome,
                pi.quantidade,
                pi.preco_unitario,
                pi.valor_total AS item_valor_total,
                prod.descricao AS produto_descricao,
                prod.codigo_barras
            FROM
                pedidos p
            JOIN
                clientes c ON p.cliente_id = c.id
            LEFT JOIN
                vendedores v ON p.vendedor_id = v.id
            JOIN
                pedido_itens pi ON p.id = pi.pedido_id
            JOIN
                produtos prod ON pi.produto_id = prod.id
            WHERE
                p.id = :numeroPedido;
        ";
        $stmt = $this->db->getConnection()->prepare($sql);
        $stmt->bindParam(':numeroPedido', $numeroPedido, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Busca os dados para um relatório de etiquetas por faixa.
     * @param string $etiquetaInicial A etiqueta inicial da faixa.
     * @param string $etiquetaFinal A etiqueta final da faixa.
     * @param string $vendedor O nome ou ID do vendedor (opcional).
     * @return array Os dados das etiquetas.
     */
    public function getEtiquetasPorFaixa(string $etiquetaInicial, string $etiquetaFinal, string $vendedor = '') {
        // Esta é uma simulação. A tabela 'etiquetas' não foi detalhada no schema proposal.
        // Assumindo uma tabela 'etiquetas' com id, cod_cliente, nome_cliente, endereco, vendedor_id, nome_vendedor
        $sql = "
            SELECT
                e.id AS etiqueta_id,
                e.cod_cliente,
                e.nome_cliente,
                e.sobrenome_cliente,
                e.endereco,
                e.bairro,
                e.cidade,
                e.estado,
                e.cep,
                v.nome AS vendedor_nome
            FROM
                etiquetas e
            LEFT JOIN
                vendedores v ON e.vendedor_id = v.id
            WHERE
                e.id BETWEEN :etiquetaInicial AND :etiquetaFinal
        ";

        if (!empty($vendedor)) {
            $sql .= " AND v.nome LIKE :vendedor";
        }

        $stmt = $this->db->getConnection()->prepare($sql);
        $stmt->bindParam(':etiquetaInicial', $etiquetaInicial, PDO::PARAM_INT);
        $stmt->bindParam(':etiquetaFinal', $etiquetaFinal, PDO::PARAM_INT);
        if (!empty($vendedor)) {
            $vendedorParam = '%' . $vendedor . '%';
            $stmt->bindParam(':vendedor', $vendedorParam, PDO::PARAM_STR);
        }
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Busca os dados para um relatório de pedidos por faixa.
     * @param string $pedidoInicial O número do pedido inicial da faixa.
     * @param string $pedidoFinal O número do pedido final da faixa.
     * @param string $vendedor O nome ou ID do vendedor (opcional).
     * @return array Os dados dos pedidos.
     */
    public function getPedidosPorFaixa(string $pedidoInicial, string $pedidoFinal, string $vendedor = '') {
        $sql = "
            SELECT
                p.id AS pedido_id,
                p.data_emissao,
                p.valor_total,
                p.status,
                c.nome AS cliente_nome,
                v.nome AS vendedor_nome
            FROM
                pedidos p
            JOIN
                clientes c ON p.cliente_id = c.id
            LEFT JOIN
                vendedores v ON p.vendedor_id = v.id
            WHERE
                p.id BETWEEN :pedidoInicial AND :pedidoFinal
        ";

        if (!empty($vendedor)) {
            $sql .= " AND v.nome LIKE :vendedor";
        }

        $stmt = $this->db->getConnection()->prepare($sql);
        $stmt->bindParam(':pedidoInicial', $pedidoInicial, PDO::PARAM_INT);
        $stmt->bindParam(':pedidoFinal', $pedidoFinal, PDO::PARAM_INT);
        if (!empty($vendedor)) {
            $vendedorParam = '%' . $vendedor . '%';
            $stmt->bindParam(':vendedor', $vendedorParam, PDO::PARAM_STR);
        }
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}