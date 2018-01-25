#!/bin/bash

# Install acestream engine on Ubuntu 16.04
# Loads binaries from official site
# Install dependies
# Create system user and group acestream
# Create and start systemd service

# run as root

INSTALL_DIR="/opt/acestream";
ACE_ARH_FILE="acestream_3.1.16_ubuntu_16.04_x86_64.tar.gz";
#-------------------------------------------------------

SCRIPT_DIR=$(readlink -f $(dirname $0));

# install dependices
sudo apt-get update -y; 
sudo apt-get -y install python-setuptools;
sudo apt-get -y install python-m2crypto;
sudo apt-get -y install python-apsw;

# Create user and group
sudo adduser --system --no-create-home --shell /bin/false --group acestream;

# load acestream-engine
wget  -O /tmp/${ACE_ARH_FILE} http://dl.acestream.org/linux/${ACE_ARH_FILE} ;
sudo mkdir -p ${INSTALL_DIR}
sudo tar -C ${INSTALL_DIR} --strip=1 -vxf /tmp/${ACE_ARH_FILE};
rm /tmp/${ACE_ARH_FILE}

# dir owner
sudo chown acestream:acestream ${INSTALL_DIR}
sudo chown -R acestream:acestream ${INSTALL_DIR}/*

# add service
sed "s=/opt/acestream=${INSTALL_DIR}=" ${SCRIPT_DIR}/acestream.service > /tmp/acestream.service;
sudo mv /tmp/acestream.service /lib/systemd/system/acestream.service;
sudo cp --update ${SCRIPT_DIR}/start-service ${INSTALL_DIR};
sudo chmod +x ${INSTALL_DIR}/start-service

# Enable and start service
sudo systemctl enable acestream;
sudo systemctl start acestream;

