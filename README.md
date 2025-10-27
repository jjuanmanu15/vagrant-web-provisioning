# Proyecto Vagrant Web + DB

## Descripción
Proyecto de provisionamiento con Vagrant usando Shell Scripts para desplegar:
- Servidor web (Apache + PHP)
- Servidor de base de datos (PostgreSQL)

## Pasos de instalación
1. Clonar el repositorio desde el fork.
2. Ejecutar vagrant u` para levantar las máquinas `web` y `db`.
3. Apache y PHP se configuran automáticamente en la máquina web.
4. PostgreSQL se instala en la máquina db mediante `provision-db.sh`.

## Scripts utilizados
- **provision-web.sh:** instala Apache, PHP y copia los archivos del sitio.
- **provision-db.sh:** instala PostgreSQL, crea base de datos y usuario.
- **info.php:** muestra los datos de la tabla `empleados` usando PDO.

## Capturas de pantalla
Agrega aquí tus imágenes del navegador mostrando:
- Página HTML (`index.html`)
- Tabla con datos desde `info.php`
