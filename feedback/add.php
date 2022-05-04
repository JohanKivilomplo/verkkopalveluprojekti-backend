<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';


$input = json_decode(file_get_contents('php://input'));
$etunimi = filter_var($input->etunimi, FILTER_SANITIZE_SPECIAL_CHARS);
$sukunimi = filter_var($input->sukunimi, FILTER_SANITIZE_SPECIAL_CHARS);
$sahkoposti = filter_var($input->sahkoposti, FILTER_SANITIZE_SPECIAL_CHARS);
$palaute = filter_var($input->palaute, FILTER_SANITIZE_SPECIAL_CHARS);


try{
$db = getPdoConnection();

$query = $db->prepare('insert into palaute(etunimi,sukunimi,sahkoposti,palaute) values (:etunimi,:sukunimi,:sahkoposti,:palaute)');
$query->bindValue(':etunimi', $etunimi, PDO::PARAM_STR);
$query->bindValue(':sukunimi', $sukunimi, PDO::PARAM_STR);
$query->bindValue(':sahkoposti', $sahkoposti, PDO::PARAM_STR);
$query->bindValue(':palaute', $palaute, PDO::PARAM_STR);
$query->execute();
header('HTTP/1.1 200 OK');
$data = array('id' => $db->lastInsertId(),'etunimi' => $etunimi,'sukunimi' => $sukunimi, 'palaute' => $palaute, 'sahkoposti' => $sahkoposti);
print json_encode($data);
} catch (PDOException $pdoex){
    header('HTTP/1.1 500 Internal Server Error');
    $error = array('error' => $pdoex->getMessage());
    print json_encode($error);
}