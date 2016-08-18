#!/usr/bin/env bash

echo "127.0.0.1 ubuntu-xenial" | sudo tee -a /etc/hosts
wget -q https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb > /dev/null
sudo apt update -qq

sudo apt-get install puppetserver -qq > /dev/null
export PATH=/opt/puppetlabs/puppet/bin/:$PATH

git clone https://github.com/cisco/cisco-yang-puppet-module.git -q
cd cisco-yang-puppet-module
puppet module build > /dev/null
puppet module install pkg/*.tar.gz

sudo systemctl start puppetserver
