<?php
function login($uname, $pw){

    require_once 'modules/db.php';

    // $uname = filter_input(INPUT_POST, "username");
    // $pw = filter_input(INPUT_POST, "password");

    //Tarkistetaan onko muttujia asetettu
    if( !isset($uname) || !isset($pw) ){
        throw new Exception("Missing parameters. Cannot log in.");
    }

    //Tarkistetaan, ettei tyhjiä arvoja muuttujissa
    if( empty($uname) || empty($pw) ){
        throw new Exception("Cannot log in with empty values.");
    }

    try{
        $pdo = getPdoConnection();
        //Haetaan käyttäjä annetulla käyttäjänimellä
        $sql = "SELECT firstname, lastname, username, salasana FROM person WHERE username=?";
        $statement = $pdo->prepare($sql);
        $statement->bindParam(1, $uname);
        $statement->execute();

        if($statement->rowCount() <=0){
            throw new Exception("Person not found! Cannot log in!");
        }

        $row = $statement->fetch();

        //Tarkistetaan käyttäjän antama salasana tietokannan salasanaa vasten
        if(!password_verify($pw, $row["salasana"] )){
            throw new Exception("Wrong password!!");
        }

        //Jos käyttäjä tunnistettu, talletetaan käyttäjän tiedot sessioon
        $_SESSION["username"] = $uname;
        $_SESSION["fname"] = $row["firstname"];
        $_SESSION["lname"] = $row["lastname"];


        echo "Tervetuloa";

    }catch(PDOException $e){
        echo "Kirjautuminen ei onnistunut";
        echo $e->getMessage();
    }

}

function logout(){
    //Tyhjennetään ja tuhotaan nykyinen sessio.
    try{
        session_unset();
        session_destroy();
    }catch(Exception $e){
        throw $e;
    }
}

?>