#!/bin/bash
if [ "$1" == "" ]
then
echo "Usage: run.sh cli|desktop|all"
exit
fi

echo "***************** Stating Installing Packages *****************"
sudo apt-get update
sudo apt-get install -y git python3 python3-pip \
    apt-transport-https \
    ca-certificates \
    curl ansible\
    gnupg \
    lsb-release
pip3 install -y ansible
mkdir ~/projects
echo "***************** Starting Ansible Playbook *****************"
exec ansible-playbook main.yml --tags=$1
