---
title: Go循环
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_loop.html
folder: /go
---


1. for语句
  
    语法: 
        for init; condition; post { }

    例子:

        sum := 0
        for i := 0; i <= 10; i++ {
                sum += i
        }


2. break语句
      
    使用场景：
        * 用于循环语句中跳出循环，并开始执行循环之后的语句
        * break 在 switch（开关语句）中在执行一条 case 后跳出语句的作用
        * 在多重循环中，可以用标号 label 标出想 break 的循环。

    例子:

        package main

        import (
            "fmt"
        )

        func main() {	
            
            fmt.Println("---- break label ----")
        re:
            for i := 1; i <= 3; i++ {
                fmt.Printf("i: %d\n", i)
                for i2 := 11; i2 <= 13; i2++ {
                    fmt.Printf("i2: %d\n", i2)
                    break re
                }
            }
            //break执行完后，开始执行下面的语句
            j := 0
            fmt.Println(j)
        }


３. continue语句
  
    使用场景：
        * for循环中，continue终止本次循环，开始下次循环。        
        * 在多重循环中，可以用标号label标出想continue的循环。

    例子:

        package main

        import (
            "fmt"
        )

        func TestContinue() {

            fmt.Println("---- continue label ----")
        re:
            for i := 1; i <= 3; i++ {
                fmt.Printf("i: %d\n", i)
                for i2 := 11; i2 <= 13; i2++ {
                    fmt.Printf("i2: %d\n", i2)
                    continue re
                    //执行到此处开始执行下一次循环
                }
            }
        }

        func main() {
            TestContinue()
        }