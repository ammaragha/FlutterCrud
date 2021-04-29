<?php 

	include 'conn.php';

	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$name = $_POST['name'];
		$email = $_POST['email'];
		$phone = $_POST['phone'];

		
		$sql = "INSERT INTO students(name, phone, email) VALUES(?,?,?)";
		$stmt= $conn->prepare($sql);
		$stmt->execute(Array($name,$phone,$email));

	}else{
		echo 'no POST';
	}

	
	



?>