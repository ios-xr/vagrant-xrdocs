#!/usr/bin/env bash

sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs
sudo rpm --import http://yum.puppetlabs.com/RPM-GPG-KEY-reductive

wget https://yum.puppetlabs.com/puppetlabs-release-pc1-cisco-wrlinux-7.noarch.rpm
sudo yum install -y puppetlabs-release-pc1-cisco-wrlinux-7.noarch.rpm
sudo yum install -y puppet

export PATH=/opt/puppetlabs/puppet/bin:$PATH
wget https://rubygems.org/downloads/grpc-0.15.0-x86_64-linux.gem

sudo gem install --no-rdoc --no-ri grpc
