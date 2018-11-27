<?php
    include_once("connection.php");

    if ( isset( $_POST['name'] ) && isset( $_POST['surname'] ) && isset( $_POST['mail'] ) && isset( $_POST['password'] ) ) {
        $query = $pdo->prepare("INSERT INTO users (name, surname, mail, password) VALUES (?, ?, ?, ?)");
        $query->execute([$_POST['name'], $_POST['surname'], $_POST['mail'], password_hash($_POST['password'], PASSWORD_DEFAULT)]);

        //mail de confirmación y otras boludeces

        session_start();

        $_SESSION['user_id'] = $pdo->lastInsertId();

        $retObj = (object) [
            'status' => 0
        ];

    } else {
        $retObj = (object) [
            'status' => -1
        ];
    }

    echo json_encode($retObj);