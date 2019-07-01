#!/bin/bash
sudo apt-get clean
sudo apt-get update -y

sudo apt-get install nginx -y
sudo service nginx start
