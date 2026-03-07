<?php
include "$_SERVER[DOCUMENT_ROOT]/gestion_absences/db_connection.php";

$conn = OpenConnection();

// جلب الطلبة من students + users
$etudiants_q = $conn->query("SELECT s.id, u.nom, u.prenom, s.niveau, s.specialite, s.groupe 
                              FROM students s 
                              JOIN users u ON s.user_id = u.id");

// جلب المواد
$modules_q = $conn->query("SELECT id, nom_module FROM modules");

// جلب الأفواج والمستويات
$groupes_q  = $conn->query("SELECT DISTINCT groupe FROM students ORDER BY groupe");
$niveaux_q  = $conn->query("SELECT DISTINCT niveau FROM students ORDER BY niveau");

$allEtudiants = [];
while($row = $etudiants_q->fetch_assoc()) {
    $allEtudiants[] = $row;
}

if($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["presence"])) {
    $date     = $_POST["date"];
    $module_id = $_POST["module_id"];

    foreach($_POST["presence"] as $student_id => $statut) {
        $check = $conn->query("SELECT id FROM absences 
                               WHERE student_id='$student_id' 
                               AND module_id='$module_id'
                               AND date_absence='$date'");
        if($check->num_rows == 0) {
            $sql = "INSERT INTO absences (student_id, module_id, date_absence, statut)
                    VALUES ('$student_id', '$module_id', '$date', '$statut')";
            if(!$conn->query($sql)) echo "Erreur: " . $conn->error . "<br>";
        } else {
            $update = "UPDATE absences SET statut='$statut'
                       WHERE student_id='$student_id' 
                       AND module_id='$module_id'
                       AND date_absence='$date'";
            if(!$conn->query($update)) echo "Erreur Update: " . $conn->error . "<br>";
        }
    }
    echo "<script>alert('Absences enregistrées avec succès');</script>";
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Enregistrer les Absences</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar">
<div>Professeur - Gestion des Absences</div>
<ul>
<li><a href="prof-dashboard.html">Mes Classes</a></li>
<li><a href="mark-absences.php">Enregistrer Absences</a></li>
</ul>
</nav>
<div class="page-container">
<h2 class="page-title">Enregistrer les Absences</h2>
<div class="card center-card">
<form method="POST">

<div class="form-group">
    <label>Date</label>
    <input type="date" name="date" required>
</div>

<div class="form-group">
    <label>Module</label>
    <select name="module_id" required>
        <?php while($mod = $modules_q->fetch_assoc()): ?>
            <option value="<?= $mod['id'] ?>"><?= htmlspecialchars($mod['nom_module']) ?></option>
        <?php endwhile; ?>
    </select>
</div>

<!-- فلتر Niveau + Groupe -->
<div class="form-group" style="display:flex; gap:20px; flex-wrap:wrap;">
    <div style="flex:1;">
        <label>Niveau</label>
        <select id="filterNiveau" onchange="filterEtudiants()">
            <option value="">-- Tous --</option>
            <?php while($n = $niveaux_q->fetch_assoc()): ?>
                <option value="<?= htmlspecialchars($n['niveau']) ?>"><?= htmlspecialchars($n['niveau']) ?></option>
            <?php endwhile; ?>
        </select>
    </div>
    <div style="flex:1;">
        <label>Groupe</label>
        <select id="filterGroupe" onchange="filterEtudiants()">
            <option value="">-- Tous --</option>
            <?php while($g = $groupes_q->fetch_assoc()): ?>
                <option value="<?= htmlspecialchars($g['groupe']) ?>"><?= htmlspecialchars($g['groupe']) ?></option>
            <?php endwhile; ?>
        </select>
    </div>
</div>

<table class="table" id="tableEtudiants">
<thead>
<tr>
    <th>Nom & Prénom</th>
    <th>Niveau</th>
    <th>Spécialité</th>
    <th>Groupe</th>
    <th>Présent</th>
    <th>Absent</th>
</tr>
</thead>
<tbody>
<?php foreach($allEtudiants as $row): ?>
<tr data-niveau="<?= htmlspecialchars($row['niveau']) ?>" 
    data-groupe="<?= htmlspecialchars($row['groupe']) ?>">
    <td><?= htmlspecialchars($row['nom'] . ' ' . $row['prenom']) ?></td>
    <td><?= htmlspecialchars($row['niveau']) ?></td>
    <td><?= htmlspecialchars($row['specialite']) ?></td>
    <td><?= htmlspecialchars($row['groupe']) ?></td>
    <td><input type="radio" name="presence[<?= $row['id'] ?>]" value="present" checked></td>
    <td><input type="radio" name="presence[<?= $row['id'] ?>]" value="absent"></td>
</tr>
<?php endforeach; ?>
</tbody>
</table>

<button type="submit" class="btn primary" style="margin-top:20px;">Enregistrer</button>
</form>
</div>
</div>

<script>
function filterEtudiants() {
    const niveau = document.getElementById('filterNiveau').value.toLowerCase();
    const groupe = document.getElementById('filterGroupe').value.toLowerCase();
    document.querySelectorAll('#tableEtudiants tbody tr').forEach(row => {
        const matchNiveau = niveau === '' || row.dataset.niveau.toLowerCase() === niveau;
        const matchGroupe = groupe === '' || row.dataset.groupe.toLowerCase() === groupe;
        row.style.display = (matchNiveau && matchGroupe) ? '' : 'none';
    });
}
</script>
</body>
</html>