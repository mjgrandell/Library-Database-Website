<html>
<div style="background-image: url('https://dwgyu36up6iuz.cloudfront.net/heru80fdn/image/upload/c_fill,d_placeholder_thenewyorker.png,fl_progressive,g_face,h_450,q_80,w_800/v1590006383/thenewyorker_the-oddest-terms-used-for-antique-books-explained.jpg');">
<a style="color:white" href = "finalproject.php"><h2> Back to Home Page</h2></a>


<?php
//login info
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "library";

//background colour
echo '<body style="background-color:black">';

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>

<head>
<title> Check Overdue </title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<style>
table, th, td {
  border: 1px solid white;
  background-color: black;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
h1 {text-align:center;}
h1 {font-family: 'Montserrat', sans-serif;}
h1 {font-size: 2.5vw;}
h2 {text-align:left;}
h2 {font-family: 'Montserrat', sans-serif;}
h2 {font-size: 2vw;}
div {text-align: center;}
div {font-family: 'Montserrat', sans-serif;}
div {font-size: 2.5vw;}
</style>
</head>
<body>

<h1 style="color:white"> Check Overdue Books</h1>

<table style="color:white" class="center">
  <tr>
    <th style="color:white"> Patron Last Name</th>
    <th style="color:white"> Title</th>
	<th style="color:white"> Return Date</th>
  </tr>

<?php
//select desired table info 
$sql = "SELECT patrons.p_lname, titles.title, borrows.returndate
FROM patrons, titles, borrows
WHERE patrons.libcard_id = borrows.libcard_id
AND titles.title_id = borrows.title_id
AND borrows.returndate < '2020-12-02'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row

  while($row = $result->fetch_assoc()) {
    echo "<tr>";
	echo "<td>" . $row['p_lname'] . "</td>";
	echo "<td>" . $row['title'] . "</td>";
	echo "<td>" . $row['returndate'] . "</td>";
	echo "</tr>";
  }
} else {
  echo "0 results";
}

echo "<br>";

$conn->close(); 
?>

</table>
</body>
</html>
<?php
for($x = 0;$x < 25; $x++) {
	echo "<br>";
}
?>