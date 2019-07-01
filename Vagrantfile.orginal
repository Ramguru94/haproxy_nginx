# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "loadbalancer" do |master|
     master.vm.box = "ubuntu/bionic64"
     master.vm.host_name = "loadbalancer"
     master.vm.network "private_network", ip: "loadbalancer_ip"
     master.vm.network "forwarded_port", guest: 22, host: 2222, auto_correct: true
     master.vm.network "forwarded_port", guest: 80, host: Port_map_80, auto_correct: true
     config.vm.provision "shell", path: "./scripts/load.sh"
     config.vm.provision "file", source: "./scripts/haproxy.cfg", destination: "/etc/haproxy/haproxy.cfg"
  end

  config.vm.define "web1" do |slave1|
     slave1.vm.box = "ubuntu/bionic64"
     slave1.vm.host_name = "web-1"
     slave1.vm.network "private_network", ip: "slave1_ip"
     slave1.vm.network "forwarded_port", guest: 22, host: 2223, auto_correct: true
     config.vm.provision "shell", path: "./scripts/slave.sh"
  end

  config.vm.define "web2" do |slave2|
     slave2.vm.box = "ubuntu/bionic64"
     slave2.vm.host_name = "web-2"
     slave2.vm.network "private_network", ip: "slave2_ip"
     slave2.vm.network "forwarded_port", guest: 22, host: 2224, auto_correct: true
     config.vm.provision "shell", path: "./scripts/slave.sh"
  end

end
