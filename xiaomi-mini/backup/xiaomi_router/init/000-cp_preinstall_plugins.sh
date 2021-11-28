#!/bin/sh /etc/rc.common
# Copyright (C) 2014-2014 jiayuehua

START=51
STOP=
SOURCE_PATH=$1/xiaomi_router/config/appdataPreinstallPlugins
DEST_PATH=$1/xiaomi_router/appdata
USB_DEPLOY_ROOT_PATH=$1

. $SOURCE_PATH/cp_preinstall_plugins_impl.sh

