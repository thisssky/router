#!/bin/sh
# Copyright (C) 2015 Xiaomi
. /lib/functions.sh

#KEEP THIS BECAUSE IT WOULD HAVE CONFIGS REMAIN IN UCI,SHOULD MV TO OTA SHELL
local delete_cmd=$(uci show firewall | awk -F= '{if($1~/^firewall.parentalctl_/)  print "del "$1 }')

uci -q batch <<-EOF >/dev/null
    $delete_cmd
    commit firewall
EOF

uci -q batch <<-EOF >/dev/null
    set firewall.parentalctl=include
    set firewall.parentalctl.path="/lib/firewall.sysapi.loader parentalctl"
    set firewall.parentalctl.reload=1
    commit firewall
EOF

