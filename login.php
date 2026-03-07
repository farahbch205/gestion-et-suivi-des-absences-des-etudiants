```php
<?php
include "config.php";

$error="";

if(isset($_POST['login'])){

$email=$_POST['email'];
$password=$_POST['password'];
$role=$_POST['role'];

$sql="SELECT * FROM users WHERE email='$email'";
$result=mysqli_query($conn,$sql);

if(mysqli_num_rows($result)==1){

$user=mysqli_fetch_assoc($result);

if($password==$user['password']){

if($role==$user['role']){

$_SESSION['id']=$user['id'];
$_SESSION['role']=$user['role'];
$_SESSION['name']=$user['name'];

if($role=="admin"){
header("Location: admin_dashboard.php");
}

elseif($role=="prof"){
header("Location: prof_dashboard.php");
}

else{
header("Location: student_dashboard.php");
}

exit();

}
else{
$error="Type utilisateur incorrect";
}

}
else{
$error="Mot de passe incorrect";
}

}
else{
$error="Utilisateur non trouvé";
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
            <?php if($error!=""){ echo $error; } ?>
            <p class="subtitle">Accédez à la plateforme de gestion des absences</p>

            <form method="POST">

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Mot de passe" required>

<select name="role" required>

<option value="">Choisir</option>
<option value="admin">Admin</option>
<option value="prof">Professeur</option>
<option value="student">Etudiant</option>

</select>
</div>
            </form>

        </div>

    </div>

</body>
</html>
