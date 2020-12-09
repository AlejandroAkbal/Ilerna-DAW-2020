<?php
$host = "localhost";
$bd = "M07";
$user = "root";
$pass = "password";

$con = new mysqli($host, $user, $pass, $bd);

if ($con->connect_errno) {
    $message = "Connection to database failed.";
    echo $message;
    die($message);
}

$con->set_charset("UTF8");

return $con;
