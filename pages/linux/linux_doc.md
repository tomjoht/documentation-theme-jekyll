---
title: Linux 环境变量
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: linux_doc.html
folder: /linux
---

1. Linux常用目录
  
   * /        虚拟目录的根目录，通常不会在这里存储文件　　    
   * /bin     二进制目录，存放许多GNU用户级的工具　　
   * /boot    启动目录，存放启动文件　　
   * /dev     设备目录，Linux在这里创建设备节点  
   * /etc     系统配置文件目录  
   * /home    主目录，Linux在这里创建用户目录  
   * /lib     库目录，存放系统和应用程序的库文件  
   * /media   媒体目录，存放可移动媒体设备挂载点的地方
   * /mnt     挂载目录，另一个存放可移动媒体设备挂载点的地方  
   * /opt     可选目录，通常用于存放可选的软件包
   * /root    根主目录  
   * /sbin    系统二进制目录，存放许多GNU管理员级工具
   * /tmp     临时目录，可以在该目录中创建和删除临时工作文件
   * /usr     用户安装软件的目录
   * /var     可变目录，用以存放经常变化的文件，比如日志文件　　

2. cd　遍历目录

语法：  
    cd [option] [dir]

3. ls　列表  

语法：  
    ls [option]... [file]...

* -a, --all 显示所有文件  
* -A 显示所有文件，但不包括.和..  
* -l 用长列表模式  
* -R, --recursive 递归遍历子文件夹  
  
4. touch　创建文件

  语法：  
      　touch [option]... [file]...  

5. touch　创建文件

　　语法：  
    　　touch [option]... [file]...  
