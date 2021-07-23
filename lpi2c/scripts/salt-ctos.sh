#!/usr/bin/env bash

sudo rpm --import https://repo.saltstack.com/py3/redhat/7/x86_64/archive/2018.3.4/SALTSTACK-GPG-KEY.pub

wget -O /etc/yum.repos.d/saltstack.repo http://172.31.7.54/scripts/saltstack.repo

sudo yum clean expire-cache
sudo yum install -y python36
sudo yum install -y salt-minion

sudo systemctl stop salt-minion
sudo rm -rf /etc/salt/pki/minion
echo "master: saltmaster.darkside.local" >> /etc/salt/minion
sudo systemctl enable salt-minion
sudo systemctl start salt-minion
