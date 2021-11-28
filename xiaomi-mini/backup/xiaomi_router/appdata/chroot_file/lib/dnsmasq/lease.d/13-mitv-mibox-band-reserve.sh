#!/bin/sh
qosflag=`uci get miqos.settings.enabled 2>/dev/null`
[ "$qosflag" -ne "1" ] && return 0

logger -s -p 6 -t "lease.d.qos" "$@"

QOSC="/etc/init.d/miqos reserve"
const_T_video="video"
dhcp_file="/tmp/dhcp.leases"

clear_tv_link()
{
    iptables -t mangle -F miqos_tv 2>&- >&-
}

add_tv_mark()
{
    mac=$1
    ipt_mark_tv="iptables -t mangle -A miqos_tv"
    video_mark="0x300000/0xf00000"

    [ -z "$mac" ] && return 0;

    $ipt_mark_tv -m mac --mac-source $mac -j MARK --set-mark-return $video_mark 2>&- >&-
}

#read /tmp/dhcp.leases and get lost config
#43200 ac:f7:f3:ff:47:62 192.168.31.174 MI2S-xiaomishouji *
#120 e8:ab:fa:2b:44:15 192.168.31.217 ANTSCAM-0000-XRCZCZSRMWK61A1L111A-ZCM0AAa6sANMGF9 01:e8:ab:fa:2b:44:15

#clear iptables tv link 1stly
# no need to clear mitv and mibox
#
#clear_tv_link

exist_list=`iptables -t mangle -L miqos_tv 2>&- |grep MAC|awk '{print $7}'`

egrep -i "\<mi(tv|box)" $dhcp_file | while read p_time p_mac p_ip p_name p_other
do
    # notify QoS update MITV/MIBOX reservacation
    $QOSC add $p_ip $const_T_video >&- 2>&-

    # add iptables to mark all mitv and mibox as video
    exist_flag=`echo $exist_list |grep -i $p_mac`

    #skip if already exist
    [ -n "$exist_flag" ] || add_tv_mark $p_mac
done

#$1:OP,$2:MAC,$3:IP,$4:Hostname
#
#match=`echo $4 | grep -iE '^mi(tv|box)' 2>/dev/null`
#if [ -n "$match" ]; then
#    if [ "$1" == "del" ]; then
#        logger -s -p 6 -t "lease.d.qos" "del BAND_RESERVE $const_T_video for ip: $3"
#        $QOSC del $3 $const_T_video
#    else
#        logger -s -p 6 -t "lease.d.qos" "add BAND_RESERVE $const_T_video for ip: $3"
#        $QOSC add $3 $const_T_video
#    fi
#fi
