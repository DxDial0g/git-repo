<?php
	include('connect.php');
	mysql_select_db($db, $link)or die("problemas con la conexion a la db");
	$email = $_POST['email'];
	$pass = $_POST['pass'];
	print($email);
	print($pass);
	$query1 = mysql_query("select * from users where email = '{$_POST['email']}';", $link) or die(mysql_error());
	
	if($reg = mysql_fetch_array($query1)){
		$query2 = mysql_query("select * from users where email = '$email' and password = '$pass';", $link) or die(mysql_error());
		if($reg = mysql_fetch_array($query2)){
			print(true);
		}else{
			print('usuario o contraseña erroneos');
		}
	}else{
		print(false);
	}
?>