<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../core/Database.php';
include_once '../models/Usuario.php';
include_once '../models/Permissao.php';

$database = new Database();
$db = $database->getConnection();

$usuario = new Usuario($db);
$permissao = new Permissao($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["nome"])) {
            $usuario->nome = $_GET["nome"];
            if ($usuario->readOne()) {
                $usuario_arr = array(
                    "id" => $usuario->id,
                    "nome" => $usuario->nome,
                    "ativo" => $usuario->ativo
                );
                http_response_code(200);
                echo json_encode($usuario_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Usuário não encontrado."));
            }
        } elseif (!empty($_GET["usuario_id"]) && isset($_GET["permissoes"])) {
            $usuario_id = $_GET["usuario_id"];
            $stmt = $permissao->getUserPermissions($usuario_id);
            $num = $stmt->rowCount();

            if ($num > 0) {
                $permissoes_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $permissao_item = array(
                        "chave" => $chave,
                        "descricao" => $descricao
                    );
                    array_push($permissoes_arr, $permissao_item);
                }
                http_response_code(200);
                echo json_encode($permissoes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma permissão encontrada para este usuário."));
            }
        } elseif (isset($_GET["permissoes_disponiveis"])) {
            $stmt = $permissao->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $permissoes_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $permissao_item = array(
                        "id" => $id,
                        "chave" => $chave,
                        "descricao" => $descricao
                    );
                    array_push($permissoes_arr, $permissao_item);
                }
                http_response_code(200);
                echo json_encode($permissoes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma permissão disponível."));
            }
        } else {
            $stmt = $usuario->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $usuarios_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $usuario_item = array(
                        "id" => $id,
                        "nome" => $nome,
                        "ativo" => $ativo
                    );
                    array_push($usuarios_arr, $usuario_item);
                }
                http_response_code(200);
                echo json_encode($usuarios_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum usuário encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->nome) && !empty($data->senha)) {
            $usuario->nome = $data->nome;
            $usuario->senha_hash = password_hash($data->senha, PASSWORD_DEFAULT);
            $usuario->ativo = isset($data->ativo) ? $data->ativo : true;

            if ($usuario->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Usuário criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o usuário."));
            }
        } elseif (!empty($data->usuario_id) && !empty($data->permissao_id)) {
            $permissao->usuario_id = $data->usuario_id;
            $permissao->permissao_id = $data->permissao_id;

            if ($permissao->assignPermissionToUser()) {
                http_response_code(201);
                echo json_encode(array("message" => "Permissão atribuída ao usuário com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atribuir a permissão."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para criar usuário ou atribuir permissão."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->nome) && !empty($data->senha)) {
            $usuario->nome = $data->nome;
            $usuario->senha_hash = password_hash($data->senha, PASSWORD_DEFAULT);
            $usuario->ativo = isset($data->ativo) ? $data->ativo : true;

            if ($usuario->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Usuário atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o usuário."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para atualizar o usuário."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->nome)) {
            $usuario->nome = $data->nome;
            if ($usuario->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Usuário excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o usuário."));
            }
        } elseif (!empty($data->usuario_id) && !empty($data->permissao_id)) {
            $permissao->usuario_id = $data->usuario_id;
            $permissao->permissao_id = $data->permissao_id;

            if ($permissao->removePermissionFromUser()) {
                http_response_code(200);
                echo json_encode(array("message" => "Permissão removida do usuário com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível remover a permissão."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para excluir usuário ou remover permissão."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}