<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/AuxCliente.php';

$database = new Database();
$db = $database->getConnection();

$auxCliente = new AuxCliente($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["search_by"]) && !empty($_GET["keywords"])) {
            $search_by = $_GET["search_by"];
            $keywords = $_GET["keywords"];
            $stmt = $auxCliente->search($keywords, $search_by);
        } else {
            $stmt = $auxCliente->read();
        }

        $num = $stmt->rowCount();

        if ($num > 0) {
            $clientes_arr = array();
            $clientes_arr["records"] = array();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $cliente_item = array(
                    "id" => $id,
                    "codcli" => $codcli,
                    "ncpf" => $ncpf,
                    "nifp" => $nifp,
                    "bair" => $bair,
                    "cida" => $cida,
                    "esta" => $esta,
                    "ncep" => $ncep,
                    "ntel" => $ntel,
                    "conta" => $conta,
                    "vend" => $vend,
                    "lcred" => $lcred,
                    "datimp" => $datimp,
                    "nommae" => $nommae,
                    "nompai" => $nompai,
                    "datnasc" => $datnasc,
                    "natu" => $natu,
                    "rota" => $rota,
                    "praca" => $praca,
                    "refer" => $refer,
                    "oldcli" => $oldcli,
                    "situ" => $situ,
                    "nome" => $nome,
                    "ende" => $ende,
                    "horain" => $horain,
                    "horafin" => $horafin,
                    "visita" => $visita,
                    "ativo" => $ativo,
                    "esped" => $esped,
                    "obsv" => $obsv
                );
                array_push($clientes_arr["records"], $cliente_item);
            }
            http_response_code(200);
            echo json_encode($clientes_arr);
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Nenhum cliente encontrado."));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data) && is_array($data)) { // Suporta array de clientes para importação em lote
            $imported_count = 0;
            foreach ($data as $item) {
                // Atribuir valores ao objeto AuxCliente
                $auxCliente->codcli = $item->codcli ?? null;
                $auxCliente->ncpf = $item->ncpf ?? null;
                $auxCliente->nifp = $item->nifp ?? null;
                $auxCliente->bair = $item->bair ?? null;
                $auxCliente->cida = $item->cida ?? null;
                $auxCliente->esta = $item->esta ?? null;
                $auxCliente->ncep = $item->ncep ?? null;
                $auxCliente->ntel = $item->ntel ?? null;
                $auxCliente->conta = $item->conta ?? null;
                $auxCliente->vend = $item->vend ?? null;
                $auxCliente->lcred = $item->lcred ?? null;
                $auxCliente->datimp = $item->datimp ?? null;
                $auxCliente->nommae = $item->nommae ?? null;
                $auxCliente->nompai = $item->nompai ?? null;
                $auxCliente->datnasc = $item->datnasc ?? null;
                $auxCliente->natu = $item->natu ?? null;
                $auxCliente->rota = $item->rota ?? null;
                $auxCliente->praca = $item->praca ?? null;
                $auxCliente->refer = $item->refer ?? null;
                $auxCliente->oldcli = $item->oldcli ?? null;
                $auxCliente->situ = $item->situ ?? 'I'; // Default 'I' como no Pascal
                $auxCliente->nome = $item->nome ?? null;
                $auxCliente->ende = $item->ende ?? null;
                $auxCliente->horain = $item->horain ?? null;
                $auxCliente->horafin = $item->horafin ?? null;
                $auxCliente->visita = $item->visita ?? null;
                $auxCliente->ativo = $item->ativo ?? null;
                $auxCliente->esped = $item->esped ?? null;
                $auxCliente->obsv = $item->obsv ?? null;

                if ($auxCliente->create()) {
                    $imported_count++;
                }
            }
            if ($imported_count > 0) {
                http_response_code(201);
                echo json_encode(array("message" => "{$imported_count} clientes importados com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível importar os clientes."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível importar clientes. Dados incompletos ou formato inválido."));
        }
        break;

    case 'DELETE':
        if ($auxCliente->clearTable()) {
            http_response_code(200);
            echo json_encode(array("message" => "Tabela de clientes limpa com sucesso."));
        } else {
            http_response_code(503);
            echo json_encode(array("message" => "Não foi possível limpar a tabela de clientes."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}