<?php
include 'config.php';

function createStore($conn, $nama, $alamat, $bunga) { 
    $sql = "INSERT INTO shop_tandur(shop_nama, shop_alamat, shop_info) VALUES('$nama', '$alamat', '$bunga')";

    if(mysqli_query($conn,$sql)) {
        return true;
    }

    mysqli_close($conn);
    return false;
} 

function getStore($conn) {
    $sql = "SELECT * FROM shop_tandur";
    $result = mysqli_query($conn, $sql); 
    $store = array();

    while($row = mysqli_fetch_array($result)) {
        $store_temp = array();
        $store_temp['shop_id']= $row['shop_id'];
        $store_temp['shop_nama'] = $row['shop_nama'];  
        $store_temp['shop_alamat'] = $row['shop_alamat'];
        $store_temp['shop_info'] = $row['shop_info'];
        array_push($store, $store_temp);
    }

    mysqli_close($conn);
    return $store;
} 
 
function updateStore($conn, $id, $nama, $alamat, $bunga) {
    $sql = "UPDATE shop_tandur SET shop_nama='$nama', shop_alamat='$alamat', shop_info='$bunga' WHERE shop_id = $id";

    if(mysqli_query($conn,$sql)) {
        return true;
    }

    mysqli_close($conn);
    return false; 
} 

function deleteStore($conn, $id) {
    $sql = "DELETE FROM shop_tandur WHERE shop_id = $id";

    if(mysqli_query($conn,$sql)) {
        return true;
    }

    mysqli_close($conn);
    return false;
}
?>