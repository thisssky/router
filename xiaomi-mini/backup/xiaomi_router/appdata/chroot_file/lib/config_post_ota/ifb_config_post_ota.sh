#!/bin/sh

/sbin/uci -q batch <<EOF >/dev/null
set network.ifb=interface
set network.ifb.ifname=ifb0

commit network
EOF
