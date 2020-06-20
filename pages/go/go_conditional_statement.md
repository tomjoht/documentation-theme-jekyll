---
title: Go条件语句
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: ""
sidebar: mydoc_sidebar
permalink: go_conditional_statement.html
folder: /go
---



1.　if语句
  
    语法: 
        if 布尔表达式{
            //执行语句
        }

    例子:
        var a int = 10 
        if a < 20{
            fmt.Printf("a 小于 20")
        }
    

    语法: 
        if 布尔表达式{
            //布尔表达式为true时执行
        }else{
            //布尔表达式为false时执行
        }

    例子:
        var a int = 10 
        if a < 20{
            fmt.Printf("a 小于 20")
        }else{
            fmt.Printf("a 小于 20")
        }    


2.　switch语句

    语法: 
        switch var1 {
            case val1:
                ...
            case val2:
                ...
            default:
                ...
        }

    例子:
        var grade string = "B"
        var marks int = 90

        switch marks {
            case 90: grade = "A"
            case 80: grade = "B"
            case 50,60,70 : grade = "C"
            default: grade = "D"  
        }

    注意事项：
        1. 变量 var1 可以是任何类型，而 val1 和 val2 则可以是同类型的任意值。类型不被局限于常量或整数，但必须是相同的类型；或者最终结果为相同类型的表达式。
        2. 可以同时测试多个可能符合条件的值，使用逗号分割它们，例如：case val1, val2, val3   
        3. 使用 fallthrough 会强制执行后面的 case 语句，fallthrough 不会判断下一条 case 的表达式结果是否为 true。
        ４. 不同的 case 之间不使用 break 分隔，默认只会执行一个 case。

3.　select语言

    select 语句类似于 switch 语句，但是select会随机执行一个可运行的case。如果没有case可运行，它将阻塞，直到有case可运行。

    语法: 
        select {
            case communication clause  :
            statement(s);      
            case communication clause  :
            statement(s);            
            default : /* 可选 */
            statement(s);
        }

    例子:
        var c1, c2, c3 chan int
        var i1, i2 int
        select {
            case i1 = <-c1:
                fmt.Printf("received ", i1, " from c1\n")
            case c2 <- i2:
                fmt.Printf("sent ", i2, " to c2\n")
            case i3, ok := (<-c3):  // same as: i3, ok := <-c3
                if ok {
                    fmt.Printf("received ", i3, " from c3\n")
                } else {
                    fmt.Printf("c3 is closed\n")
                }
            default:
                fmt.Printf("no communication\n")
        }
        输出: no communication

注意事项：

+ 每个 case 都必须是一个通信
+ 所有 channel 表达式都会被求值
+ 所有被发送的表达式都会被求值
+ 如果任意某个通信可以进行，它就执行，其他被忽略。
+ 如果有多个 case 都可以运行，Select 会随机公平地选出一个执行。其他不会执行。
否则： 如果有 default 子句，则执行该语句。如果没有 default 子句，select 将阻塞，直到某个通信可以运行；Go 不会重新对 channel 或值进行求值