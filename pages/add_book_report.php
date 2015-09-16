<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);

$sql = "INSERT INTO book (book_acc, book_cutt, book_bno, book_title, book_edition, book_author, book_subject_id, book_date_of_publication, book_publisher, book_language, book_cd_floppy, book_price, book_add_date, book_source) 
VALUES ('$_POST[bacc]',
'$_POST[bcut]',
'$_POST[bb]','$_POST[btitle]',
'$_POST[bedition]','$_POST[bauthor]',
'$_POST[bsubid]','$_POST[bdop]','$_POST[bpub]',
'$_POST[blang]','$_POST[bcdfloppy]','$_POST[bprice]','$_POST[bdate]','$_POST[bsource]')";
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