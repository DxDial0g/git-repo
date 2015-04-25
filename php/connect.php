<?php
	$root = "localhost:9000";
	$user = "root";
	$pw = "admin";
	$db = "mydb";
	
	$link = mysql_connect($root, $user, $pw) or die("problemas en la conexion a MySQL");
?>