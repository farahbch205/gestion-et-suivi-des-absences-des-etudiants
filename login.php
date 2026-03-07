<?php
include "$_SERVER[DOCUMENT_ROOT]/gestion_absences/db_connection.php";
$conn = OpenConnection();

$message = "";

if(isset($_POST["email"]) && isset($_POST["password"])) {

    $email    = $_POST["email"];
    $password = $_POST["password"];

    $sql    = "SELECT * FROM users WHERE email='$email'";
    $result = $conn->query($sql);

    if($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // تحقق من الباسورد (عادي أو مشفر)
        $passOk = ($password === $user["password"]) || password_verify($password, $user["password"]);

        if($passOk) {
            session_start();
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["nom"]     = $user["nom"];
            $_SESSION["prenom"]  = $user["prenom"];
            $_SESSION["role"]    = $user["role"];

            // توجيه حسب الـ role
            if($user["role"] == "admin") {
                header("Location: admin-add-student.php");
            } elseif($user["role"] == "professeur") {
                header("Location: prof-dashboard.html");
            } else {
                header("Location: student-absences.html");
            }
            exit();
        } else {
            $message = "Mot de passe incorrect";
        }
    } else {
        $message = "Email introuvable";
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Connexion</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="login-body">
<nav class="navbar">
  <div class="navbar-brand">
    <img src="images/university1.jpg" alt="logo">
    <div class="navbar-brand-text">
      <span class="univ-ar">جامعة 20 أوت 1955 – سكيكدة</span>
      <span class="univ-fr">Université 20 Août 1955 – Skikda</span>
    </div>
  </div>
</nav>
<div class="login-container">
    <div class="login-card">
        <h2>Connexion</h2>
        <?php if($message != "") echo "<p class='error'>$message</p>"; ?>
        <p class="subtitle">Accédez à la plateforme de gestion des absences</p>
        <form method="POST">
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="exemple@univ.dz" required>
            </div>
            <div class="form-group">
                <label>Mot de passe</label>
                <input type="password" name="password" placeholder="••••••••" required>
            </div>
            <button type="submit" class="btn-login">Se connecter</button>
        </form>
    </div>
</div>
</body>
</html>