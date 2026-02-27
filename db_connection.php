<?php
function OpenConnection(){ 
    $dbhost= "localhost";
    $dbuser=  "root";
    $dbpass= "";
    $db= "gestion_absences";
    $conn = new mysqli($dbhost, $dbuser, $dbpass, $db);
    if ($conn->connect_error) {
        die("Erreur connexion: " . $conn->connect_error);
    }
    return $conn;

}

function CloseConnection($_con){ 
    mysqli_close($_con);

}
