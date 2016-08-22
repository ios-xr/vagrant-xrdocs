#!/usr/bin/env bash

sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-reductive
wget -q https://yum.puppetlabs.com/puppetlabs-release-pc1-cisco-wrlinux-7.noarch.rpm
sudo yum install -y puppetlabs-release-pc1-cisco-wrlinux-7.noarch.rpm > /dev/null
sudo yum update -y > /dev/null
sudo yum install -y puppet > /dev/null

export PATH=/opt/puppetlabs/puppet/bin:$PATH
wget -q https://rubygems.org/downloads/grpc-0.15.0-x86_64-linux.gem
sudo /opt/puppetlabs/puppet/bin/gem install --no-rdoc --no-ri grpc > /dev/null 2>&1

yes | sudo cp /home/vagrant/puppet.conf /etc/puppetlabs/puppet/puppet.conf
yes | sudo cp /home/vagrant/hosts /etc/hosts
yes | sudo cp /home/vagrant/cisco_yang.yaml /etc/cisco_yang.yaml
