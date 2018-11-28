<?php
    session_start();

    include_once("connection.php");

    $retObj = (object) [
        'status' => -1
    ];

    if ( !empty( $_GET['mail'] ) && !empty( $_GET['key'] ) ) {
        try{
            $query = $pdo->prepare("SELECT * FROM users WHERE mail = ? AND confirmationKey = ?");
            $query->execute([$_GET['mail'], $_GET['key']]);
            $row = $query->fetch(PDO::FETCH_ASSOC);

            if ($row['confirmationKey'] == 0){
                $retObj->status = 1;
            } 
            else if(!empty($row['confirmationKey'])) {
                $query = $pdo->prepare("UPDATE users SET confirmationKey = 0
                    WHERE mail = ? ");
                $query->execute([$_GET['mail']]);
                $retObj->status = 0;
            }
        } catch (PDOException $e){
            echo "Problem accessing the Database!";
            return;
        }  
        
    } else{
        echo "No URL parameters received!";
    }

    echo json_encode($retObj);

?>