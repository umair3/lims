<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql="INSERT INTO issue_book (issue_book_acc, issue_book_member_id, issue_book_issue_date, issue_book_due_date)
VALUES
('$_POST[acc]','$_POST[mid]','$_POST[issuedate]','$_POST[duedate]')";

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