#!/usr/bin/env bash
set -euo pipefail

echo "[DB] Actualizando paquetes..."
sudo apt-get update -y

echo "[DB] Instalando PostgreSQL..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql

echo "[DB] Habilitando y arrancando PostgreSQL..."
sudo systemctl enable postgresql
sudo systemctl restart postgresql

# Variables
DBNAME="empresa"
DBUSER="juan"
DBPASS="clave123"

echo "[DB] Creando base de datos y usuario..."
sudo -u postgres psql -v ON_ERROR_STOP=1 <<SQL
DO \$\$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${DBUSER}') THEN
      CREATE ROLE ${DBUSER} LOGIN PASSWORD '${DBPASS}';
   END IF;
END
\$\$;
CREATE DATABASE ${DBNAME} OWNER ${DBUSER};
GRANT ALL PRIVILEGES ON DATABASE ${DBNAME} TO ${DBUSER};
SQL

echo "[DB] Configurando acceso remoto..."
PG_HBA="/etc/postgresql/12/main/pg_hba.conf"
sudo sed -i "1ihost    all             all             192.168.56.10/32            md5" "$PG_HBA"
sudo sed -i "s/^#listen_addresses =.*/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf

sudo systemctl restart postgresql
echo "[DB] PostgreSQL configurado y listo."

