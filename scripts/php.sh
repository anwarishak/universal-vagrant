#!/bin/bash

echo ">>>>> Installing PHP 5"
apt-get install -y -qq php5-fpm

echo ">>>>> Configuring PHP"
cp /universal-vagrant/configs/php5-fpm.conf /etc/apache2/conf-available/php5-fpm.conf
a2enconf php5-fpm
cp /universal-vagrant/configs/php.ini /etc/php5/fpm/php.ini

echo ">>>>> Installing PHP extensions"
apt-get install -y -qq php5-cli php5-curl php5-gd php5-mcrypt php5-memcached php5-mysql memcached

echo ">>>>> Restarting Apache"
service apache2 restart
service php5-fpm restart