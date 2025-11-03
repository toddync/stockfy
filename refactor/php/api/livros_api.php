<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Livro.php';

$database = new Database();
$db = $database->getConnection();

$livro = new Livro($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["Datmov"]) && !empty($_GET["Item"])) {
            $livro->Datmov = $_GET["Datmov"];
            $livro->Item = $_GET["Item"];
            if ($livro->findByPrimaryKey($livro->Datmov, $livro->Item)) {
                $livro_arr = array(
                    "Datmov" => $livro->Datmov,
                    "Item" => $livro->Item,
                    "Histor" => $livro->Histor,
                    "Observ" => $livro->Observ,
                    "Oripag" => $livro->Oripag,
                    "Tippag" => $livro->Tippag,
                    "Numpag" => $livro->Numpag,
                    "Valpag" => $livro->Valpag,
                    "Sinal" => $livro->Sinal,
                    "Tipdoc" => $livro->Tipdoc,
                    "Numdoc" => $livro->Numdoc,
                    "Parcel" => $livro->Parcel
                );
                http_response_code(200);
                echo json_encode($livro_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Livro não encontrado."));
            }
        } else {
            $stmt = $livro->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $livros_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $livro_item = array(
                        "Datmov" => $Datmov,
                        "Item" => $Item,
                        "Histor" => $Histor,
                        "Observ" => $Observ,
                        "Oripag" => $Oripag,
                        "Tippag" => $Tippag,
                        "Numpag" => $Numpag,
                        "Valpag" => $Valpag,
                        "Sinal" => $Sinal,
                        "Tipdoc" => $Tipdoc,
                        "Numdoc" => $Numdoc,
                        "Parcel" => $Parcel
                    );
                    array_push($livros_arr, $livro_item);
                }
                http_response_code(200);
                echo json_encode($livros_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum livro encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Datmov) &&
            !empty($data->Item) &&
            !empty($data->Histor) &&
            !empty($data->Valpag)
        ) {
            $livro->Datmov = $data->Datmov;
            $livro->Item = $data->Item;
            $livro->Histor = $data->Histor;
            $livro->Observ = $data->Observ ?? null;
            $livro->Oripag = $data->Oripag ?? null;
            $livro->Tippag = $data->Tippag ?? null;
            $livro->Numpag = $data->Numpag ?? null;
            $livro->Valpag = $data->Valpag;
            $livro->Sinal = $data->Sinal ?? null;
            $livro->Tipdoc = $data->Tipdoc ?? null;
            $livro->Numdoc = $data->Numdoc ?? null;
            $livro->Parcel = $data->Parcel ?? null;

            if ($livro->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Livro foi criado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o livro."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o livro. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Datmov) &&
            !empty($data->Item) &&
            !empty($data->Histor) &&
            !empty($data->Valpag)
        ) {
            $livro->Datmov = $data->Datmov;
            $livro->Item = $data->Item;
            $livro->Histor = $data->Histor;
            $livro->Observ = $data->Observ ?? null;
            $livro->Oripag = $data->Oripag ?? null;
            $livro->Tippag = $data->Tippag ?? null;
            $livro->Numpag = $data->Numpag ?? null;
            $livro->Valpag = $data->Valpag;
            $livro->Sinal = $data->Sinal ?? null;
            $livro->Tipdoc = $data->Tipdoc ?? null;
            $livro->Numdoc = $data->Numdoc ?? null;
            $livro->Parcel = $data->Parcel ?? null;

            if ($livro->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Livro foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o livro."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o livro. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->Datmov) && !empty($data->Item)) {
            $livro->Datmov = $data->Datmov;
            $livro->Item = $data->Item;

            if ($livro->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Livro foi excluído."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o livro."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o livro. Dados incompletos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>