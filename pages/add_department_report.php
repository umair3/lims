<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO departments (department_id, department_name)
VALUES
('$_POST[did]','$_POST[dname]')";

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