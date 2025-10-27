#!/usr/bin/env bash
set -euo pipefail

echo "[WEB] Actualizando índices de paquetes..."
sudo apt-get update -y

echo "[WEB] Instalando Apache y PHP..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 php libapache2-mod-php

echo "[WEB] Habilitando y arrancando Apache..."
sudo systemctl enable apache2
sudo systemctl restart apache2

echo "[WEB] Configurando contenido en /var/www/html..."
# Limpiar el index predeterminado y agregar página de prueba
sudo rm -f /var/www/html/index.html
echo "<h1>Servidor web listo</h1>" | sudo tee /var/www/html/index.html > /dev/null
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php > /dev/null

echo "[WEB] Permisos de /var/www/html..."
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "[WEB] Provisionamiento completado. Apache sirve desde /var/www/html."

