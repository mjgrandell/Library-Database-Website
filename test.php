<table>
<?php
//login info
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pub";

echo '<body style="background-color:yellow">';
echo "<table border='1'><tr>";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//select desired table info 
$sql = "SELECT * FROM authors";
$result = $conn->query($sql);

echo "Author ID   Last Name   First Name   City   State   Phone Number<br>";

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo $row["au_id"]. " " .$row["au_lname"]. " " .$row["au_fname"]. " " .$row["city"]. " " .$row["state"]. " " .$row["phone"]."<br>";
  }
} else {
  echo "0 results";
}

echo "<br>";

$sql = "SELECT * FROM publishers";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "pub_id: " . $row["pub_id"]. " - pub_name: " . $row["pub_name"]. " - city: " . $row["city"]. " - state: " . $row["state"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>
</table>
