
<?php
   	   $host="localhost"; // Host name
	$username="root"; // Mysql username
	$password=""; // Mysql password
	$db_name="food"; // Database name
	$tbl_name="signup"; // Table name

	mysql_connect("$host", "$username", "$password")or die("cannot connect");
	 mysql_select_db("$db_name")or die("cannot select DB");
	   

	 $login=$_POST["login"];
           $password=$_POST["password"];
		
		$q2 = "SELECT fname,lname FROM signup WHERE signup.email ='". $login. "' AND signup.pass ='". $password. "'";
	   $result=mysql_query($q2);   
	    
	   if($result)
	   {
		while($row = mysql_fetch_array($result))
		{
		if($row != NULL)
		{
		echo "<span style='color: #ff0000;'>  WELCOME  </span>"  . $row['fname'] . " " . $row['lname'] ;
			echo "<br>";
			echo "<a href='HomeLogin.html'>Goto HomePage</a>";
  			echo "<br>";
			break;
		}
  		}
	}

	   if($row == NULL) 
	   {
		echo "<span style='color: #ff0000;'> WRONG USERNAME/PASSWORD... </span>";
	   }    

?>
