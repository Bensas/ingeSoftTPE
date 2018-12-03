<?php
    session_start();

    include_once("./connection.php");

    $retObj = (object) [
        'status' => -1
    ];

    $query = $pdo->prepare("SELECT * FROM events");
    $query->execute();
    $events = $query->fetchAll(PDO::FETCH_OBJ);

    foreach ($eventData as $key => $value){
        $eventData->$key = utf8_encode($value);
    }

    // echo implode(',', $events[0]);
    if($events) {
        // $output = array_map( 
        //     function( $key, $val ){
        //         return array(
        //             "Location_name" => $key,
        //             "Link_name" => $val
        //         );
        //     }, array_keys( $arr ), $arr );
        $retObj->events = $events;
        $retObj->status = 0;
    } else {
        $retObj->status = 1;
    }

    foreach ($array as $key => $value) {
        echo "Key: $key; Value: $value\n";
    }

?>