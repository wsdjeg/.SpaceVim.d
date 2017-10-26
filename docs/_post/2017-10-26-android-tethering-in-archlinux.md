## Archlinux 中通过 USB 使用手机共享的网络


在酒店里面遇到一件非常尴尬的事情，酒店提供的免费无线网，我电脑无论如何都链接不上，但是手机可以正常使用。我当然可以用电脑使用手机共享的wifi，但是这样手机就无法使用免费wifi，流量不够用呀。

于是，就用手机链接免费wifi，并且通过 USB 共享给电脑使用。

首先，确保电脑可以识别手机驱动。

```sh
ip link
```

这一命令你可以看见类似于：

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp5s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether c8:60:00:b4:b6:72 brd ff:ff:ff:ff:ff:ff
3: wlp3s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN mode DORMANT group default qlen 1000
    link/ether 78:92:9c:87:27:18 brd ff:ff:ff:ff:ff:ff
6: enp0s29u1u1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether 3e:ad:a6:99:57:ef brd ff:ff:ff:ff:ff:ff
```

以上信息中，`enp0s29u1u1` 即为手机网卡名，我们可以通过 `sudo dhcpcd enp0s29u1u1` 命令链接这一 USB 共享网络。

参考 arch linux wili ： https://wiki.archlinux.org/index.php/Android_tethering
