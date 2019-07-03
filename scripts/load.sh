#!/bin/bash
set -x
install () {
  sudo apt-get clean
  sudo apt-get update
  sudo apt-get install haproxy -y
  config
}

config () {
  sudo rm /etc/haproxy/haproxy.cfg
  sudo cp /home/vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
  sudo /etc/init.d/haproxy restart
}
install
