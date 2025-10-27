# Taller: Vagrant con Provisionamiento por Shell

## Descripción
Proyecto que crea dos máquinas virtuales con Vagrant:
- **web:** servidor Apache con PHP.
- **db:** servidor PostgreSQL con base de datos de ejemplo.

## Requisitos
- VirtualBox
- Vagrant
- Git

## Instrucciones
1. Clonar el repositorio:  
   `git clone https://github.com/jjuanmanu15/vagrant-web-provisioning.git`
2. Levantar las máquinas:  
   `vagrant up`
3. Acceder al sitio web:  
   `http://192.168.56.10/`
4. Ver los datos de la base:  
   `http://192.168.56.10/info.php`

## Scripts de Provisionamiento
- **provision-web.sh**: instala Apache, PHP y copia los archivos del sitio.
- **provision-db.sh**: instala PostgreSQL, crea base de datos y tabla de ejemplo.
- **Archivos del sitio:** `index.html` y `info.php`.

## Capturas
Incluye aquí imágenes del sitio web y del listado de empleados funcionando.

## Autor
Juan Manuel Pérez  

