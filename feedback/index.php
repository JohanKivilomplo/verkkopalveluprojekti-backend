<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try{
$db = getPdoConnection();
$sql = "select * from palaute";
$query = $db->query($sql); 
$results = $query->fetchAll(PDO::FETCH_ASSOC);
header('HTTP/1.1 200 OK');
print json_encode($results);
} catch (PDOException $pdoex){
    header('HTTP/1.1 500 Internal Server Error');
    $error = array('error' => $pdoex->getMessage());
    print json_encode($error);
}