---
title: Go 函数
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: ""
sidebar: mydoc_sidebar
permalink: go_function.html
folder: /go
---


1. 函数定义
  
    语法:  
        func 函数名( [参数列表] )[返回值类型]{
            函数体
        }

    例子:  

        package main

        import "fmt"

        func swap(x, y string) (string, string) {
             return y, x
        }

        func main() {
              a, b := swap("Google", "Runoob")
              fmt.Println(a, b)
        }