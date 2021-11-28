#!/bin/sh
# Copyright (C) 2015 Xiaomi
. /lib/functions.sh

old_timeout=$(uci get wifishare.global.auth_timeout 2>/dev/null)
[ "$old_timeout" == "30" ] && { uci set wifishare.global.auth_timeout=60; uci commit wifishare;}

guest_configed=$(uci get wireless.guest_2G  2>/dev/null)
guest_macfilter=$(uci get wireless.guest_2G.macfilter  2>/dev/null)
isolate_configed=$(uci get wireless.guest_2G.ap_isolate  2>/dev/null)
guest_ssid=$(uci get wireless.guest_2G.ssid 2>/dev/null)
guest_ssid_change=$(uci get wireless.guest_2G.ssid_changed 2>/dev/null)
guest_suffix=$(getmac |cut -b 13-17 |sed 's/://g' |tr '[a-z]' '[A-Z]')
guest_active=$(uci get wifishare.global.active 2>/dev/null)
country_code=$(nvram get CountryCode)
[ "$country_code" == "" ] && country_code="CN"

#guest_ssid="Xiaomi_${guest_suffix}_VIP"
[ "$guest_configed" != "" ] && [ "$isolate_configed" == "" ] && {
    uci set wireless.guest_2G.ap_isolate=1;
    uci commit wireless
}

[ "$guest_configed" != "" ] && [ "$guest_macfilter" == "allow" ] && {
    uci del wireless.guest_2G.maclist
    uci del wireless.guest_2G.macfilter
    uci commit wireless
}

[ "$guest_active" == "user" ] && {
    uci set wifishare.global.auth_timeout=90
    uci commit wifishare
}

#guest default format Xiaomi_xxxx_VIP
#guest_ssid_matched=$(echo $guest_ssid | grep "^Xiaomi_[[:xdigit:]]\{4\}_VIP$")
[ "$guest_ssid" != "" -a "$guest_ssid_change" != "2" ] && {
    if [ "$country_code" == "CN" ]
    then
        uci set wireless.guest_2G.ssid="  小米共享WiFi_${guest_suffix}";
    else
        uci set wireless.guest_2G.ssid="  MiShareWiFi_${guest_suffix}";
    fi
    uci set wireless.guest_2G.ssid_changed=2
    uci commit wireless
}

# used for wifishare v2 domain allow and ios allow uci
domain_white_list=$(uci get wifishare.global.domain_white_list 2>/dev/null)
ios_domain=$(uci get wifishare.global.ios_domain 2>/dev/null)
update_cfg_time=$(uci get wifishare.global.update_cfg_time 2>/dev/null)
config_md5=$(uci get wifishare.global.config_md5 2>/dev/null)
last_etag=$(uci get wifishare.global.last_etag 2>/dev/null)
[ -z "${domain_white_list}" ] && {
    uci set wifishare.global.domain_white_list="s.miwifi.com api.miwifi.com"
    uci commit wifishare
}
[ -z "${ios_domain}" ] && {
    uci set wifishare.global.ios_domain="captive.apple.com"
    uci commit wifishare
}
[ -z "${update_cfg_time}" ] && {
    uci set wifishare.global.update_cfg_time="12345"
    uci commit wifishare
}
[ -z "${config_md5}" ] && {
    uci set wifishare.global.config_md5="12345"
    uci commit wifishare
}
[ -z "${last_etag}" ] && {
    uci set wifishare.global.last_etag="5a3ca5a3-310a"
    uci commit wifishare
}

