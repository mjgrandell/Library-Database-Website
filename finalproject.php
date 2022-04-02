<html>
<div style="background-image: url('https://media2.s-nbcnews.com/i/newscms/2020_15/3297941/200406-book-shelf-library-generic-ac-1101p_020e2306d7f38084a8fc201ace0bfa2e.jpg');">

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
<title> Home Page </title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<style>
div {text-align: center;}
div {font-family: 'Montserrat', sans-serif;}
div {font-size: 2.5vw;}
</style>
</head>
<body>
<div>
<h1 style="color:white"> Library Database </h1>
<h2 style="color:white"> Choose a Table to View: </h2>
<a style="color:white" href = "authors.php">Authors</a> <br>
<a style="color:white" href = "librarians.php">Librarians</a> <br>
<a style="color:white" href = "patrons.php">Patrons</a> <br>
<a style="color:white" href = "publishers.php">Publishers</a> <br>
<a style="color:white" href = "sections.php">Sections</a> <br>
<a style="color:white" href = "titles.php">Titles</a> <br>
<a style="color:white" href = "borrows.php">Borrowed By</a> <br>
<a style="color:white" href = "publishedby.php">Published By</a> <br>
<a style="color:white" href = "worksin.php">Works In</a> <br>
<a style="color:white" href = "writtenby.php">Written By</a> <br>
<a style="color:white" href = "checkoverdue.php">Check Overdue Books</a> <br>
<a style="color:white" href = "romance.php">Search For Romance Titles</a> <br>
</div>
</body>
</html>

<?php 
$conn->close(); 
?>