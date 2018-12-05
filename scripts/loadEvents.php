<?php
    session_start();

    include_once("./connection.php");

    $retObj = (object) [
        'status' => -1
    ];
    $pdo = Connection::getConnection();
    $query = $pdo->prepare("SELECT e.Id, e.imgcover, e.title, l.name FROM events e
                            JOIN locations l
                            ON e.locationId = l.iD");
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