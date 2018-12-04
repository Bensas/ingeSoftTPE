<?php

//TODO: COMPROBACIONES DE SEGURIDAD, ARCHIVOS PERMITIDOS, TAMAÑOS, Y PRIVILEGIOS, TANTO EN PHP COMO EN JAVASCRIPT

$eventId = $_POST["eventId"];
$deleteList = $_POST["deleteList"];

$target_path = "../../img/events/" . $eventId . "/";
$glob = glob($target_path ."*");

$files_total = count($_FILES['file']['name']);
$files_uploaded = 0;
$files_error = 0;

$deleted_total = count($deleteList);
$deleted_success = 0;
$deleted_error = 0;

$retObj = (object) [
    'status' => -1
];

for($i=0; $i < $files_total; $i++) {
    $filenamekey = md5(uniqid($_FILES["file"]["name"][$i], true));
    $finalFileName = $filenamekey . "." . pathinfo($_FILES["file"]["name"][$i], PATHINFO_EXTENSION);

    if(move_uploaded_file($_FILES['file']['tmp_name'][$i], $target_path . $finalFileName)) {
        $files_uploaded++;
    } else {
        $files_error++;
    }
}

for($j=0; $j < $deleted_total; $j++) {
    unlink($target_path . $deleteList[$j]); //TODO: Hacer chequeo, podría fallar y bla bla bla
    $deleted_success++;
}

if($files_error == 0)
    $retObj->status = 0;
else
    $retObj->status = 1;

    $retObj->upload = (object) [
        'received' => $files_total,
        'seccesses' => $files_uploaded,
        'failtures' => $files_error
    ];

    $retObj->deletion = (object) [
        'received' => $deleted_total,
        'seccesses' => $deleted_success,
        'failtures' => $deleted_error
    ];

echo json_encode($retObj);