<?php
//require 'config.php';

//Tässä haetaan tiedot init-tiedostosta. 
//Voit käyttää myös ylempänä olevaa config.php tiedostoa
//jos haluat. Kommentoi silloin seuraavat rivit.



// MUUTA TIETOKANNAN MUKAISET NIMET TÄHÄN!!!

function getPdoConnection(){
    $init = parse_ini_file("../config.ini");
    $host = $init["host"];
    $db = $init["database"];
    $user = $init["user"];
    $dbpw = $init["dbpassword"];

    $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

    try {
        $pdo = new PDO($dsn, $user, $dbpw);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

    return $pdo;
}