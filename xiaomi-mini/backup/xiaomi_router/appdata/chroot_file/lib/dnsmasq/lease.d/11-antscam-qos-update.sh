#!/bin/sh
qosflag=`uci get miqos.settings.enabled 2>/dev/null`
[ "$qosflag" -ne "1" ] && return 0

logger -s -p 6 -t "lease.d.qos" "$@"
QOSC="/etc/init.d/miqos nprio"

#HIGH-PRIO,without band limit
NO_LIMIT_PRIO="HIGH_PRIO_WITHOUT_LIMIT"
#HIGH-PRIO,with band limit, no prio limit
BAND_LIMIT_PRIO="HIGH_PRIO_WITH_BANDLIMIT"
dhcp_file="/tmp/dhcp.leases"

#read /tmp/dhcp.leases and related high-prio host
#43200 ac:f7:f3:ff:47:62 192.168.31.174 MI2S-xiaomishouji *
#120 e8:ab:fa:2b:44:15 192.168.31.217 ANTSCAM-0000-XRCZCZSRMWK61A1L111A-ZCM0AAa6sANMGF9 01:e8:ab:fa:2b:44:15
awk -v cmd="$QOSC" -v type="$NO_LIMIT_PRIO" 'BEGIN{IGNORECASE=1}{if($4 ~ /^ANTSCAM/) { printf("%s add %s %s\n",cmd,$3,type); }}' $dhcp_file | ash 2>&- || :

#$1:OP,$2:MAC,$3:IP,$4:Hostname
antscam=`echo $4 |grep -iE '^ANTSCAM' 2>/dev/null`
if [ -n "$antscam" ]; then
    if [ "$1" == "del" ]; then
        logger -s -p 6 -t "lease.d.qos" "del NO-LIMIT-PRIO for ip: $3"
        $QOSC del $3 $NO_LIMIT_PRIO
    else
        logger -s -p 6 -t "lease.d.qos" "add NO-LIMIT-PRIO for ip: $3"
        $QOSC add $3 $NO_LIMIT_PRIO
    fi
fi
