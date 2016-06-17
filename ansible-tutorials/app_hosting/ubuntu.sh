#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y python-setuptools python-dev build-essential git libssl-dev libffi-dev sshpass lxc
sudo easy_install pip
wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python


git clone git://github.com/ansible/ansible.git --recursive
git clone https://github.com/ios-xr/iosxr-ansible.git
cd ansible/ && sudo python setup.py install


mv ~/ansible_hosts  /home/vagrant/iosxr-ansible/remote/ansible_hosts
mv ~/ansible_env  /home/vagrant/iosxr-ansible/remote/ansible_env

echo "source /home/vagrant/iosxr-ansible/remote/ansible_env" >> /home/vagrant/.profile

ssh-keygen -t rsa -f /home/vagrant/.ssh/id_rsa -q -P ""
cut -d" " -f2 ~/.ssh/id_rsa.pub | base64 -d > ~/.ssh/id_rsa_pub.b64

# tftp server spin section
sudo apt-get install -y xinetd tftpd tftp

sudo touch /etc/xinetd.d/tftp

sudo sh -c 'cat <<EOT >> /etc/xinetd.d/tftp
service tftp
{
protocol        = udp
port            = 69
socket_type     = dgram
wait            = yes
user            = nobody
server          = /usr/sbin/in.tftpd
server_args     = /tftpboot
disable         = no
}
EOT'
sudo echo "line 2" >> /etc/xinetd.d/tftp


sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot

sudo service xinetd restart
