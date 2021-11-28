#!/bin/sh
# Copyright (C) 2016 Xiaomi

uci -q batch <<-EOF >/dev/null
    set dnsfixd.baidu.request_url="https://anquanapi.baidu.com/api/open/adh"
    del dnsfixd.whitelist
    set dnsfixd.whitelist=whitelist
    add_list dnsfixd.whitelist.dns=8.8.8.8
    add_list dnsfixd.whitelist.dns=8.8.4.4
    add_list dnsfixd.whitelist.dns=114.114.114.114
    commit dnsfixd
EOF

