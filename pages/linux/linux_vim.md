---
title: Vim常用命令
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: linux_vim.html
folder: /linux
---

vim常用命令　　

1. vim两种操作模式  
   vim有两种操作模式：命令模式和编辑模式。命令模式下输入i转换成编辑模式；编辑模式下输入esc转换成命令模式。

2. 创建文件  
  
  $ sudo vim test.txt

3. 保存文件　　
   命令模式下输入以下命令退出  
* q  如果未修改缓存区数据，退出
* q! 取消所有对缓存区的修改并退出
* w filename 将文件保存到另一个文件名下
* wq 将缓冲区数据保存到文件并退出

4. 编辑数据　　
    
* x   删除当前光标所在位置的字符
* dd  删除当前光标所在行
* dw  删除光标处的单词
* d$  删除当前光标至行尾的内容
* u   撤销前一编辑命令
* ndd 删除以当前行开始的n行

5. 复制　　
    
* [range]co[py] {address}   
  示例:  
     //复制9到16行内容到20  
     9,16 copy 20  
    
* [range]mo[ve] {address}   
  示例:  
     //移动9到16行内容到20
     9,16 copy 20     

* yy  复制当前行
* nyy 复制光标所在的向下n行
* 

6. 粘贴　　
    
* p  将数据粘贴到当前行的下一行
* P  将数据粘贴到当前行的上一行  

7. 查找　　
    
* /待查找内容
然后输入  
n 向下查找下一个
N 向上查找下一个

8. 替换　　
    
* [range]s/目标字符串/替换字符串/[option]  
  range字段值１,10表示从第１行到第10行
  %表示整个文件
  option表示操作类型，默认只对第一个匹配的字符进行替换
  option字段值g(global)表示全局替换
　　          c(confirm)表示操作时需要确认
             i(ignorecase)表示不区分大小写

9. 其他命令　　
    
* 0或home 移动到当前行行首
* $或end  移动到当前行行尾
* G       移动到当前文档最后一行
* nG      移动到当前文档的第n行
* gg      移动到当前文档的第一行，相当于1G
* n<Enter>光标向下移动n行   
      