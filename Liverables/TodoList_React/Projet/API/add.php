<?php
include('db.php');
$sql = " INSERT INTO tasks(taskName) VALUES (:taskName)";
$addTaskQuery = $dbh->prepare($sql);
$addTaskQuery->bindParam(":taskName",$_POST["taskName"],PDO::PARAM_STR);
// $addTaskQuery->bindParam(":taskdate",$_POST["taskdate"],PDO::PARAM_STR);
// $addTaskQuery->bindParam(":done",$_POST["done"],PDO::PARAM_STR);
$addTaskQuery->execute();
?>