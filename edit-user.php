<?php
session_start();
if(!isset($_SESSION["role"]) || $_SESSION["role"] != "admin") {
    header("Location: login.php");
    exit();
}

include "$_SERVER[DOCUMENT_ROOT]/gestion_absences/db_connection.php";
$conn = OpenConnection();

$id = $_GET["id"];
$user = $conn->query("SELECT * FROM users WHERE id='$id'")->fetch_assoc();

if($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom    = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $email  = $_POST["email"];
    $conn->query("UPDATE users SET nom='$nom', prenom='$prenom', email='$email' WHERE id='$id'");
    echo "<script>alert('تم التعديل!'); window.location.href='manage-users.php';</script>";
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Modifier</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar">
<div>Admin - Gestion des Absences</div>
<ul>
<li><a href="manage-users.php">Utilisateurs</a></li>
</ul>
</nav>
<div class="page-container">
<h2 class="page-title">Modifier Utilisateur</h2>
<div class="card center-card">
<form method="POST">
<div class="form-group">
    <label>Nom</label>
    <input type="text" name="nom" value="<?= htmlspecialchars($user['nom']) ?>" required>
</div>
<div class="form-group">
    <label>Prénom</label>
    <input type="text" name="prenom" value="<?= htmlspecialchars($user['prenom']) ?>" required>
</div>
<div class="form-group">
    <label>Email</label>
    <input type="email" name="email" value="<?= htmlspecialchars($user['email']) ?>" required>
</div>
<button type="submit" style="width:100%; padding:12px; font-size:16px; background-color:#FF8C00; color:white; border:none; border-radius:8px; cursor:pointer;">
    Modifier
</button>
</form>
</div>
</div>
</body>
</html>