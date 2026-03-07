<?php
include "config.php";

if($_SESSION['role']!="admin"){
header("Location: login.php");
}
?>
<link rel="stylesheet" href="style.css">
<h2>Admin Dashboard</h2>

<a href="manage_users.php">Gestion utilisateurs</a>
<br>
<a href="justifications.php">Justifications</a>
<br>
<a href="logout.php">Logout</a>