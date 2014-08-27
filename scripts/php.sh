#!/bin/bash

echo ">>>>> Installing PHP 5"
apt-get install -y -qq php5 libapache2-mod-php5

echo ">>>>> Configuring PHP"
cp /universal-vagrant/configs/php.ini /etc/php5/apache2/php.ini

echo ">>>>> Installing PHP extensions"
apt-get install -y -qq php5-curl php5-gd php5-mcrypt php5-memcached php5-mysql php5-xcache memcached php5-memcached

echo ">>>>> Restarting Apache"
service apache2 restart