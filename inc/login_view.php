<?php
require_once 'functions.php';
require_once 'headers.php';

include('../src/login.php'); /* <-- Osoite ei vielä oikea */
    echo '<form action="../src/modules/login.php" method="post">
        <label for="username">Username:</label><br>
        <input type="text" name="username" id="username"><br>
        <label for="password">Password:</label><br>
        <input type="password" name="password" id="password"><br>
        <input type="submit" class="btn btn-primary" value "Log in">
    </form>';
include('../'); // muuta osoite

?>

    
    