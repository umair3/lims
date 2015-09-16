<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO fine (fine_book_acc, fine_member_id, fine_due_date, fine_return_date, fine)
VALUES
('$_POST[facc]','$_POST[fmid]','$_POST[duedate]','$_POST[returndate]','$_POST[fine]')";

if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }
echo "1 record added";

mysql_close($con)
?> 