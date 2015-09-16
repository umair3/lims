<?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("lims", $con);
$result = mysql_query("SELECT * FROM book");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="../stylesheets/page.css" />
<style type="text/css">
<!--
.style3 {
	font-size: 14px;
	font-weight: bold;
}
.style5 {font-size: 16px; font-weight: bold; }
.style7 {font-size: 12px}
-->
</style>
</head>

<body>
<table width="100%" border="1" align="center" bordercolor="#000000">
  <caption>
    <span class="style5">Book Details    </span>
  </caption>
  <tr>
    <td><div align="center" class="style3"> Acc#</div></td>
    <td><div align="center" class="style3">Cutt# </div></td>
    <td><div align="center" class="style3">B#</div></td>
    <td><div align="center" class="style3">Title</div></td>
    <td><div align="center" class="style3">Edition</div></td>
    <td><div align="center" class="style3">Author</div></td>
    <td><div align="center" class="style3">Subject ID </div></td>
    <td><div align="center" class="style3">Date of Publication </div></td>
    <td><div align="center" class="style3">Publisher</div></td>
    <td><div align="center" class="style3">Language</div></td>
    <td><div align="center" class="style3">CD/Floppy</div></td>
    <td><div align="center" class="style3">Price</div></td>
    <td><div align="center" class="style3">Date Added </div></td>
    <td><div align="center" class="style3">Book Source </div></td>
  </tr>
  <?php
while($row = mysql_fetch_array($result))
  {
  ?>
  <tr>
    <td><span class="style7"><?php echo $row['book_acc'];?></span></td>
    <td><span class="style7"><?php echo $row['book_cutt'];?></span></td>
    <td><span class="style7"><?php echo $row['book_bno'];?></span></td>
    <td><span class="style7"><?php echo $row['book_title'];?></span></td>
    <td><span class="style7"><?php echo $row['book_edition'];?></span></td>
    <td><span class="style7"><?php echo $row['book_author'];?></span></td>
    <td><span class="style7"><?php echo $row['book_subject_id'];?></span></td>
    <td><span class="style7"><?php echo $row['book_date_of_publication'];?></span></td>
    <td><span class="style7"><?php echo $row['book_publisher'];?></span></td>
    <td><span class="style7"><?php echo $row['book_language'];?></span></td>
    <td><span class="style7"><?php echo $row['book_cd_floppy'];?></span></td>
    <td><span class="style7"><?php echo $row['book_price'];?></span></td>
    <td><span class="style7"><?php echo $row['book_add_date'];?></span></td>
	<td><span class="style7"><?php echo $row['book_source'];?></span></td>
  </tr>
 <?php
 }
 ?>
</table>
</body>
</html>