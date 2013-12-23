#!/bin/bash

echo "Installing Apache 2"
apt-get install -y -qq apache2
echo "Configuring Apache"
cp /universal-vagrant/configs/apache2.conf /etc/apache2/apache2.conf
cp /universal-vagrant/configs/security /etc/apache2/conf.d/security
a2enmod rewrite
echo "Restarting Apache"
service apache2 restart