---
title: Go数组
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_array.html
folder: /go
---

数组是具有相同唯一类型的一组已编号且长度固定的数据项序列，这种类型可以是任意的原始类型例如整形、字符串或者自定义类型。数组元素可以通过索引（位置）来读取（或者修改），索引从 0 开始，第一个元素索引为 0，第二个索引为 1，以此类推。

1. 声明数组
  
    语法: 
        var 变量名 [数组大小] 变量类型

    例子:
        var arr [10] int
        

2. 初始化数组
      
　　初始化数组中{}中的元素个数不能大于[]中的数字。
　　如果忽略[]中的数字不设置数组大小，Go 语言会根据元素的个数来设置数组的大小。

    例子:
        var arr = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}
        var arr = [...]float32{12.3, 3.2, 56.3, 12.3}
