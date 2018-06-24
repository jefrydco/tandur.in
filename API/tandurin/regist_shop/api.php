<?php
    include 'model_register_store.php';
    include '../config/config.php';

    header('Content-Type: application/json');

    function isTheseParametersAvailable($params) { 
        $available = true;
        $missingparams = "";

        foreach($params as $param) {
            if(!isset($_POST[$param]) || strlen($_POST[$param])<=0) {
                $available = false;
                $missingparams = $missingparams . ", " . $param;  
            }
        }

        if(!$available) {
            $response = array();
            $response['error'] = true;
            $response['message'] = 'Parameters ' . substr($missingparams, 1, strlen($missingparams)) . ' missing';          
 
            echo json_encode($response); 
            die();
        }
    } 
    
    $response = array(); 
    
    if(isset($_GET['apicall'])) {
        switch($_GET['apicall']) {
            case 'create_store':
            isTheseParametersAvailable(array('shop_nama', 'shop_alamat', 'shop_info'));
            $result = createStore($conn, $_POST['shop_nama'], $_POST['shop_alamat'], $_POST['shop_info']);

            if($result) {
                $response['error'] = false;
                $response['message'] = 'Store berhasil ditambahkan';
                $response['store'] = getStore($conn);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error';
            }
            break;

            case 'update_store':
            isTheseParametersAvailable(array('shop_id', 'shop_nama', 'shop_alamat', 'shop_info'));
            $result = updateStore($conn, $_POST['shop_id'], $_POST['shop_nama'], $_POST['shop_alamat'], $_POST['shop_info']);

            if($result) {
                $response['error'] = false;
                $response['message'] = 'Store berhasil ditambahkan';
                $response['store'] = getStore($conn);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error';
            }
            break;

            case 'get_store':
            $response['error'] = false;
            $response['message'] = 'Request successfully completed';
            $response['store'] = getStore($conn);
            break;
            
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Invalid API Call';
    }

    echo json_encode($response); 
?>