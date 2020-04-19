#实验报告3

##软件环境：
Ubuntu 18.04 Server 64bit

##实验要求：
按照所给教程进行System入门操作，并将操作过程用asciinema进行录屏并上传，文档通过github提交。

完成自查报告


##实验录像：

###命令篇:
第1-3节：
 https://asciinema.org/a/AO3Nv860CmK2aol82Jzr0OrcL

第4节：
https://asciinema.org/a/PB4vZNQBptpz3U0HVn46VIuiB

第5-6节：
https://asciinema.org/a/aAPQ6GKx52NAZh5yHow6Mg4vM

第7节：
https://asciinema.org/a/aoY7pZdQ9TZ3XZeziUHpWE781

实战篇：
第1-3节https://asciinema.org/a/iotfHnXDbxMaCFnJCElDmQuWN
第4-9节：https://asciinema.org/a/5oDrs4agQERNQluxDKiXONNDh


##自查目录：

如何添加一个用户并使其具备sudo执行程序的权限？

sudo adduser username

sudo usermod -a -G sudo username


如何将一个用户添加到一个用户组？

usermod -a -G groupname username


如何查看当前系统的分区表和文件系统详细信息？

df -h//查看文件系统详细信息

sudo fdisk -l //查看当前系统分区表

sudo fadisk /dev/sda //查看sda磁盘设备的分区



如何实现开机自动挂载Virtualbox的共享目录分区？

首先在虚拟机设置-共享文件夹-右上角添加共享文件夹-勾选自动挂载和固定分配

在虚拟机上创建共享目录： eg:mkdir /mnt/share

实现挂载 :      mount -t vboxsf java /mnt/share 

基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？

扩容：
lvreduce -L -size /dev/vgtest/lvtest

缩减容量：
lvreduce -L -size /dev/vgqjc/lvqjc



如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？


在/user/lib/system/system设置在网络联通时运行指定脚本的配置文件

[unit]
Description=run after network up
after=network.target network-online.target

[service]
ExecStart=scrip_1

[Install]
...

在/user/lib/systemd/system设置在断网时运行脚本如下：

[unit]
Description=run before network up
before=network.target network-online.target

[service]
ExecStart=scrip-2

[Install]
...

重新加载配置文件：
sudo systemctl daemon-reload


如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

在/user/lib/systemd/system设置以下文件：


[service]
...
Restart=always

重新加载配置文件：
sudo systemctl daemon-reload

##参考文件：
[VirtualBox 共享文件夹设置 及 开机自动挂载]:
https://blog.csdn.net/ysh198554/article/details/73335844
[inux LVM逻辑卷的创建,扩容，缩减和删除]
https://blog.csdn.net/qq_27281257/article/details/81603410
