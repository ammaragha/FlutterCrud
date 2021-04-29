<?php 


	$dns = "mysql:host=localhost;dbname=flutter";
	$user = "root";
	$pass = "";

	try{
		$conn = new PDO($dns,$user,$pass);
		$conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		
	}catch(PDOException $e){
		echo "Err".$e->getMessage();
	}


?>