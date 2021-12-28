https://openwrt.org/toh/views/toh_available_16128
https://openwrt.org/toh/views/toh_fwdownload

https://openwrt.org/toh/start
https://openwrt.org/toh/xiaomi/miwifi_mini
https://openwrt.org/toh/hwdata/xiaomi/xiaomi_mini_v1

https://www.cnblogs.com/HGNET/p/14697980.html
https://www.bilibili.com/read/cv11321
https://www.right.com.cn/forum/thread-161906-1-1.html
https://www.right.com.cn/forum/thread-4041386-1-1.html
https://www.jianshu.com/p/646c98a0a1b4

https://www.right.com.cn/forum/thread-722823-1-1.html
https://www.right.com.cn/forum/forum.php?mod=viewthread&tid=4007071&extra=page%3D10%26filter%3Dauthor%26orderby%3Ddateline
https://www.right.com.cn/forum/thread-3856313-1-1.html
https://www.right.com.cn/forum/thread-4003205-1-1.html

#编译
https://www.right.com.cn/forum/thread-324501-1-1.html

【文件说明】
backup文件夹>full.bin是首次刷机后备份的编程器固件备份
backup文件夹>eeprom.bin


用户名:root
root密码:f20589b0
#小米路由器mini密码，对应backup下full.bin超级用户密码，只要breed刷上了，救砖就靠这个，亲身体验过了.疯狂作死n次都救回来了，你见过uboot启动乱码吗，我见过，但没关系，我还是救回来了

##################################################
https://www1.miwifi.com/miwifi_faq.html
指示灯的不同颜色分别代表什么意思？
可根据指示灯的颜色和是否闪烁来判断路由器状态：

蓝灯亮：系统正常运行，uboot刷机成功。
蓝灯闪烁：系统有新版本可更新。

黄灯亮：Boot启动中，系统启动中，路由器reset。
黄灯闪烁：硬盘格式化，修复硬盘状态，uboot刷机状态。

红灯亮：系统崩溃，uboot刷机失败。
红灯闪烁：进入小系统模式或者恢复系统模式。
###################################################

root@XiaoQiang: cat /proc/mtd
mtd0:ALL
mtd1:Bootloader
mtd2:Config
mtd3:Factory
mtd4:OS1
mtd5:rootfs
mtd6:OS2
mtd7:overlay
mtd8:crash
mtd9:reserved
mtd10:Bdata

Original boards
root@XiaoQiang:/tmp# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00010000 "ALL"
mtd1: 00030000 00010000 "Bootloader"
mtd2: 00010000 00010000 "Config"
mtd3: 00010000 00010000 "Factory"
mtd4: 00c80000 00010000 "OS1"
mtd5: 00b26e43 00010000 "rootfs"
mtd6: 00200000 00010000 "OS2"
mtd7: 00100000 00010000 "overlay"
mtd8: 00010000 00010000 "crash"
mtd9: 00010000 00010000 "reserved"
mtd10: 00010000 00010000 "Bdata"
mtd11: 00fa0000 00010000 "firmware"

“newer” boards. (My box was labeled 2015.05)
root@XiaoQiang:~# cat /proc/mtd 
dev:    size   erasesize  name
mtd0: 01000000 00010000 "ALL"
mtd1: 00030000 00010000 "Bootloader"
mtd2: 00010000 00010000 "Config"
mtd3: 00010000 00010000 "Factory"
mtd4: 00c80000 00010000 "OS1"
mtd5: 00b19a3b 00010000 "rootfs"
mtd6: 00200000 00010000 "OS2"
mtd7: 00100000 00010000 "overlay"
mtd8: 00010000 00010000 "crash"
mtd9: 00010000 00010000 "reserved"
mtd10: 00010000 00010000 "Bdata"

On this “newer” device, you write the openwrt firmware to the “OS1” partition, not the “firmware” partition as the referenced guide says.

#######中文
https://openwrt.org/zh/docs/guide-user/installation/after.installation

####救砖
https://www.right.com.cn/forum/thread-636761-1-1.html

https://www.bilibili.com/video/BV1g4411F7YN?spm_id_from=333.999.0.0
https://www.bilibili.com/video/BV1LJ411K7iK?from=search&seid=14154039526121413602&spm_id_from=333.337.0.0



###读取u盘
/extdisks/sda1/






##########################################
block-mount,挂载点
luci-app-filetransfer	--filetransfer,文件传输
luci-app-vlmcsd	--vlmcsd,kms激活
luci-app-vsftpd	vsftpd,ftp服务器
luci-app-arpbind----airbind,ip/mac绑定
routes,静态路由
luci-app-autoreboot	--自动重启
luci-app-ssr-plus	


@@@@@@@@@@@@@@@@@@@@@@
/etc/init.d/dnsmasq enable
--------------------- start
opkg update
opkg install luci luci-base luci-compat
@@@@@@@@@@@@@@@@@@@@@@

#ssr-plus
https://op.dllkids.xyz/packages/mipsel_24kc/luci-app-ssr-plus_184_all.ipk
dependency:
	dns2socks
	microsocks
	pdnsd-alt
	tcping
	shadowsocksr-libev-ssr-check
	--------------------------local
	--------------------------redir
	shadowsocksr-libev-ssr-server
naiveproxy
	redsocks2
	shadowsocks-rust-sslocal
	shadowsocks-rust-ssserver

	trojan
	v2ray-plugin

###passwall
https://op.dllkids.xyz/packages/mipsel_24kc/luci-app-passwall_4.43_all.ipk
dependency:
	dns2socks
	microsocks
	tcping
	pdnsd-alt
	shadowsocksr-libev-ssr-check
		---------------local
		----------------redir
	ipt2socks
	chinadns-ng
	simple-obfs
	trojan-plus

##################luci-app-vssr
dependency:
	shadowsocksr-libev-alt
	pdnsd-alt
	lua-maxminddb
	shadowsocksr-libev-ssr-local
	simple-obfs
	trojan
	ipt2socks
	xray-plugin
	shadowsocksr-libev-server