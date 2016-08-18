#!/usr/bin/env bash

yes | sudo cp /home/ubuntu/hosts /etc/hosts > /dev/null 2>&1 &
wget -q https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb > /dev/null 2>&1 &
sudo apt update -qq > /dev/null 2>&1 &

sudo apt-get install puppetserver -qq > /dev/null 2>&1 &
export PATH=/opt/puppetlabs/puppet/bin/:$PATH

git clone https://github.com/cisco/cisco-yang-puppet-module.git -q
cd cisco-yang-puppet-module
puppet module build > /dev/null
sudo /opt/puppetlabs/puppet/bin/puppet module install pkg/*.tar.gz

yes | sudo cp /home/ubuntu/puppet.conf /etc/puppetlabs/puppet/puppet.conf
sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true > /dev/null
