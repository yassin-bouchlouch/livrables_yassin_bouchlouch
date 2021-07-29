<?php
include('db.php');
$id = $_POST["id"];
$sql = "UPDATE tasks SET done = :done WHERE id = $id";
$addClassesQuery = $dbh->prepare($sql);
$addClassesQuery->bindParam(":done",$_POST["done"],PDO::PARAM_STR);
$addClassesQuery->execute();
?>