
<?php
// استدعاء ملف الاتصال
include $_SERVER['DOCUMENT_ROOT'] . "/gestion_absences/db_connection.php";

// فتح الاتصال
$conn = OpenConnection();


// حذف مستخدم
if(isset($_GET["delete_id"])) {
    $id = $_GET["delete_id"];
    $check = $conn->query("SELECT role FROM users WHERE id='$id'");
    $user = $check->fetch_assoc();
    if($user["role"] == "admin") {
        echo "<script>alert('لا يمكن حذف الأدمين!');</script>";
    } else {
        $conn->query("DELETE FROM users WHERE id='$id'");
        echo "<script>alert('تم حذف المستخدم!'); window.location.href='manage-users.php';</script>";
        exit();
    }
}


// جلب جميع المستخدمين من قاعدة البيانات
$sql = "SELECT * FROM users";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Gestion des Utilisateurs</title>
<link rel="stylesheet" href="style.css">
</head>

<body>

<nav class="navbar">
<div>Admin - Gestion des Absences</div>
<ul>
<li><a href="manage-users.php">Utilisateurs</a></li>
<li><a href="justifications.php">Justifications</a></li>
</ul>
</nav>

<div class="page-container">

<h2 class="page-title">Gestion des Utilisateurs</h2>

<div class="card center-card">

<table class="table">
<tr>
<th>Nom</th>
<th>Email</th>
<th>Rôle</th>
<th>Action</th>
</tr>

<?php
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['nom']) . "</td>";
        echo "<td>" . htmlspecialchars($row['email']) . "</td>";
        echo "<td>" . htmlspecialchars($row['role']) . "</td>";
        echo "<td>
        
        <a href='edit-user.php?id=".$row['id']."' style='padding:8px 15px; background-color:#28a745; color:white; border-radius:6px; text-decoration:none; margin-right:5px;'>Modifier</a>
        <a href='manage-users.php?delete_id=".$row['id']."' style='padding:8px 15px; background-color:#dc3545; color:white; border-radius:6px; text-decoration:none;'>Supprimer</a>
      
        </td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>Aucun utilisateur trouvé</td></tr>";
}
?>

</table>

<div style="margin-top:20px; display:flex; gap:10px;">
    <a href="admin-add-student.php" style="padding:10px 20px; background-color:#FF8C00; color:white; border-radius:8px; text-decoration:none; font-size:15px;">Ajouter un Étudiant</a>
    <a href="admin-add-prof.php" style="padding:10px 20px; background-color:#FF8C00; color:white; border-radius:8px; text-decoration:none; font-size:15px;">Ajouter un Professeur</a>
</div>
</div>
</div>

</body>
</html>

<?php
// غلق الاتصال بعد الانتهاء
CloseConnection($conn);
?>