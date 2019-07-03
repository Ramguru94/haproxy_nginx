#!/bin/bash
set -x

install() {
  sudo apt-get clean
  sudo apt-get update -y
  sudo apt-get install -y nginx
  sudo service nginx start
  sudo rm /var/www/html/*
  sudo cp /home/vagrant/index.html /var/www/html/index.html
}
install
