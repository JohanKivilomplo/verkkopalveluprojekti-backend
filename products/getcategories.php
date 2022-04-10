<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try {
    $db = openDb();
    selectAsJson($db,"select * from tuoteryhma order by tuoteryhmanro");
} catch (PDOException $pdoex) {
    returnError($pdoex);
}

//http://localhost/verkkopalveluprojekti-backend/products/getcategories.php