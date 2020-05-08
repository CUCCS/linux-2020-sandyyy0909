# 第四章 ；shell脚本编程基础 （实验）

## 环境

Virtualbox

Ubuntu 18.04 Server 64bit


## 实验问题

任务一：用bash编写一个图片批处理脚本，实现以下功能：
（完成）支持命令行参数方式使用不同功能
（完成）支持对指定目录下所有支持格式的图片文件进行批处理
（完成）支持以下常见图片批处理功能的单独使用或组合使用
（完成）支持对jpeg格式图片进行图片质量压缩
（完成）支持对jpeg/png/svg格式图片在保持原始宽高比的前提下压缩分辨率
（未完成）支持对图片批量添加自定义文本水印
（完成）支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）
（完成）支持将png/svg图片统一转换为jpg格式图片

任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
2014世界杯运动员数据
（完成）统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
（完成）统计不同场上位置的球员数量、百分比
名字最长的球员是谁？名字最短的球员是谁？
年龄最大的球员是谁？年龄最小的球员是谁？


任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：
Web服务器访问日志
（完成）统计访问来源主机TOP 100和分别对应出现的总次数
（完成）统计访问来源主机TOP 100 IP和分别对应出现的总次数
（完成）统计最频繁被访问的URL TOP 100
（完成）统计不同响应状态码的出现次数和对应百分比
（完成）分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
（完成）给定URL输出TOP 100访问来源主机

## 实验过程

任务一：
 
    安装Imagemagic
    
    sudo apt-get install imagemagic

    安装成功便可

    编写shell脚本实现功能：

【图片处理】
 
图片处理素材图片：

![处理前图片1](photo/1.png)


![处理前图片2](photo/2.jpg)


帮助信息：

![帮助信息](photo/-h实现.png)



质量压缩后的jpg图片：

![质量压缩后图片](photo/comp_2.jpg)


按比例压缩实现：
![按比例压缩实现](photo/-r实现图片.png)


按比例压缩后的图片：


![按比例压缩后的图片](photo/resi_1.png)

![按比例压缩后的图片](photo/resi_2.jpg)


批量重命名（加前缀pic）后的文件:

![加前缀](photo/pic1.png)

![加前缀](photo/pic2.jpg)


修改格式：

![改格式](photo/trans_picwor_1.jpg)
//将加前缀后的图片改变了格式



任务二：

编写shell脚本

具体得到的数据见data.txt文件





## 参考资料：

shell 批量压缩指定目录及子目录内图片的方法
https://www.jb51.net/article/110469.htm



ImageMagick之图片缩放
https://www.jianshu.com/p/9c7d53055adf




Linux 批量修改文件名(前缀或后缀)
https://www.jianshu.com/p/9c7d53055adf



shell-awk命令详解
https://blog.csdn.net/huangyimo/article/details/79952886




shell求两个数相除后的百分比
https://www.cnblogs.com/wowchky/archive/2012/10/18/2729075.html



Shell 基本运算符
https://www.runoob.com/linux/linux-shell-basic-operators.html




【shell笔记>命令|实战|转载】awk去掉重复行

https://www.jianshu.com/p/9f58e3aff5d8



linux sort 命令 指定分隔符

https://blog.csdn.net/flyqwang/article/details/38114603












