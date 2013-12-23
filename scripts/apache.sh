#!/bin/bash

echo "Installing Apache 2"
apt-get install -y -qq apache2

echo "Configuring Apache"
cp /universal-vagrant/configs/apache2.conf /etc/apache2/apache2.conf
cp /universal-vagrant/configs/apache-security /etc/apache2/conf.d/security
a2enmod rewrite
cp /universal-vagrant/configs/apache-sites-default /etc/apache2/sites-available/default

echo "Setting up webroot"
rm -rf /var/www
mkdir /var/www
mkdir /var/www/default
mkdir /var/www/default/log
ln -fs /vagrant /var/www/default/public_html

echo "Restarting Apache"
service apache2 restart