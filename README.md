universal-vagrant
=================

**universal-vagrant** is an out-of-the-box working Vagrant provisioner.

**universal-vagrant** uses the precise32 box (Ubuntu 12.04 LTS) and sets up Apache 2, MySQL and PHP5 by default. However, this project can be extended to use any box and provision any software/platform as required.

### Step 1

Install the latest versions of [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) on your machine. They are available for fairly recent versions of OSX and Windows.

### Step 2

Download the latest release of **universal-vagrant** into a folder outside of your web root. E.g. into ```/www/universal-vagrant``` or ```C:/www/universal-vagrant```.

### Step 3

Copy ```/www/universal-vagrant/Vagrantfile-sample``` into your project folder and rename it to ```Vagrantfile```. E.g.  ```/www/my-project/Vagrantfile```.

### Step 4

Edit the copied Vagrantfile (in your text editor). Instructions of what to change are indicated inside the file with comments. E.g. path to **universal-vagrant**, and folder permissions.

### Step 5

Open your Terminal or command line window:

```
> cd /www/my-project
> vagrant up
```

This runs the Vagrant provisioner, and will take a few minutes, depending on the speed of your machine.

You should then end up with a working LAMP envionrment.

Go to http://localhost:8080 on your web broser to access your project via the web server.

Done!

Tip: Add a PHP file with the line ```<?php phpinfo();``` in your project web root to test PHP functionality.

## Database

The provisioner will attempt to set up any database(s) for your project. Create database SQL dumps in ```/www/my-project/_database``` with the name of the database as the filename.

E.g. ```/www/my-project/_database/project.sql``` will create a database with the name ```project```. You can have more than one database, if required.

To access the database within your app, use the following credentials:

```php
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'password');
define('DB_NAME', 'project'); // Should be the same as your SQL file name
```

To access the database within your desktop MySQL app, tunnel via SSH with:

```
Host: 127.0.0.1
SSH user: vagrant
SSH key: [Vagrant typically puts this in ~/.vagrant.d/insecure_private_key]
Port: 2222
```

## SSH

You can SSH into the Vagrant box using Terminal or the command line window.

```
> vagrant ssh
```

## Some common Vagrant commands

If you need to reprovision your box (e.g. to use a new version of the database file):

```
> vagrant provision
```

If you have several projects up and running, it is advised to suspend your Vagrant box before you enable the other. To suspend:

```
> vagrant suspend
```

And to wake it up again:

```
> vagrant up
```

If you don't want your Vagrant box anymore, you can destroy it:

```
> vagrant destroy
```