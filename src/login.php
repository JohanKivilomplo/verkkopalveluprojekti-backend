<?php
    require('db.php');

    $uname = filter_input(INPUT_POST, "username");
    $pw = filter_input(INPUT_POST, "password");

// Tarkistetaan onko muuttujia asetettu

if( !isset($uname) || !isset($pw) ){
    echo "Parametreja puuttui! Ei voida lisätä henkilöä";
    exit;
}

// Tarkistetaan, ettei tyhjiä arvoja muuttujissa
if( empty($uname) || empty($pw) ){
    echo "Et voi asettaa tyhjiä arvoja!";
    exit;
}

?>

// Tietokantahaun lisäys käyttäjänimellä (kopioi add_person.php:sta, videolla kohta 41:00)
// Salasanan verifioinnin kokeilu

