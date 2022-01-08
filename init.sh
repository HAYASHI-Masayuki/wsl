#!/bin/bash
set -u

# start sshd
cd
mkdir -m 0700 .ssh
cp /mnt/c/Users/$HOST_USER/.ssh/id_rsa.pub .ssh/authorized_keys
chmod 0600 .ssh/authorized_keys
sudo ssh-keygen -A
sudo service ssh start

# install ansible
sudo apt update
sudo apt install --yes software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install --yes ansible
