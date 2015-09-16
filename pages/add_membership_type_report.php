<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO membership_type (membership_type_id, membership_type_name, membership_type_description, membership_type_book_limit, membership_type_day_to_return, membership_type_fine_per_day)
VALUES
('$_POST[mtid]','$_POST[mtname]','$_POST[mtbooklimit]','$_POST[mtdaytoreturn]','$_POST[mtfineperday]')";

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