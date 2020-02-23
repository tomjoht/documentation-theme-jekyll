---
title: Go 通道
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_channel.html
folder: /go
---

如果说 goroutine 是 Go语言程序的并发体的话，那么 channels 就是它们之间的通信机制。一个 channels 是一个通信机制，它可以让一个 goroutine 通过它给另一个 goroutine 发送值信息。每个 channel 都有一个特殊的类型，也就是 channels 可发送数据的类型。一个可以发送 int 类型数据的 channel 一般写为 chan int。
Go语言提倡使用通信的方法代替共享内存，当一个资源需要在 goroutine 之间共享时，通道在 goroutine 之间架起了一个管道，并提供了确保同步交换数据的机制。声明通道时，需要指定将要被共享的数据的类型。可以通过通道共享内置类型、命名类型、结构类型和引用类型的值或者指针。
Go语言中的通道（channel）是一种特殊的类型。在任何时候，同时只能有一个 goroutine 访问通道进行发送和获取数据。goroutine 间通过通道就可以通信。
通道像一个传送带或者队列，总是遵循先入先出（First In First Out）的规则，保证收发数据的顺序。


1.声明通道
  
    语法: 
        var 通道变量 chan　通道变量类型

    例子:
    　　　var ch chan int

    chan 类型的空值是 nil，声明后需要配合 make 后才能使用。
2.创建通道

    语法: 
        通道变量 = make(chan 数据类型, 缓存大小)

    例子:
    　　 var ch chan int
        ch = make(chan int, 100)

3.使用通道发送数据

    语法: 
        通道变量 <- 值

    例子:
        ch <- 10
        
    把数据往通道中发送时，如果接收方一直都没有接收，那么发送操作将持续阻塞。

4.使用通道接收数据　　　　　

    语法:
        接收变量 <- 通道变量        

    例子:
        data := ch

    * 通道的收发操作在不同的两个 goroutine 间进行。
    由于通道的数据在没有接收方处理时，数据发送方会持续阻塞，因此通道的接收必定在另外一个 goroutine 中进行。

    * 接收将持续阻塞直到发送方发送数据
    如果接收方接收时，通道中没有发送方发送数据，接收方也会发生阻塞，直到发送方发送数据为止。

    * 每次接收一个元素
    通道一次只能接收一个数据元素。

  * 阻塞式接收数据
    阻塞模式接收数据时，将接收变量作为<-操作符的左值，格式如下：
　　　data := <-ch

　　　执行该语句时将会阻塞，直到接收到数据并赋值给 data 变量。

  * 非阻塞式接收数据
    使用非阻塞方式从通道接收数据时，语句不会发生阻塞，格式如下：
　　 data, ok := <-ch

    data：表示接收到的数据。未接收到数据时，data 为通道类型的零值。
    ok：表示是否接收到数据。

    非阻塞的通道接收方法可能造成高的 CPU 占用，因此使用非常少。如果需要实现接收超时检测，可以配合 select 和计时器 channel 进行，可以参见后面的内容。

  * 接收任意数据，忽略接收的数据
    阻塞接收数据后，忽略从通道返回的数据，格式如下：
    <-ch

    执行该语句时将会发生阻塞，直到接收到数据，但接收到的数据会被忽略。这个方式实际上只是通过通道在 goroutine 间阻塞收发实现并发同步。

  * 循环接收
    通道的数据接收可以借用 for range 语句进行多个元素的接收操作，格式如下：
    for data := range ch {

    }
    
    通道 ch 是可以进行遍历的，遍历的结果就是接收到的数据。数据类型就是通道的数据类型。通过 for 遍历获得的变量只有一个，即上面例子中的 data。


