<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO book_history (book_history_acc, book_history_member_id, book_history_issue_date, book_history_return_date)
VALUES
('$_POST[acc]','$_POST[mid]','$_POST[issuedate]','$_POST[returndate]')";

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