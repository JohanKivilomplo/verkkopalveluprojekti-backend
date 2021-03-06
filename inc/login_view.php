<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kirjautuminen</title>
</head>
<body>

<?php
require_once 'functions.php';
require_once 'headers.php';
include('../src/login.php');

$uname = filter_input(INPUT_POST, "username");
$pw = filter_input(INPUT_POST, "salasana");

if(!isset($_SESSION["username"]) && isset($uname)){

    try {
        login($uname, $pw);
        header("Location: login_view.php");
        exit;
    } catch (Exception $e) {
        echo '<div class="alert alert-danger" role="alert">'.$e->getMessage().'</div>';
    }
   
}

    if(!isset($_SESSION["username"])){
        
    ?>





        <form action="login_view.php" method="post">
        <label for="username">Username:</label><br>
        <input type="text" name="username" id="username"><br>
        <label for="password">Password:</label><br>
        <input type="password" name="salasana" id="salasana"><br>
        <input type="submit" class="btn btn-primary" value="Log in">
        </form>

    <?php } ?>

        
</body>
</html>



    
    