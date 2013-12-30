universal-vagrant
=================

Vagrant provisioning scripts to set up development environments.

You will need Vagrant and VirtualBox up and running first.

Currently, universal-vagrant uses the precise32 box (Ubuntu 12.04 LTS) and sets up Apache 2, MySQL and PHP5. But this project can be extended to use any box and provision any software/platform you want in the box.

1. Clone project outside of your webroot; e.g. into "/var/www/universal-vagrant" or "C:/development/universal-vagrant"
2. Run "vagrant init" from within your webroot; e.g. inside "var/www/myproject.com" or "C:/development/myproject.com"
3. Copy /uiversal-vagrant/Vagrantfile to /myproject.com/Vagrantfile (replace the file created by Vagrant init)
4. Amend value of /myproject.com/Vagrantfile > PATH_TO_UNIVERSAL_VAGRANT to suit your system; e.g. "/var/www/universal-vagrant/" (Remember to add a trailing slash)
5. Run "vagrant up"

You should end up with a working LAMP box.

Go to localhost:8080 on your browser to test. Add a PHP file with phpinfo() in your webroot to test PHP functionality.