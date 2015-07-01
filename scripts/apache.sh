#!/bin/bash

echo ">>>>>> Installing Apache 2"
apt-get install -y -qq apache2

echo ">>>>>> Configuring Apache"
cp /universal-vagrant/configs/apache-security.conf /etc/apache2/conf-available/security.conf
cp /universal-vagrant/configs/apache-dir.conf /etc/apache2/mods-available/dir.conf
a2enmod rewrite
cp /universal-vagrant/configs/apache-sites-default /etc/apache2/sites-available/default

#### PREFORK OR EVENT? MOD_PHP OR FPM?

# Create an SSL version as well?

echo ">>>>> Setting up webroot"
rm -rf /var/www
mkdir /var/www
mkdir /var/www/default
mkdir /var/www/default/log
ln -fs /vagrant /var/www/default/public_html

echo ">>>>> Configure logrotate"
sudo cp /universal-vagrant/configs/logrotate-apache2 /etc/logrotate.d/apache2

echo ">>>>> Restarting Apache"
service apache2 restart