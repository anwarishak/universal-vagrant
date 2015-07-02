#!/bin/bash

echo ">>>>>> Installing Nodejs"

apt-get install -y -qq nodejs
apt-get install -y -qq npm
apt-get install -y -qq build-essential
ln -s /usr/bin/nodejs /usr/bin/node