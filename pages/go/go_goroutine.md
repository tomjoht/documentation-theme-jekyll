---
title: Go 并发
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_goroutine.html
folder: /go
---

Go语言支持并发，我们只需要通过go关键字来开启goroutine即可；goroutine 是轻量级线程，goroutine 的调度是由 Golang 运行时进行管理的。
同一个程序中的所有 goroutine 共享同一个地址空间。

  
    语法: 
        go 函数名( 参数列表 )

    例子:
        
        func Say(s string){
            fmt.Println(s)
        }

        go Say("hello")


