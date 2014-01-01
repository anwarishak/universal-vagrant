#!/bin/bash

echo "Installing MySQL"
echo mysql-server mysql-server/root_password select "password" | debconf-set-selections
echo mysql-server mysql-server/root_password_again select "password" | debconf-set-selections
apt-get install -y -qq mysql-server

echo "Configuring MySQL"
cp /universal-vagrant/configs/my.cnf /etc/mysql/my.cnf

echo "Restarting MySQL"
service mysql restart

if [ -d /vagrant/.database ]
then
  echo "Setting up project database(s)"
  sql_files="/vagrant/.database/*.sql" 
  for file in $sql_files
  do
    if [ -f $file ]
    then
      db_name=`basename $file .sql`
      echo "Importing $db_name"
      mysql -u'root' -p'password' <<EOF
      CREATE DATABASE IF NOT EXISTS $db_name;
EOF
      mysql -u'root' -p'password' "$db_name" < $file
    else
      echo "No project database(s) to import"
    fi
  done;
else
  echo "Database directory not found"
  exit 1
fi