#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y python-setuptools python-dev build-essential git libssl-dev libffi-dev sshpass lxc
sudo easy_install pip 
wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python


git clone https://github.com/ios-xr/iosxr-ansible.git
git clone git://github.com/ansible/ansible.git --recursive

mv ~/ansible_hosts  /home/vagrant/iosxr-ansible/remote/ansible_hosts
mv ~/ansible_env  /home/vagrant/iosxr-ansible/remote/ansible_env



#cd ansible/ && sudo python setup.py install
cd ansible/ && git checkout stable-2.2 && sudo python setup.py install
echo "source /home/vagrant/iosxr-ansible/remote/ansible_env" >> /home/vagrant/.profile

ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
cut -d" " -f2 ~/.ssh/id_rsa.pub | base64 -d > ~/.ssh/id_rsa_pub.b64


