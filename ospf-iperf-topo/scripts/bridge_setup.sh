#!/bin/bash


apt-get -y install bridge-utils
ifconfig eth1 promisc
ifconfig eth2 promisc
ifconfig eth3 promisc
ifconfig eth4 promisc

ifconfig eth1 up
ifconfig eth2 up
ifconfig eth3 up
ifconfig eth4 up

brctl addbr br0
brctl addif br0 eth1
brctl addif br0 eth3
ifconfig br0 up

brctl addbr br1
brctl addif br1 eth2
brctl addif br1 eth4
ifconfig br1 up
