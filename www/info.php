<?php
$host = "192.168.56.11";   // IP de la máquina db
$dbname = "empresa";
$user = "juan";
$pass = "clave123";

echo "<h1>Listado de empleados</h1>";

try {
    $conn = new PDO("pgsql:host=$host;dbname=$dbname", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->query("SELECT * FROM empleados");
    echo "<table border='1' cellpadding='5'>";
    echo "<tr><th>ID</th><th>Nombre</th><th>Cargo</th><th>Salario</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr>";
        echo "<td>{$row['id']}</td>";
        echo "<td>{$row['nombre']}</td>";
        echo "<td>{$row['cargo']}</td>";
        echo "<td>{$row['salario']}</td>";
        echo "</tr>";
    }
    echo "</table>";

} catch (PDOException $e) {
    echo "<p>Error al conectar a la base de datos: " . $e->getMessage() . "</p>";
}
?>