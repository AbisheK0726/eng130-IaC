#!/bin/bash

# Update and Upgrade
echo -e '\033[0;34m' "Updating & Upgrading" '\033[0m'
sudo apt-get update -y
sudo apt-get upgrade -y
echo -e '\033[0;32m' "=======[COMPLETE]=======" '\033[0m'

# Adding Repositories
echo -e '\033[0;34m' "Installing Software-Properties-Common" '\033[0m'
sudo apt-get install software-properties-common
echo -e '\033[0;34m' "Adding Ansible Repository" '\033[0m'
sudo apt-add-repository ppa:ansible/ansible
echo -e '\033[0;32m' "=======[COMPLETE]=======" '\033[0m'

# Installing Ansible
echo -e '\033[0;34m' "Installing Ansible" '\033[0m'
sudo apt-get update -y
sudo apt-get install ansible -y
ansible --version
echo -e '\033[0;32m' "=======[COMPLETE]=======" '\033[0m'

# Installing Tree
echo -e '\033[0;34m' "Installing Ansible" '\033[0m'
sudo apt install tree
echo -e '\033[0;32m' "=======[COMPLETE]=======" '\033[0m'

# Configuring Ansible
echo -e '\033[0;34m' "Configuring Ansible Hosts files" '\033[0m'
sudo cp -f /home/vagrant/newHosts /etc/ansible/