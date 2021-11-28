#!/bin/sh

. /lib/functions.sh
config_load misc

# power on all lan port
sw_start_lan() {
    config_get power_reg sw_reg sw_power
    config_get up_val sw_reg sw_power_up
    config_get lan_ports sw_reg sw_lan_ports
    for p in $lan_ports
    do
	mii_mgr -s -p $p -r $power_reg -v $up_val >/dev/null
    done
}

# power off all lan port
sw_stop_lan() {
    config_get power_reg sw_reg sw_power
    config_get down_val sw_reg sw_power_down
    config_get lan_ports sw_reg sw_lan_ports
    for p in $lan_ports
    do
	mii_mgr -s -p $p -r $power_reg -v $down_val >/dev/null
    done
}

# detect link on wan port
sw_wan_link_detect() {
    config_get wan_port sw_reg sw_wan_port
    /usr/sbin/ethstt > /dev/null 2>&1
    /usr/sbin/ethstt 2>&1 | grep -e"^port $wan_port" | grep -q "up"
}

# count link on all lan port
sw_lan_count() {
    config_get lan_ports sw_reg sw_lan_ports
    /usr/sbin/ethstt > /dev/null 2>&1
    /usr/sbin/ethstt 2>&1 | grep -e"^port [$lan_ports]" | grep "up" | wc -l
}

# is wan port enable gigabytes?
sw_is_wan_giga() {
    # no giga
    return 1
}

# set gigabyte on/off for wan
# sw_set_wan_giga on
# sw_set_wan_giga off
sw_set_wan_giga() {
    #no giga
    return 1
}

# wan port 100M or 10M?
sw_is_wan_100m() {
    config_get wan_port sw_reg sw_wan_port
    config_get reg_speed sw_reg sw_speed
    config_get neg_100 sw_reg sw_neg_100
    mii_mgr -s -p 0 -r 31 -v 8000 >/dev/null
    mii_mgr -g -p $wan_port -r $reg_speed | grep -q -i $neg_100
}

# set wan port to 100M or 10M
# sw_set_wan_100m 100
# sw_set_wan_100m 10
sw_set_wan_100m() {
    config_get wan_port sw_reg sw_wan_port
    config_get reg_speed sw_reg sw_speed
    if [ "$1" = '100' ]; then
	config_get neg_val sw_reg sw_neg_100
    else
	config_get neg_val sw_reg sw_neg_10
    fi
    mii_mgr -s -p 0 -r 31 -v 8000 >/dev/null
    mii_mgr -s -p $wan_port -r $reg_speed -v $neg_val >/dev/null
}

# issue re-negation on wan
sw_reneg_wan() {
    config_get wan_port sw_reg sw_wan_port
    config_get power_reg sw_reg sw_power
    config_get redo_neg sw_reg sw_redo_neg
    mii_mgr -s -p $wan_port -r $power_reg -v $redo_neg >/dev/null
}
