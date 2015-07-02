#!/bin/bash

echo ">>>>> Updating packages"

if grep -Fxq "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" /etc/apt/sources.list
then
    echo ">>>>> Sources list already up-to-date"
else
    echo ">>>>> Updating sources list"
    echo "
deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty multiverse
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list
fi

apt-get update -qq