#!/bin/bash
sudo tc qdisc del dev eth4 root &> /dev/null
sudo tc qdisc del dev eth3 root &> /dev/null
echo "Starting packet loss on backup link"
sudo tc qdisc add dev eth4 root netem loss 4%
