<?php
$hostname = "mariadb";
$username = "root";
$password = "admin123";
$dbname = "db_tandur"; 

$conn = mysqli_connect($hostname, $username, $password, $dbname); 
 
if (!$conn) {
    die("Koneksi Gagal : " . mysqli_connect_error());
} 