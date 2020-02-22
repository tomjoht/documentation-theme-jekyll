---
title: Go变量
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_variable.html
folder: /go
---

Go语言变量名由字母、数字、下划线组成，其中首个字符不能为数字。声明变量的一般形式是使用 var 关键字。
Go变量的声明有以下几种方式：

1.指定变量类型，如果没有初始化，则变量默认为零值。
  
    格式: 
        var 变量名　变量类型

    例子:

    var b int

2.根据值自动判断类型。

    格式: 
        var 变量名 = 变量值

    例子:

    var b = true

3.省略var，用:=，每次需要声明新变量

    格式: 
       变量名 := 变量值

    例子:

    newValue := 1
    v1, v2 := 1, 2 
    
4.多变量声明　　　　　

    格式:
        var 变量名１，变量名２　变量类型
        var 变量名１，变量名２ = 变量１，变量２
        变量１，变量２ := 变量１，变量２

    例子:

    var v1, v2 int
    var v1, v2 = 10, "test"
    v1, v2 := 10, "test"

空白标识符_被用于抛弃值，如值５在_,b = 5, 7中被抛弃。

