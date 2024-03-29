#!/bin/sh
set -x
set_env() {
  vagrant_loadbalancer_ip=192.168.100.10
  vagrant_web1_ip=192.168.100.11
  vagrant_web2_ip=192.168.100.12
  port_map_80=8082
  haproxy_balance_method=roundrobin
  haproxy_path=./scripts
  vagrant_up
}
vagrant_up() {
  cp Vagrantfile.orginal Vagrantfile
  sed -i -e "s,slave1_ip,$vagrant_web1_ip,g" Vagrantfile
  sed -i -e "s,slave2_ip,$vagrant_web2_ip,g" Vagrantfile
  sed -i -e "s,loadbalancer_ip,$vagrant_loadbalancer_ip,g" Vagrantfile
  sed -i -e "s,Port_map_80,$port_map_80,g" Vagrantfile

  cp $haproxy_path/haproxy.cfg.orginal $haproxy_path/haproxy.cfg
  sed -i -e "s,slave1_ip,$vagrant_web1_ip,g" $haproxy_path/haproxy.cfg
  sed -i -e "s,slave2_ip,$vagrant_web2_ip,g" $haproxy_path/haproxy.cfg
  sed -i -e "s,balance_method,$haproxy_balance_method,g" $haproxy_path/haproxy.cfg
  vagrant up
}
set_env
