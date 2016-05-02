<?php session_start();
include "connect.php"; //connects to the database
if(isset($_POST['email'])){
    $email = $_POST['email'];
    $query="select * from signup where signup.email='$email'";
    $result   = mysql_query($query);
    $count=mysql_num_rows($result);
    // If the count is equal to one, we will send message other wise display an error message.
    if($count==1)
    {
        $rows=mysql_fetch_array($result);
        $pass  =  $rows['pass'];//FETCHING PASS
        echo "your pass is ::".($pass)."";
        $to = $rows['email'];
        echo "your email is ::".$email;
        //Details for sending E-mail
        $from = "FoodMania";
        $body  =  " password recovered
        
        email Details is : $to;
        Here is your password  : $pass;
        Sincerely,
        FoodMania";
        $from = "FoodMania.com";
        $subject = "FoodMania Password recovered";
        $headers1 = "From: $from\n";
        $headers1 .= "Content-type: text/html;charset=iso-8859-1\r\n";
        $headers1 .= "X-Priority: 1\r\n";
        $headers1 .= "X-MSMail-Priority: High\r\n";
        $headers1 .= "X-Mailer: Just My Server\r\n";
        $sentmail = mail ( $to, $subject, $body, $headers1 );
    } else {
    if ($_POST ['email'] != "") {
      echo "<span style='color: #ff0000;'> Not found your email in our database </span>";
        }
        }
    //If the message is sent successfully, display sucess message otherwise display an error message.
    if($sentmail)
    {
        echo "<span style='color: #ff0000;'> Your Password Has Been Sent To Your Email Address.</span>";
    }
        else
        {
        if($_POST['email']!="")
        echo "<span style='color: #ff0000;'> Cannot send password to your e-mail address.Problem with sending mail...</span>";
    }
}
?>
 
