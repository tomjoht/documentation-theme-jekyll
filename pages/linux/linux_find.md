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



