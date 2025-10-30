<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Etiqueta.php';
include_once '../models/Cliente.php';
include_once '../models/Vendedor.php';

$database = new Database();
$db = $database->getConnection();

$etiqueta = new Etiqueta($db);
$cliente = new Cliente($db);
$vendedor = new Vendedor($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $etiqueta->idetiq = $_GET["id"];
            $etiqueta->readOne();
            if ($etiqueta->codcli != null) {
                http_response_code(200);
                echo json_encode($etiqueta);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Etiqueta não encontrada."));
            }
        } elseif (!empty($_GET["last_id"])) {
            $last_id = $etiqueta->getLastId();
            if ($last_id !== false) {
                http_response_code(200);
                echo json_encode(array("last_id" => $last_id));
            } else {
                http_response_code(500);
                echo json_encode(array("message" => "Não foi possível obter o último ID da etiqueta."));
            }
        } else {
            $stmt = $etiqueta->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $etiquetas_arr = array();
                $etiquetas_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $etiqueta_item = array(
                        "idetiq" => $idetiq,
                        "codcli" => $codcli,
                        "nomcli" => $nomcli,
                        "sobnom" => $sobnom,
                        "bairro" => $bairro,
                        "codven" => $codven,
                        "nomven" => $nomven
                    );
                    array_push($etiquetas_arr["records"], $etiqueta_item);
                }
                http_response_code(200);
                echo json_encode($etiquetas_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma etiqueta encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->codcli) &&
            !empty($data->nomcli) &&
            !empty($data->bairro) &&
            !empty($data->codven) &&
            !empty($data->nomven)
        ) {
            $etiqueta->codcli = $data->codcli;
            $etiqueta->nomcli = substr($data->nomcli, 0, 20);
            $etiqueta->sobnom = substr($data->nomcli, 20, 15); // Assuming sobnom is part of nomcli
            $etiqueta->bairro = $data->bairro;
            $etiqueta->codven = $data->codven;
            $etiqueta->nomven = $data->nomven;

            if ($etiqueta->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Etiqueta criada com sucesso.", "idetiq" => $etiqueta->idetiq));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a etiqueta."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a etiqueta. Dados incompletos."));
        }
        break;

    case 'PUT':
        // Não há lógica de atualização explícita no UEtiqueta.pas, mas pode ser adicionado se necessário.
        http_response_code(405);
        echo json_encode(array("message" => "Método PUT não permitido para etiquetas."));
        break;

    case 'DELETE':
        // Não há lógica de exclusão explícita no UEtiqueta.pas, mas pode ser adicionado se necessário.
        http_response_code(405);
        echo json_encode(array("message" => "Método DELETE não permitido para etiquetas."));
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>