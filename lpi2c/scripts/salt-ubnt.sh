#!/usr/bin/env bash

wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
apt update
apt install -y python3

echo 'deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/2018.3 bionic main' > /etc/apt/sources.list.d/saltstack.list
apt update
apt install -y salt-minion
systemctl stop salt-minion
rm -rf /etc/salt/pki/minion
echo "master: saltmaster.theforce.local" >> /etc/salt/minion
systemctl enable salt-minion
systemctl start salt-minion
