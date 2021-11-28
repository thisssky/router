https://openwrt.org/toh/views/toh_available_16128
https://openwrt.org/toh/views/toh_fwdownload


https://openwrt.org/toh/start
https://openwrt.org/toh/xiaomi/miwifi_mini
https://openwrt.org/toh/hwdata/xiaomi/xiaomi_mini_v1


https://www.cnblogs.com/HGNET/p/14697980.html
https://www.bilibili.com/read/cv11321634/

#编译
https://www.right.com.cn/forum/thread-324501-1-1.html

#小米路由器mini密码，对应backup下full.bin超级用户密码，只要breed刷上了，救砖就靠这个，亲身体验过了
root密码:f20589b0


https://www1.miwifi.com/miwifi_faq.html
指示灯的不同颜色分别代表什么意思？
可根据指示灯的颜色和是否闪烁来判断路由器状态：
蓝灯亮：系统正常运行，uboot刷机成功。
蓝灯闪烁：系统有新版本可更新。

黄灯亮：Boot启动中，系统启动中，路由器reset。
黄灯闪烁：硬盘格式化，修复硬盘状态，uboot刷机状态。

红灯亮：系统崩溃，uboot刷机失败。
红灯闪烁：进入小系统模式或者恢复系统模式。

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
