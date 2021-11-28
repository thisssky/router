#!/bin/sh

[ -n "$INCLUDE_ONLY" ] || {
    . /lib/functions.sh
    . ../netifd-proto.sh
    init_proto "$@"
}

proto_ieee8021x_init_config() {
    proto_config_add_string "ipaddr"
    proto_config_add_string "netmask"
    proto_config_add_string "hostname"
    proto_config_add_string "clientid"
    proto_config_add_string "vendorid"
    proto_config_add_boolean "broadcast"
    proto_config_add_string "reqopts"
    proto_config_add_string "username"
    proto_config_add_string "password"
    proto_config_add_string "eap"
}

proto_ieee8021x_setup() {
    local config="$1"
    local iface="$2"
    iface="${iface:-eth0.2}"
    local pidfile='/var/run/wpa_supplicant.pid'
    local optfile="/var/etc/wpa_supplicant_wan.conf"
    local control="/var/run/wpa_supplicant_wan"

    local ipaddr clientid vendorid broadcast reqopts username password eap
    json_get_vars ipaddr clientid vendorid broadcast reqopts username password eap

    identity="identity=\"$username\""
    password="${password:+password=\"$password\"}"
    [ -f "$pidfile" ] && {
	local oldpid=$(cat $pidfile)
	[ -n "$oldpid" ] && kill -s 15 "$oldpid"
    }
    [ -f "$control" ] && rm -f "$control"
    mkdir -p $(dirname $optfile)
    cat > "$optfile" <<EOF
ctrl_interface=$control
ap_scan=0
network={
	key_mgmt=IEEE8021X
        eap=$eap
	$identity
	$password
        eapol_flags=0
}
EOF
    /usr/sbin/phyhelper set_eap
    wpa_supplicant -B -i "$iface"\
		   -c "$optfile" \
		   -P "$pidfile" \
		   -D wired

    local opt dhcpopts
    for opt in $reqopts; do
	append dhcpopts "-O $opt"
    done

    model=$(uci -q get misc.hardware.model)
    [ -z "$model" ] && model=$(cat /proc/xiaoqiang/model)
    hostname="MiWiFi-$model"
    [ "$broadcast" = 1 ] && broadcast="-B" || broadcast=
    [ -n "$clientid" ] && clientid="-x 0x3d:${clientid//:/}" || clientid="-C"
    proto_export "INTERFACE=$config"
    proto_run_command "$config" udhcpc \
		-p /var/run/udhcpc-$iface.pid \
		-s /lib/netifd/dhcp.script \
		-f -t 0 -i "$iface" \
		-H $hostname \
		${ipaddr:+-r $ipaddr} \
		${vendorid:+-V $vendorid} \
		$clientid $broadcast $dhcpopts
}

proto_ieee8021x_teardown() {
    local iface="$1"
    local control="/var/run/wpa_supplicant_wan"
    wpa_cli -p /var/run/wpa_supplicant_wan terminate
    proto_kill_command "$iface"
    proto_notify_error "$iface" AUTH_FAILED
    proto_block_restart "$iface"
    /usr/sbin/phyhelper del_eap
}

[ -n "$INCLUDE_ONLY" ] || {
    add_protocol ieee8021x
}
