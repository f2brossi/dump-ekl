#!/bin/bash

#
# Install ansible or update to the lattest stable version
#

logfile=/tmp/ansible.log

echo "Update repositories"
#sudo apt-get install -y software-properties-common
#sudo apt-add-repository ppa:ansible/ansible
apt-get update 2>$logfile 1>$logfile

echo "Install ansible"
apt-get install -y ansible
echo "Ansible version $(ansible --version) installed"

exit 0

