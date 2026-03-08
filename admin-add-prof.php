
<?php
session_start();
if(!isset($_SESSION["role"]) || $_SESSION["role"] != "admin") {
    header("Location: login.php");
    exit();
}
?>
<?php
include "$_SERVER[DOCUMENT_ROOT]/gestion_absences/db_connection.php";
$conn = OpenConnection();
$success = "";
$error = "";

if($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom      = $_POST["nom"];
    $prenom   = $_POST["prenom"];
    $email    = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $check = $conn->query("SELECT id FROM users WHERE email='$email'");
    if($check->num_rows > 0) {
        $error = "هذا الإيميل موجود مسبقاً!";
    } else {
        $sql1 = "INSERT INTO users (nom, prenom, email, password, role)
                 VALUES ('$nom', '$prenom', '$email', '$password', 'professeur')";
        if($conn->query($sql1)) {
            $user_id = $conn->insert_id;
            $sql2 = "INSERT INTO professors (user_id) VALUES ('$user_id')";
            if($conn->query($sql2)) {
                $success ="تم إضافة الأستاذ بنجاح!";
    echo "<script>alert('تم إضافة الأستاذ بنجاح!!'); window.location.href='admin-add-prof.php';</script>";
    exit();
            } else {
                $error = "خطأ: " . $conn->error;
            }
        } else {
            $error = "خطأ: " . $conn->error;
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Ajouter Professeur</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar">
<div>Admin - Gestion des Absences</div>
<ul>
<li><a href="admin-add-student.php">Ajouter Étudiant</a></li>
<li><a href="admin-add-prof.php">Ajouter Professeur</a></li>
</ul>
</nav>
<div class="page-container">
<h2 class="page-title">Ajouter un Professeur</h2>
<div class="card center-card">

<?php if($success): ?>
    <p style="color:green; font-weight:bold;"><?= $success ?></p>
<?php endif; ?>
<?php if($error): ?>
    <p style="color:red; font-weight:bold;"><?= $error ?></p>
<?php endif; ?>

<form method="POST">
<div class="form-group">
    <label>Nom</label>
    <input type="text" name="nom" required>
</div>
<div class="form-group">
    <label>Prénom</label>
    <input type="text" name="prenom" required>
</div>
<div class="form-group">
    <label>Email</label>
    <input type="email" name="email" required>
</div>
<div class="form-group">
    <label>Mot de passe</label>
    <input type="password" name="password" required>
</div>
<button type="submit" class="btn primary" style="width:100%; padding:12px; font-size:16px; background-color:#FF8C00; color:white; border:none; border-radius:8px; cursor:pointer;">
    Ajouter
</button>
</div>
</div>
</body>
</html>