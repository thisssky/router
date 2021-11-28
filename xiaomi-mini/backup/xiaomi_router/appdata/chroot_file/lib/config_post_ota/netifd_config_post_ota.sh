#!/bin/sh

# add troubleshoot netowrk
/sbin/uci -q batch <<-EOF >/dev/null
delete network.diagnose
set network.ready=interface
set network.ready.proto=static
set network.ready.ipaddr=169.254.29.1
set network.ready.netmask=255.255.255.0
commit network
EOF

has_smartvpn_old_version=$(uci get smartvpn.settings 2>/dev/null)
[ ! -z $has_smartvpn_old_version ] && {

smartdns_conf_name="smartdns.conf"
rm "/etc/dnsmasq.d/$smartdns_conf_name"
rm "/var/etc/dnsmasq.d/$smartdns_conf_name"
rm "/tmp/etc/dnsmasq.d/$smartdns_conf_name"

/sbin/uci -q batch <<-EOF >/dev/null
delete smartvpn.settings
delete smartvpn.dest
set smartvpn.vpn=remote
set smartvpn.vpn.type=vpn
set smartvpn.vpn.domain_file=/etc/smartvpn/proxy.txt
set smartvpn.vpn.disabled=0
set smartvpn.vpn.status=off
set smartvpn.dest=dest
add_list smartvpn.dest.notnet=169.254.0.0/16
add_list smartvpn.dest.notnet=172.16.0.0/12
add_list smartvpn.dest.notnet=192.168.0.0/16
add_list smartvpn.dest.notnet=224.0.0.0/4
add_list smartvpn.dest.notnet=240.0.0.0/4
commit smartvpn

delete firewall.smartvpn
delete firewall.proxy_thirdparty
commit firewall
EOF

}

