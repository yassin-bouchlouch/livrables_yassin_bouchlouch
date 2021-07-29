<?php
include('db.php');
$id = $_POST["id"];
$sql = "DELETE FROM tasks WHERE id = $id";
$getClasse = $dbh->prepare($sql) ;
$getClasse->execute();
?>