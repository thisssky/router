##教程

https://www.right.com.cn/forum/thread-2531606-1-1.html

https://imgki.com/archives/openwrt-lean.html

https://post.smzdm.com/p/25404/

https://www.right.com.cn/forum/thread-190778-1-1.html

http://www.hqyman.cn/post/505.html

https://www.shintaku.top/posts/ttl/

https://breed.hackpascal.net/

https://www.right.com.cn/forum/forum.php?mod=viewthread&tid=313543

路由器ssh密码：dfc643

1.刷breed

[breed](https://www.right.com.cn/forum/thread-161906-1-1.html)是hackpascal独立开发的一个全新的 Bootloader。DW22D路由器对应的版本是[breed-mt7620-reset13.bin](https://breed.hackpascal.net/breed-mt7620-reset13.bin)。



http://192.168.10.1/upgrade.html

password:d5e9c96b7cc440eb0153234f284b38c3

![智能路由芯片介绍：[1]MT7620A](https://exp-picture.cdn.bcebos.com/a48bc2e8904800fcebc3ffbdd42043715edb938b.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1)

MediaTek  mt7620a

![img](https://wkbjcloudbos.bdimg.com/v1/docconvert9053/wk/de991a97ae3c744543adc1ad4d7b6f14/0.png?responseContentType=image%2Fpng&responseCacheControl=max-age%3D3888000&responseExpires=Wed%2C%2009%20Sep%202020%2001%3A04%3A38%20%2B0800&authorization=bce-auth-v1%2Ffa1126e91489401fa7cc85045ce7179e%2F2020-07-25T17%3A04%3A38Z%2F3600%2Fhost%2F5f233edb80921b31690eace5768451cb3a856bb04a06713398e45fe4ae2cc665&x-bce-range=83013-235217&token=eyJ0eXAiOiJKSVQiLCJ2ZXIiOiIxLjAiLCJhbGciOiJIUzI1NiIsImV4cCI6MTU5NTcwMDI3OCwidXJpIjp0cnVlLCJwYXJhbXMiOlsicmVzcG9uc2VDb250ZW50VHlwZSIsInJlc3BvbnNlQ2FjaGVDb250cm9sIiwicmVzcG9uc2VFeHBpcmVzIiwieC1iY2UtcmFuZ2UiXX0%3D.P3ET0MCDnGG9pq0OXB0YZJdTTZ7VF5g6alABIjyHpU8%3D.1595700278)

mt7610en

MT7610EN是一款高度集成的Wi-Fi单芯片，支持433MbpsPHY速率。符合IEEE802.11ac规范草案，提供功能丰富的无线连接和可靠远距离吞吐量。

优化的RF架构和基带算法提供了卓越的性能和低功耗。MT7610EN集成PA/LNA，使外部组件的数量减少到最小。智能MAC设计采用高效的DMA引擎和硬件数据处理加速器来卸载主机处理器。

[MT7610en](http://bbs.16rd.com/thread-474669-1-1.html)的设计是为了支持安全、服务质量和国际法规等领域基于标准的功能，使最终用户在任何时间和任何情况下都能获得最大的性能。



MT7620A + MT7610E Wi-Fi路由器同时支持最新的1T1R 802.11ac (433Mbps) 及2T2R 802.11n (300Mbps) 标准，可让用户轻松建立总传输速度高达733Mbps的同步双频家庭无线网络环境，使信息、语音及高画质影音传输各走各的频段而不互相干扰，带来最佳的用户体验。MT7610U USB及MT7610E PCIe 单芯片解决方案则适用于移动及嵌入式装置。联发科技特别在2012台北国际电脑展期间对客户抢先推出最新的Wi-Fi 无线网络技术与解决方案。

| #    | Brand    | [Model] | [Version] | [Supported Current Release]                     | [CPU]                         | [Target_target](https://openwrt.org/toh/views/toh_packagedownload?datasrt=target) | [Subtarget](https://openwrt.org/toh/views/toh_packagedownload?datasrt=subtarget) | [Package download](https://openwrt.org/toh/views/toh_packagedownload?datasrt=package architecture) | [Device Techdata_pageid](https://openwrt.org/toh/views/toh_packagedownload?datasrt=device techdata) |
| :--- | :------- | :------ | :-------- | :---------------------------------------------- | :---------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| 473  | DomyWifi | DW33D   |           | [18.06.8](https://openwrt.org/releases/18.06.8) | Qualcomm Atheros QCA9558-AT4A | [ar71xx-ath79](https://openwrt.org/docs/techref/targets/ar71xx-ath79) | nand                                                         | [mips_24kc](https://openwrt.org/docs/techref/instructionset/mips_24kc) | [View/Edit data](https://openwrt.org/toh/hwdata/domywifi/domywifi_dw33d) |







1.

123 | echo 6c216b27c8c9b051106c969e2077d4e9 > /ezwrt/bin/upgrade_passwd 

2.

123 | echo ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA2tA3frFlnGsWmZeJMQuTzELWSplJN27FwXvVjan70bxnWSUvbGNV2rWD3zZo9jKoW5XmnZm46XCanWae8+LdIAk2HMG+IscjBCjfQBSHet0j2ODOt/WWOyMB67p5HGpa63kaWi4uT+ikB+xhNLRFOAxkHpnOpdnhFdU05mJ2GucEO3WEXeXnOaktJcFTcETC2VwbRPIzClsY9hero+3wNQS5CC0fU9r3J+XHqB+j8U/4wgIBBu5sflrwSofpS+g9a4vt+qJrqeXgDtz3SjxLUN2i5K6B0AxjxnC+R6a3+rtPPA3XEafaw7G58NjfnKOCu1A82gc3PhtdH60yzIPMGQ== dm > /etc/dropbear/authorized_keys 

2.改成自己的公钥

ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmavYNZq5oC5lzN1VCXCTR/wnkGKse+AMWJGjUplAv+IVIrnEM9uQftzLZ6QaZ8L70ABQba4m5Bs6AD6kJfZQnZIEziVbVV9BvX0y4SPL53vXeDW4iUJtUE7v3twpmoWPrxbciXoe8FfaAUT9eyMN2g5L/JCLnVovI60m9sAgFvjNm0jqJxYCUCxovRwGyO8A44vQclAwX8iY5FwJuPn419QGPwBVmX5PqcW1uABBReq/ob/3m5bnQZPjhFhEo/F2AquaVQDsHRoqx3YFXDde4i1WutWMJ1peq+rS1axT01Elm8ELaC0lvfzxkanYON3FCRMUM2p4CNIVj19tgMC+aQ== rsa-key-20200727-dw22d

123 | echo ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAmavYNZq5oC5lzN1VCXCTR/wnkGKse+AMWJGjUplAv+IVIrnEM9uQftzLZ6QaZ8L70ABQba4m5Bs6AD6kJfZQnZIEziVbVV9BvX0y4SPL53vXeDW4iUJtUE7v3twpmoWPrxbciXoe8FfaAUT9eyMN2g5L/JCLnVovI60m9sAgFvjNm0jqJxYCUCxovRwGyO8A44vQclAwX8iY5FwJuPn419QGPwBVmX5PqcW1uABBReq/ob/3m5bnQZPjhFhEo/F2AquaVQDsHRoqx3YFXDde4i1WutWMJ1peq+rS1axT01Elm8ELaC0lvfzxkanYON3FCRMUM2p4CNIVj19tgMC+aQ== rsa-key-20200727-dw22d dm > /etc/dropbear/authorized_keys 



3.打开http://192.168.10.1/upgrade.html，在升级里上传你要刷的固件，并且改个容易拼写的名字比如 fw.bin (openwrt系统)或者 fw.trx (padavan系统)，密码处填写 password | mtd -x mIp2osnRG3qZGdIlQPh1 -r write /tmp/fw.trx firmware

然后等个两分钟机子刷好了会自动重启，中间什么也不用做，重启后就已经是你要刷的系统了
唯一要注意的就是固件的名字(比如fw.trx)和最后在密码栏输入的指令里/tmp/后面的名字要一样
3.1刷breed就上传breed.bin，breed-mt7620-reset13.bin

password | mtd -x mIp2osnRG3qZGdIlQPh1 -r write /tmp/breed-mt7620-reset13.bin Bootloader 