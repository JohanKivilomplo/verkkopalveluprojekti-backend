<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';


$input = json_decode(file_get_contents('php://input'));
$sahkoposti = filter_var($input->sahkoposti, FILTER_SANITIZE_SPECIAL_CHARS);
$palaute = filter_var($input->palaute, FILTER_SANITIZE_SPECIAL_CHARS);


try{
$db = openDB();

$query = $db->prepare('insert into palaute(sahkoposti,palaute) values (:sahkoposti, :palaute)');
$query->bindValue(':sahkoposti', $sahkoposti, PDO::PARAM_STR);
$query->bindValue(':palaute', $palaute, PDO::PARAM_STR);
$query->execute();
header('HTTP/1.1 200 OK');
$data = array('id' => $db->lastInsertId(),'palaute' => $palaute, 'sahkoposti' => $sahkoposti);
print json_encode($data);
} catch (PDOException $pdoex){
    header('HTTP/1.1 500 Internal Server Error');
    $error = array('error' => $pdoex->getMessage());
    print json_encode($error);
}