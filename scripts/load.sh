#!/bin/bash

install () {
  sudo apt-get clean
  sudo apt-get update
  sudo apt-get install haproxy -y
}

config () {
  sudo rm /etc/haproxy/haproxy.cfg
  sed 
}
install
