#!/bin/sh

set_env() {
  vagrant_loadbalancer_ip=192.168.100.10
  vagrant_web1_ip=192.168.100.11
  vagrant_web2_ip=192.168.100.12
  port_map_80=8082
  haproxy_balance_method=roundrobin
  haproxy_path=./scripts/
  vagrant_up
}
vagrant_up() {
  cp Vagrantfile.orginal Vagrantfile
  sed -i "s,slave1_ip,$vagrant_web1_ip,g" ./Vagrantfile
  sed -i "s,slave2_ip,$vagrant_web2_ip,g" ./Vagrantfile
  sed -i "s,loadbalancer_ip,$vagrant_loadbalancer_ip,g" ./Vagrantfile
  sed -i "s,Port_map_80,$Port_map_80,g" ./Vagrantfile

  cp $haproxy_path/haproxy.cfg.orginal $haproxy_path/haproxy.cfg
  sed -i "s,slave1_ip,$vagrant_web1_ip,g" $haproxy_balance_method/haproxy.cfg
  sed -i "s,slave2_ip,$vagrant_web2_ip,g" $haproxy_balance_method/haproxy.cfg
  sed -i "s,balance_method,$haproxy_balance_method,g" $haproxy_balance_method/haproxy.cfg
  vagrant up
}
set_env
