<?php
    session_start();

    include_once("./connection.php");

    $retObj = (object) [
        'status' => -1
    ];

    $query = $pdo->prepare("SELECT * FROM events 
                            JOIN locations
                            ON events.locationId = locations.iD");
    $query->execute();
    $events = $query->fetchAll(PDO::FETCH_OBJ);

    if($events) {
        $retObj->events = $events;
        $retObj->status = 0;
    } else {
        $retObj->status = 1;
    }

    echo json_encode($retObj);

?>