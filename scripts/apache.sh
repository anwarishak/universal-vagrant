#!/bin/bash

echo ">>>>>> Installing Apache 2"
apt-get install -y -qq apache2

echo ">>>>>> Configuring Apache"
cp /universal-vagrant/configs/apache2.conf /etc/apache2/apache2.conf
cp /universal-vagrant/configs/apache-security.conf /etc/apache2/conf-available/security.conf
cp /universal-vagrant/configs/apache-dir.conf /etc/apache2/mods-available/dir.conf
apt-get install libapache2-mod-fastcgi
a2enmod rewrite actions
cp /universal-vagrant/configs/000-default.conf /etc/apache2/sites-available/000-default.conf

# Create an SSL version as well?

echo ">>>>> Setting up webroot"
rm -rf /var/www
mkdir /var/www
mkdir /var/www/default
mkdir /var/www/default/logs
ln -fs /vagrant /var/www/default/public_html

echo ">>>>> Configure logrotate"
sudo cp /universal-vagrant/configs/logrotate-apache2 /etc/logrotate.d/apache2

echo ">>>>> Restarting Apache"
service apache2 restart