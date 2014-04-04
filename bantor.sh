#!/bin/bash

sudo ipset -N newset iphash


while read ip; do 
  sudo ipset -A newset $ip
done < torip

sudo iptables -A INPUT -m set --match-set newset src -j DROP
