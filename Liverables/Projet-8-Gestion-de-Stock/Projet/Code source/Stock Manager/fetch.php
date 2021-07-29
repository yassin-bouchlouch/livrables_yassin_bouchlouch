<?php
include('db.php');
include('function.php');
$query = '';
$output = array();
$query .= "SELECT * FROM users ";
if(isset($_POST["search"]["value"]))
{
	$query .= 'WHERE name LIKE "%'.$_POST["search"]["value"].'%" ';
	$query .= 'OR color LIKE "%'.$_POST["search"]["value"].'%" ';
}
if(isset($_POST["order"]))
{
	$query .= 'ORDER BY '.$_POST['order']['0']['column'].' '.$_POST['order']['0']['dir'].' ';
}
else
{
	$query .= 'ORDER BY id DESC ';
}
if($_POST["length"] != -1)
{
	$query .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
}
$statement = $connection->prepare($query);
$statement->execute();
$result = $statement->fetchAll();
$data = array();
$filtered_rows = $statement->rowCount();
foreach($result as $row)
{
	$image = '';
	if($row["image"] != '')
	{
		$image = '<img src="upload/'.$row["image"].'" class="img-thumbnail" width="50" height="35" />';
	}
	else
	{
		$image = '';
	}
	$sub_array = array();
	$sub_array[] = $image;
	$sub_array[] = $row["name"];
	$sub_array[] = $row["color"];
	$sub_array[] = $row["size"];
	$sub_array[] = $row["Qty"];
	$sub_array[] = '<a style="color:blue type="a" name="update" id="'.$row["id"].'" class=" update"><i class="fas fa-edit"></i></a>';
	$sub_array[] = '<a style="color:Red type="a" name="delete" id="'.$row["id"].'" class=" delete"><i class="fas fa-trash-alt"></i></a>';
	$data[] = $sub_array;
}
$output = array(
	"draw"				=>	intval($_POST["draw"]),
	"recordsTotal"		=> 	$filtered_rows,
	"recordsFiltered"	=>	get_total_all_records(),
	"data"				=>	$data
);
echo json_encode($output);
?>