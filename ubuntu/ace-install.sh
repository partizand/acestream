#!/bin/bash

# Install acestream engine on Ubuntu 16.04

INSTALL_DIR="/opt/acestream";
ACE_VER="acestream_3.1.16_ubuntu_16.04_x86_64";
ACE_ARH_FILE="$ACE_VER.tar.gz";

#if [[ $EUID -ne 0 ]]; then
#    echo "Run as root needed. Use sudo.";
#    exit 1;
#else

# install dependices

#sudo apt-get update -y; 
#sudo apt-get -y install python-setuptools;
#sudo apt-get -y install python-m2crypto;
#sudo apt-get -y install python-apsw;

# Create user and group

#addgroup --system acestream
sudo adduser --system --no-create-home --shell /bin/false --group acestream;

# load acestream-engine
#wget  -o - http://dl.acestream.org/linux/$ACE_ARH_FILE ;
sudo mkdir -p $INSTALL_DIR
sudo tar -C $INSTALL_DIR --strip=1 -vxf $ACE_ARH_FILE;

# dir rights
sudo chown acestream:acestream $INSTALL_DIR
sudo chown -R acestream:acestream $INSTALL_DIR/*

#tar --show-transformed-names --transform='s/$ACE_VER/acestream/' -vzxf $ACE_ARH_FILE;

#mv acestream $INSTALL_DIR/;
#rm -rf /tmp/*;
#chmod $INSTALL_DIR/acestream

# add service

sudo cp --update ./acestream.service /lib/systemd/system;
sudo cp --update ./start-service $INSTALL_DIR;
sudo chmod +x $INSTALL_DIR/start-service
#/lib/systemd/system/multi-user.target.wants

# Enable and start service
#sudo systemctl enable acestream;
#sudo systemctl start acestream;

#fi