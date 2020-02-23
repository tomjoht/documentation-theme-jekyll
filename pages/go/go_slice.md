---
title: Go切片
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_slice.html
folder: /go
---

Go切片是变长数组

1. 定义切片
      
    语法:

        var 变量名 [] 变量类型
        var 变量名 [] 变量类型 = make([]变量类型, 数组长度[, 数组容量])
            变量名 := make([]变量类型, 数组长度[, 数组容量])

    例子:
        var arr [] int
        var s1 [] int = make([]int, 10, 20)
            sl := make([]int, 10)


2. 切片操作
      
   * 获取切片长度和容量  
    　len()获取切片长度;cap()获取切片容量

   * 切片截取
     numbers := []int{0,1,2,3,4,5,6,7,8}
     arr := numbers[1:5]

   * 追加元素
     append()追加元素，copy()复制元素
     var num []int

     //追加空切片
     num = append(num, 0)

     //追加多个元素
     num = append(num, 1, 2, 3)

     //复制元素
     num1 := make([]int, 20)
     copy(num1, num)





