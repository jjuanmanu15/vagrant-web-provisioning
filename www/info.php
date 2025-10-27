<?php
echo "<h1>Información del servidor PHP</h1>";
echo "<p>Fecha y hora actual: " . date('Y-m-d H:i:s') . "</p>";
echo "<p>Servidor: " . gethostname() . "</p>";
phpinfo();
?>
