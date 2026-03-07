<?php
include "config.php";

$result=mysqli_query($conn,"SELECT * FROM users");
?>
<head>
<meta charset="UTF-8">
<title>Gestion des Absences</title>
<link rel="stylesheet" href="style.css">
</head>
<h2>Gestion Utilisateurs</h2>

<table border="1">

<tr>
<th>Nom</th>
<th>Email</th>
<th>Role</th>
</tr>

<?php while($row=mysqli_fetch_assoc($result)){ ?>

<tr>

<td><?php echo $row['name']; ?></td>

<td><?php echo $row['email']; ?></td>

<td><?php echo $row['role']; ?></td>

</tr>

<?php } ?>

</table>