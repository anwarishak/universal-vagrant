universal-vagrant
=================

universal-vagrant makes it easy to get going with Vagrant.

You will need the latest versions of Vagrant and VirtualBox up and running first.

universal-vagrant uses the precise32 box (Ubuntu 12.04 LTS) and sets up Apache 2, MySQL and PHP5. But this project can be extended to use any box and provision any software/platform as required.

1. Download the latest release of universal-vagrant into a folder outside of your web root. E.g. into "/var/www/universal-vagrant" or "C:/development/universal-vagrant".
2. Copy "Vagrantfile-sample" into your web root and rename it to "Vagrantfile".
3. Open the Vagrantfile in your web root in a text editor and change some details (instructions of what to change are commented in the file). E.g. path to universal-vagrant, any folder permission changes required.
4. Run "vagrant up".

You should end up with a working LAMP box.

Notes
-----

* Go to localhost:8080 on your browser to test. Add a PHP file with phpinfo() in your webroot to test PHP functionality.
* The provisioner will also attempt to set up any databases for your project. Create database SQL dumps in /\_database with the name of the database as the filename. E.g. /\_database/my\_project.sql. The script will attempt to create the my\_project database and import the SQL file (for the structure and data). You can have more than one SQL file in the directory if you need more than one database set up.
