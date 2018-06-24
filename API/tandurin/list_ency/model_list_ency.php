<?php
include 'config_list_ency.php';

function createEncy($conn, $nama, $alamat) { 
    $sql = "INSERT INTO ency_tandur(ency_nama, ency_alamat, ency_info) VALUES('$nama', '$alamat', '$info')";

    if(mysqli_query($conn,$sql)) {
        return true;
    }

    mysqli_close($conn);
    return false;
} 

function getEncy($conn) {
    $sql = "SELECT * FROM ency_tandur";
    $result = mysqli_query($conn, $sql); 
    $ency = array();

    while($row = mysqli_fetch_array($result)) {
        $ency_temp = array();
        $ency_temp['ency_id']= $row['ency_id'];
        $ency_temp['ency_nama'] = $row['ency_nama'];  
        $ency_temp['ency_latin'] = $row['ency_latin'];
        $ency_temp['ency_image'] = $row['ency_image'];
        $ency_temp['ency_info'] = $row['ency_info'];
        array_push($ency, $ency_temp);
    }

    mysqli_close($conn);
    return $ency;
} 
 
function updateEncy($conn, $id, $nama, $alamat) {
    $sql = "UPDATE ency_tandur SET ency_nama='$nama', ency_alamat='$alamat', ency_info='$info', WHERE ency_id = $id";

    if(mysqli_query($conn,$sql)) {
        return true;
    }

    mysqli_close($conn);
    return false; 
} 

?>