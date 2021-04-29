<?php 
	

	include 'conn.php';

	$sql = "SELECT * FROM students";
	$stmt = $conn->prepare($sql);
	$stmt->execute();

	$rows = $stmt->fetchAll();

	echo json_encode($rows);


?>