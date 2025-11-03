<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../core/Database.php';
include_once '../models/Vendedor.php';
include_once '../models/Rota.php';

$database = new Database();
$db = $database->getConnection();

$vendedor = new Vendedor($db);
$rota = new Rota($db);

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"));

switch ($method) {
    case 'GET':
        if (isset($_GET['action']) && $_GET['action'] == 'get_rotas') {
            $stmt = $rota->read();
            $rotas_arr = array();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $rota_item = array(
                    "rota" => $Rota,
                    "nome" => $Nome
                );
                array_push($rotas_arr, $rota_item);
            }
            http_response_code(200);
            echo json_encode($rotas_arr);
        } elseif (isset($_GET['codven'])) {
            $vendedor->codven = $_GET['codven'];
            if ($vendedor->readOne()) {
                $vendedor_arr = array(
                    "codven" => $vendedor->codven,
                    "nome" => $vendedor->nome,
                    "ncpf" => $vendedor->ncpf,
                    "nifp" => $vendedor->nifp,
                    "ende" => $vendedor->ende,
                    "bair" => $vendedor->bair,
                    "cida" => $vendedor->cida,
                    "esta" => $vendedor->esta,
                    "ncep" => $vendedor->ncep,
                    "ntel1" => $vendedor->ntel1,
                    "ntel2" => $vendedor->ntel2,
                    "ntel3" => $vendedor->ntel3,
                    "ntel4" => $vendedor->ntel4,
                    "praca1" => $vendedor->praca1,
                    "praca2" => $vendedor->praca2,
                    "praca3" => $vendedor->praca3,
                    "praca4" => $vendedor->praca4,
                    "email" => $vendedor->email,
                    "datsol" => $vendedor->datsol,
                    "numsol" => $vendedor->numsol
                );
                http_response_code(200);
                echo json_encode($vendedor_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Vendedor not found."));
            }
        } elseif (isset($_GET['action']) && $_GET['action'] == 'get_new_codven') {
            $new_codven = $vendedor->getNewCodven();
            http_response_code(200);
            echo json_encode(array("new_codven" => $new_codven));
        } else {
            $stmt = $vendedor->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $vendedores_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $vendedor_item = array(
                        "codven" => $Codven,
                        "nome" => $Nome,
                        "ncpf" => $Ncpf,
                        "email" => $Email
                    );
                    array_push($vendedores_arr, $vendedor_item);
                }
                http_response_code(200);
                echo json_encode($vendedores_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "No vendedores found."));
            }
        }
        break;

    case 'POST':
        if (
            !empty($data->codven) &&
            !empty($data->nome)
        ) {
            $vendedor->codven = $data->codven;
            $vendedor->nome = $data->nome;
            $vendedor->ncpf = $data->ncpf;
            $vendedor->nifp = $data->nifp;
            $vendedor->ende = $data->ende;
            $vendedor->bair = $data->bair;
            $vendedor->cida = $data->cida;
            $vendedor->esta = $data->esta;
            $vendedor->ncep = $data->ncep;
            $vendedor->ntel1 = $data->ntel1;
            $vendedor->ntel2 = $data->ntel2;
            $vendedor->ntel3 = $data->ntel3;
            $vendedor->ntel4 = $data->ntel4;
            $vendedor->praca1 = $data->praca1;
            $vendedor->praca2 = $data->praca2;
            $vendedor->praca3 = $data->praca3;
            $vendedor->praca4 = $data->praca4;
            $vendedor->email = $data->email;
            $vendedor->datsol = $data->datsol;
            $vendedor->numsol = $data->numsol;

            if ($vendedor->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Vendedor was created."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Unable to create vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Unable to create vendedor. Data is incomplete."));
        }
        break;

    case 'PUT':
        if (
            !empty($data->codven) &&
            !empty($data->nome)
        ) {
            $vendedor->codven = $data->codven;
            $vendedor->nome = $data->nome;
            $vendedor->ncpf = $data->ncpf;
            $vendedor->nifp = $data->nifp;
            $vendedor->ende = $data->ende;
            $vendedor->bair = $data->bair;
            $vendedor->cida = $data->cida;
            $vendedor->esta = $data->esta;
            $vendedor->ncep = $data->ncep;
            $vendedor->ntel1 = $data->ntel1;
            $vendedor->ntel2 = $data->ntel2;
            $vendedor->ntel3 = $data->ntel3;
            $vendedor->ntel4 = $data->ntel4;
            $vendedor->praca1 = $data->praca1;
            $vendedor->praca2 = $data->praca2;
            $vendedor->praca3 = $data->praca3;
            $vendedor->praca4 = $data->praca4;
            $vendedor->email = $data->email;
            $vendedor->datsol = $data->datsol;
            $vendedor->numsol = $data->numsol;

            if ($vendedor->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Vendedor was updated."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Unable to update vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Unable to update vendedor. Data is incomplete."));
        }
        break;

    case 'DELETE':
        if (isset($_GET['codven'])) {
            $vendedor->codven = $_GET['codven'];
            if ($vendedor->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Vendedor was deleted."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Unable to delete vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Unable to delete vendedor. codven is missing."));
        }
        break;
}
?>