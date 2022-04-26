<?php

include '../inc/headers.php';

$sukunimi = filter_var($input -> sukunimi, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$osoite = filter_var($input -> osoite, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postinro = filter_var($input -> postinro, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postitmp = filter_var($input -> postitmp, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$cart = $input -> cart;

try {
    $db = openDb(); 
    $db -> beginTransaction();
    

    // Insert asiakas
    $sql = "insert into customer (etunimi,sukunimi,osoite,postinro,postitmp) values
    ('" .
        filter_var($etunimi, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($sukunimi, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($osoite, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($postinro, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','".
        filter_var($postitmp, FILTER_SANITIZE_FULL_SPECIAL_CHARS)
    . "')";

    $asiakasnro = executeInsert($db, $sql);

    // Insert Order
    $sql = "insert into 'order' (asiakasnro) values ($asiakasnro)";
    $order_id = executeInsert($db, $sql);

        foreach ($cart as $product) {
          $sql = "insert into tilausrivi (tilausnro, tuotenro) values ("
        .
          $tilausnro . "," .
          $tuote -> tuotenimi
          . ")";
          executeInsert($db, $sql);
        }

        $db -> commit(); 

        header('HTTP/1.1 200 OK');
        $data = array('id' => $asiakasnro);
        echo json_encode($data);
}
catch (PDOException $pdoex) {
    $db -> rollback();
    returnError($pdoex);
}
