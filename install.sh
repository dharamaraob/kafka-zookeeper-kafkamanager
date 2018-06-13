#!/bin/bash
export EXPOSED_HOSTNAME=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
mkdir -p zookeeper/{data,logs}
sudo apt-get -y update; sudo apt-get install docker-compose ;
docker-compose -f docker-compose.yml up -d
# open the ports 
# check the ports
telnet $EXPOSED_HOSTNAME 2181 #zookeeper # use localhost aswell instead of hostname
telnet $EXPOSED_HOSTNAME 9092 #kafka
telnet $EXPOSED_HOSTNAME 9093 #jmx
telnet $EXPOSED_HOSTNAME 9000 #kafka manager

telnet $public_ip 2181 
telnet $public_ip 9092
telnet $public_ip 9093
telnet $public_ip 9000

curl -v $public_ip:2181
curl -v $public_ip:9092
curl -v $public_ip:9093
curl -v $public_ip:9000

#in the actual server check, is it listening on the particular port
netstat | grep 2181
netstat | grep 9092
netstat | grep 9093
netstat | grep 9000

