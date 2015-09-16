<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO members (member_id, member_name, member_dob, member_type_id, department_id, program_id, semester, member_address, member_city, member_phone, member_email)
VALUES
('$_POST[mid]','$_POST[mname]','$_POST[mdob]','$_POST[mtid]','$_POST[mdid]','$_POST[mprogram]','$_POST[msemester]','$_POST[maddress]','$_POST[mcity]','$_POST[mphone]','$_POST[email]')";

if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }
echo "1 record added";

mysql_close($con)
?> 

<html>
<head>
<link rel="stylesheet" type="text/css" href="../stylesheets/page.css" />
</head>
</html>