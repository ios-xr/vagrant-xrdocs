#!/usr/bin/env bash

cat /home/vagrant/hosts | sudo tee /etc/hosts
cat /home/vagrant/hostname | sudo tee /etc/hostname
sudo ip addr add 10.1.1.10/24 dev enp0s8

sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
sudo rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum -y update > /dev/null 2>&1
sudo yum install -y puppetserver > /dev/null 2>&1
sudo yum install -y git > /dev/null

git clone https://github.com/cisco/cisco-yang-puppet-module.git -q
cd cisco-yang-puppet-module
yes | cp /home/vagrant/hosts.cfg hosts.cfg
/opt/puppetlabs/puppet/bin/puppet module build > /dev/null
sudo /opt/puppetlabs/puppet/bin/puppet module install pkg/*.tar.gz

cat /home/vagrant/puppet.conf | sudo tee -a /etc/puppetlabs/puppet/puppet.conf
sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true > /dev/null

sudo yum install -y ruby-devel gcc-c++ zlib-devel > /dev/null
sudo gem update --system --no-rdoc --no-ri > /dev/null
sudo gem install --no-rdoc --no-ri json_pure > /dev/null
sudo gem update --no-rdoc --no-ri > /dev/null
sudo gem install bundle --no-rdoc --no-ri > /dev/null
sudo gem install rake --no-rdoc --no-ri > /dev/null
sudo gem install beaker --no-rdoc --no-ri > /dev/null
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config
