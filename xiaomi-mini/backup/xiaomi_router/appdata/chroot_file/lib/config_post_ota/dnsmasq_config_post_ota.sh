#!/bin/sh
#
#FILE_TARGET: /lib/config_post_ota/dnsmasq_config_post_ota.sh
#

/sbin/uci -q batch <<-EOF >/dev/null
set dhcp.@dnsmasq[0].nonegcache=1
set dhcp.@dnsmasq[0].cachesize=500
set dhcp.@dnsmasq[0].maxttl=30
set dhcp.@dnsmasq[0].maxcachettl=1800
set dhcp.@dnsmasq[0].dnsforwardmax=300
set dhcp.@dnsmasq[0].leasefile=/tmp/dhcp.leases
set dhcp.@dnsmasq[0].allservers=1
set dhcp.@dnsmasq[0].client_update_ddns=1
delete dhcp.@dnsmasq[0].intercept
delete dhcp.@dnsmasq[0].domain
delete dhcp.@dnsmasq[0].filterwin2k
delete dhcp.@dnsmasq[0].readethers
delete dhcp.lan.dhcp_option_force
set dhcp.ready=dhcp
set dhcp.ready.interface=ready
set dhcp.ready.start=10
set dhcp.ready.limit=20
set dhcp.ready.leasetime=5m
set dhcp.ready.force=1
delete dhcp.ready.dhcp_option_force
commit dhcp
EOF

netmode=$(uci get xiaoqiang.common.NETMODE 2>/dev/null)
if [ "$netmode" = "lanapmode" ]
then
    /sbin/uci -q batch <<-EOF >/dev/null
    set dhcp.lan.ignore=1;
    commit dhcp
EOF
fi

echo "INFO: update dnsmasq config ok."
exit 0
