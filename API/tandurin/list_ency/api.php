<?php
    include 'model_list_ency.php';
    include 'config_list_ency.php';

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
            case 'create_ency':
            isTheseParametersAvailable(array('ency_nama', 'ency_alamat', 'ency_info'));
            $result = createEncy($conn, $_POST['ency_nama'], $_POST['ency_alamat'], $_POST['ency_info']);

            if($result) {
                $response['error'] = false;
                $response['message'] = 'ency berhasil ditambahkan';
                $response['ency'] = getEncy($conn);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error';
            }
            break;

            case 'update_ency':
            isTheseParametersAvailable(array('ency_id', 'ency_nama', 'ency_alamat', 'ency_info'));
            $result = updateEncy($conn, $_POST['ency_id'], $_POST['ency_nama'], $_POST['ency_alamat'], $_POST['ency_info']);

            if($result) {
                $response['error'] = false;
                $response['message'] = 'ency berhasil ditambahkan';
                $response['ency'] = getEncy($conn);
            } else {
                $response['error'] = true;
                $response['message'] = 'Some error';
            }
            break;

            case 'get_ency':
            $response['error'] = false;
            $response['message'] = 'Request successfully completed';
            $response['ency'] = getEncy($conn);
            break;
            
        }
    } else {
        $response['error'] = true;
        $response['message'] = 'Invalid API Call';
    }

    echo json_encode($response); 
?>