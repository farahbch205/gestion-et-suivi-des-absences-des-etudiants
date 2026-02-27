<?php
//$conn = new mysqli("localhost", "root", "", "gestion_absences");

//if ($conn->connect_error) {
  //  die("Erreur connexion: " . $conn->connect_error);
//}
include "$_SERVER[DOCUMENT_ROOT]/gestion_absences/db_connection.php";
$conn = OpenConnection();
if(isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["role"])) {

    $email = $_POST["email"];
    $password = $_POST["password"];
    $role = $_POST["role"];

    if ($role == "Administrateur") {
        $table = "administrateurs";
        $redirect = "dashboard.html";
    } elseif ($role == "Professeur") {
        $table = "enseignants";
        $redirect = "prof-dashboard.html";
    } else {
        $table = "etudiants";
        $redirect = "student-absences.html";
    }

    $sql = "SELECT * FROM $table WHERE email='$email' AND motDePasse='$password'";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        header("Location: $redirect");
        exit();
    } else {
        echo "<script>alert('Email ou mot de passe incorrect');</script>";
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion | Gestion des Absences</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="login-body">

    <div class="login-container">

        <div class="login-card">

            <h2>Connexion</h2>
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

                <div class="form-group">
                    <label>Type d'utilisateur</label>
                    <select name="role">
                        <option>Administrateur</option>
                        <option>Étudiant</option>
                        <option>Professeur</option>
                    </select>
                </div>

                <button type="submit" class="btn primary">
                    Se connecter
                </button>

            </form>

        </div>

    </div>

</body>
</html>

