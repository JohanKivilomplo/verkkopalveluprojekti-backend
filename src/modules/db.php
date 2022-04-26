<?php
//require 'config.php';

//Tässä haetaan tiedot init-tiedostosta. 
//Voit käyttää myös ylempänä olevaa config.php tiedostoa
//jos haluat. Kommentoi silloin seuraavat rivit.



// MUUTA TIETOKANNAN MUKAISET NIMET TÄHÄN!!!

function getPdoConnection(){
    $init = parse_ini_file(BASE_DIR."conf.ini");
    $host = $init["host"];
    $db = $init["database"];
    $uname = $init["user"];
    $pw = $init["password"];

    $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

    try {
        $pdo = new PDO($dsn, $uname, $pw);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

    return $pdo;
}