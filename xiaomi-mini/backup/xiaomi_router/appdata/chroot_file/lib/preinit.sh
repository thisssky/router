#!/bin/sh
# Copyright (C) 2006 OpenWrt.org
# Copyright (C) 2010 Vertical Communications

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

pi_ifname=
pi_ip=192.168.31.1
pi_broadcast=192.168.31.255
pi_netmask=255.255.255.0

fs_failsafe_ifname=
fs_failsafe_ip=192.168.31.1
fs_failsafe_broadcast=192.168.31.255
fs_failsafe_netmask=255.255.255.0

fs_failsafe_wait_timeout=2

pi_suppress_stderr=
pi_init_suppress_stderr=
pi_init_path="/bin:/sbin:/usr/bin:/usr/sbin"
pi_init_cmd="/sbin/init"

. /lib/functions.sh
. /lib/functions/boot.sh

boot_hook_init preinit_essential
boot_hook_init preinit_main
boot_hook_init failsafe
boot_hook_init initramfs
boot_hook_init preinit_mount_root

for pi_source_file in /lib/preinit/*; do
    . $pi_source_file
done

cat /usr/share/xiaoqiang/xiaoqiang_version
boot_run_hook preinit_essential

pi_jffs2_mount_success=false
pi_failsafe_net_message=false

boot_run_hook preinit_main

ulimit -Hn 50000
ulimit -Sn 50000

#
