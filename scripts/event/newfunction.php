<?php

    include_once("../connection.php");

    session_start();

    $retObj = (object) [
        'status' => -1
    ];

    //, $_SESSION['user_id']

    if ( isset( $_POST['name'] ) && isset( $_POST['addresstext'] ) && isset( $_POST['lat'] ) && isset( $_POST['lon'] ) && isset( $_SESSION['user_id'] ) ) {
        $query = $pdo->prepare("INSERT INTO eventInstances (date, time, tickets, ticketsRemaining) VALUES (?, ?, ?, ?, ?)");
        $query->execute([$_POST['name'], $_POST['addresstext'], $_POST['lat'], $_POST['lon']]);

        $id = $pdo->lastInsertId();

        $retObj->insertedId = $id;
        $retObj->status = 0;
    }

    echo json_encode($retObj);