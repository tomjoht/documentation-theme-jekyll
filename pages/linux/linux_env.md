---
title: Linux 环境变量
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: linux_env.html
folder: /linux
---

Linux环境变量分为全局环境变量和局部环境变量；全局变量不仅对shell会话可见，对所有shell创建的子进程也可见；局部环境变量仅对创建它们的shell可见。

1.查看环境变量
  
* 查看全局环境    
  $ env
  或
  $ printenv

* 查看局部环境

  Linux没有一个命令只显示局部环境变量，set命令会显示为某个特定进程设置的所有环境变量。
  
  $ set

* 查看具体环境变量
  
  用echo命令可以查看单个环境变量的值。
  
  $ echo $HOME

2.设置环境变量

* 设置全局环境变量    
  
  创建全局变量环境变量的方法是先创建一个局部环境变量，然后再把它导出到全局环境变量中。这个过程用export命令来完成，这种方式修改的变量是临时的。
  
  $ test=testing

  $ export echo  
  
* 设置局部环境
  
  局部环境变量推荐使用小写字母；
  如果要给变量赋一个含有空格的字符串值，必须用单引号界定字符串的开始和末尾；
  在环境变量名、等号和值之间没有空格。
  
  示例：
  　　　$ test=testing
       $ echo $test
         testing
       $ test='testing is a long string'  

3.永久修改环境变量

当你登录Linux系统时，bash shell会作为登录shell启动。登录shell会从４个不同的启动文件里读取命令。

  * /etc/profile
  * $HOME/.bash_profile
  * $HOME/.bash_login
  * $HOME/.profile 
  
/etc/profile文件是系统上默认的bash shell的主启动文件。系统上的每个用户登录时都会执行这个启动文件。另外３个启动文件是用户专有的，所以可根据每个用户的具体需求定制。

* 永久修改系统全局环境变量 
  
  这种方式对所有用户有效

  $ sudo vim /etc/profile  
    在文件末尾添加 export GOPATH=/home/simple/go  
    然后保存文件  
    立即生效，输入以下命令；需要系统重启后才能永久生效  
  $ source /etc/profile 

* 永久修改用户全局环境变量    
  其他３个文件只对某个用户有效。  

