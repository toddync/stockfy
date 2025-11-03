<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../core/Database.php';
include_once '../models/Solicitacao.php';
include_once '../models/ItemSolicitacao.php';
include_once '../models/Cliente.php';
include_once '../models/Vendedor.php';
include_once '../models/Artigo.php';

$database = new Database();
$db = $database->getInstance();

$solicitacao = new Solicitacao($db);
$itemSolicitacao = new ItemSolicitacao($db);
$cliente = new Cliente($db);
$vendedor = new Vendedor($db);
$artigo = new Artigo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["vendedor"]) && !empty($_GET["numero"])) {
            $solicitacao->vendedor = $_GET["vendedor"];
            $solicitacao->numero = $_GET["numero"];

            if ($solicitacao->readOne()) {
                $solicitacao_arr = array(
                    "vendedor" => $solicitacao->vendedor,
                    "numero" => $solicitacao->numero,
                    "cliente" => $solicitacao->cliente,
                    "nomcli" => $solicitacao->nomcli,
                    "datsol" => $solicitacao->datsol,
                    "situ" => $solicitacao->situ
                );

                $itemSolicitacao->vendedor = $_GET["vendedor"];
                $itemSolicitacao->numero = $_GET["numero"];
                $stmt_items = $itemSolicitacao->read();
                $num_items = $stmt_items->rowCount();

                $items_arr = array();
                while ($row_item = $stmt_items->fetch(PDO::FETCH_ASSOC)) {
                    extract($row_item);
                    $item_data = array(
                        "vendedor" => $vendedor,
                        "numero" => $numero,
                        "artigo" => $artigo,
                        "descricao" => $descricao,
                        "pequeno" => $pequeno,
                        "medio" => $medio,
                        "grande" => $grande,
                        "xgrande" => $xgrande,
                        "obser" => $obser
                    );
                    array_push($items_arr, $item_data);
                }
                $solicitacao_arr["items"] = $items_arr;

                http_response_code(200);
                echo json_encode($solicitacao_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Solicitação não encontrada."));
            }
        } elseif (!empty($_GET["vendedor"]) && isset($_GET["action"]) && $_GET["action"] == "generate_numero") {
            $new_numero = $solicitacao->generateNewNumero($_GET["vendedor"]);
            http_response_code(200);
            echo json_encode(array("new_numero" => $new_numero));
        } elseif (!empty($_GET["cliente_id"])) {
            $cliente->idcli = $_GET["cliente_id"];
            if ($cliente->readOne()) {
                $cliente_arr = array(
                    "idcli" => $cliente->idcli,
                    "nome" => $cliente->nome,
                    "endereco" => $cliente->endereco,
                    "bairro" => $cliente->bairro,
                    "cidade" => $cliente->cidade,
                    "cep" => $cliente->cep,
                    "estado" => $cliente->estado,
                    "refer" => $cliente->refer
                );
                http_response_code(200);
                echo json_encode($cliente_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Cliente não encontrado."));
            }
        } elseif (!empty($_GET["vendedor_id"])) {
            $vendedor->codven = $_GET["vendedor_id"];
            if ($vendedor->readOne()) {
                $vendedor_arr = array(
                    "codven" => $vendedor->codven,
                    "nome" => $vendedor->nome,
                    "cpf" => $vendedor->cpf,
                    "ie_rg" => $vendedor->ie_rg,
                    "endereco" => $vendedor->endereco,
                    "bairro" => $vendedor->bairro,
                    "cidade" => $vendedor->cidade,
                    "estado" => $vendedor->estado,
                    "cep" => $vendedor->cep,
                    "telefone1" => $vendedor->telefone1,
                    "telefone2" => $vendedor->telefone2,
                    "telefone3" => $vendedor->telefone3,
                    "telefone4" => $vendedor->telefone4,
                    "praca1" => $vendedor->praca1,
                    "praca2" => $vendedor->praca2,
                    "praca3" => $vendedor->praca3,
                    "praca4" => $vendedor->praca4,
                    "email" => $vendedor->email,
                    "data_solicitacao" => $vendedor->data_solicitacao,
                    "numero_solicitacao" => $vendedor->numero_solicitacao
                );
                http_response_code(200);
                echo json_encode($vendedor_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Vendedor não encontrado."));
            }
        } elseif (!empty($_GET["artigo_id"])) {
            $artigo->codigo = $_GET["artigo_id"];
            if ($artigo->readOne()) {
                $artigo_arr = array(
                    "codigo" => $artigo->codigo,
                    "descricao" => $artigo->descricao
                );
                http_response_code(200);
                echo json_encode($artigo_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Artigo não encontrado."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Parâmetros GET inválidos."));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->vendedor) && !empty($data->numero) &&
            !empty($data->cliente) && !empty($data->nomcli) &&
            !empty($data->datsol)
        ) {
            $solicitacao->vendedor = $data->vendedor;
            $solicitacao->numero = $data->numero;
            $solicitacao->cliente = $data->cliente;
            $solicitacao->nomcli = $data->nomcli;
            $solicitacao->datsol = $data->datsol;
            $solicitacao->situ = isset($data->situ) ? $data->situ : '';

            if ($solicitacao->create()) {
                if (isset($data->items) && is_array($data->items)) {
                    foreach ($data->items as $item_data) {
                        $itemSolicitacao->vendedor = $data->vendedor;
                        $itemSolicitacao->numero = $data->numero;
                        $itemSolicitacao->artigo = $item_data->artigo;
                        $itemSolicitacao->descricao = $item_data->descricao;
                        $itemSolicitacao->pequeno = $item_data->pequeno;
                        $itemSolicitacao->medio = $item_data->medio;
                        $itemSolicitacao->grande = $item_data->grande;
                        $itemSolicitacao->xgrande = $item_data->xgrande;
                        $itemSolicitacao->obser = isset($item_data->obser) ? $item_data->obser : '';

                        if (!$itemSolicitacao->create()) {
                            http_response_code(503);
                            echo json_encode(array("message" => "Não foi possível criar o item da solicitação."));
                            return;
                        }
                    }
                }
                http_response_code(201);
                echo json_encode(array("message" => "Solicitação criada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a solicitação."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a solicitação. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->vendedor) && !empty($data->numero) &&
            !empty($data->cliente) && !empty($data->nomcli) &&
            !empty($data->datsol)
        ) {
            $solicitacao->vendedor = $data->vendedor;
            $solicitacao->numero = $data->numero;
            $solicitacao->cliente = $data->cliente;
            $solicitacao->nomcli = $data->nomcli;
            $solicitacao->datsol = $data->datsol;
            $solicitacao->situ = isset($data->situ) ? $data->situ : '';

            if ($solicitacao->update()) {
                // Deleta todos os itens existentes e insere os novos
                $itemSolicitacao->vendedor = $data->vendedor;
                $itemSolicitacao->numero = $data->numero;
                $itemSolicitacao->deleteAllBySolicitacao(); // Ignora o resultado, tenta inserir os novos

                if (isset($data->items) && is_array($data->items)) {
                    foreach ($data->items as $item_data) {
                        $itemSolicitacao->vendedor = $data->vendedor;
                        $itemSolicitacao->numero = $data->numero;
                        $itemSolicitacao->artigo = $item_data->artigo;
                        $itemSolicitacao->descricao = $item_data->descricao;
                        $itemSolicitacao->pequeno = $item_data->pequeno;
                        $itemSolicitacao->medio = $item_data->medio;
                        $itemSolicitacao->grande = $item_data->grande;
                        $itemSolicitacao->xgrande = $item_data->xgrande;
                        $itemSolicitacao->obser = isset($item_data->obser) ? $item_data->obser : '';

                        if (!$itemSolicitacao->create()) {
                            http_response_code(503);
                            echo json_encode(array("message" => "Não foi possível atualizar o item da solicitação."));
                            return;
                        }
                    }
                }
                http_response_code(200);
                echo json_encode(array("message" => "Solicitação atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a solicitação."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a solicitação. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->vendedor) && !empty($data->numero)) {
            $solicitacao->vendedor = $data->vendedor;
            $solicitacao->numero = $data->numero;

            if ($solicitacao->delete()) {
                // Opcional: Deletar itens da solicitação também, se a lógica de negócio permitir
                $itemSolicitacao->vendedor = $data->vendedor;
                $itemSolicitacao->numero = $data->numero;
                $itemSolicitacao->deleteAllBySolicitacao();

                http_response_code(200);
                echo json_encode(array("message" => "Solicitação cancelada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível cancelar a solicitação."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível cancelar a solicitação. Dados incompletos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>