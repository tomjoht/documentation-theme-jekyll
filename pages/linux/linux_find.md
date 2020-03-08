---
title: Linux find
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: linux_find.html
folder: /linux
---

Linux环境变量分为全局环境变量和局部环境变量；

1. find
  
   语法：    
  　   find [option] [path...] [expression]

   * -name 文件名,支持正则表达式  
   * -type 文件类型  
      d: 目录  
      c: 字型装置文件  
      b: 区块装置文件  
      p: 具名贮列  
      f: 一般文件  
      l: 符号连结  

   示例:  
        $ find / -name test.txt -type f


2. grep
  
   语法：    
  　   grep [OPTION]... PATTERNS [FILE]...

   * -i 忽略大小写  
   * -type 文件类型     
     
   示例:  
        $ grep -i 'hello world' menu.h

3. xargs
  
   语法：    
  　   xargs [OPTION]... COMMAND [INITIAL-ARGS]...
     
   示例:  
        $ xargs ls -l
        $ find . -type f -name "*.log" -print0 | xargs -0 rm -f

4. locate
  
   locate命令其实是"find -name"的另一种写法，但是要比后者快得多，原因在于它不搜索具体目录，而是搜索一个数据库（/var/lib/locatedb），这个数据库中含有本地所有文件信息。Linux系统自动创建这个数据库，并且每天自动更新一次，所以使用locate命令查不到最新变动过的文件。为了避免这种情况，可以在使用locate之前，先使用updatedb命令，手动更新数据库。

   语法：    
  　   locate [OPTION]... [PATTERN]...
     
   示例:  
        $ locate /etc/sh
        
        搜索etc目录下所有以sh开头的文件

5. whereis
  
   whereis命令只能用于程序名的搜索，而且只搜索二进制文件（参数-b）、man说明文件（参数-m）和源代码文件（参数-s）。如果省略参数，则返回所有信息。

   语法：    
  　   whereis [options] [-BMS <dir>... -f] <name>
     
   示例:  
        $ whereis qgis
        
6. which
  
   which命令的作用是，在PATH变量指定的路径中，搜索某个系统命令的位置，并且返回第一个搜索结果。也就是说，使用which命令，就可以看到某个系统命令是否存在，以及执行的到底是哪一个位置的命令。

     

