#!/bin/sh
# Copyright (C) 2010-2012 OpenWrt.org

list_alldir(){  
	for file in `ls $1 | grep [^a-zA-Z]\.manifest$`  
	do  
		if [ -f $1/$file ];then
			#is_supervisord=$(grep "is_supervisord" $1/$file | cut -d'=' -f2 | cut -d'"' -f2)
			#echo "is_supervisord is $is_supervisord"
			status=$(grep -n "^status " $1/$file | cut -d'=' -f2 | cut -d'"' -f2)
			echo "status is $status"
			plugin_id=$(grep "plugin_id" $1/$file | cut -d'=' -f2 | cut -d'"' -f2)
			echo "plugin_id is $plugin_id"
			if [ "$status"x = "5"x ];then
				/usr/sbin/pluginControllor -k $plugin_id
				/usr/sbin/pluginControllor -b $plugin_id &
			fi  
		fi  
	done  
}  

$1/xiaomi_router/bin/copy_plugin_chroot_file         
/usr/sbin/pluginControllor -u
list_alldir  $1/xiaomi_router/appdata/app_infos
