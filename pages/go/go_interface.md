---
title: Go 接口
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_interface.html
folder: /go
---


1.接口定义
  
    格式: 
        type 接口名称　interface{
            函数名称(形参列表)返回值列表
            ...
        }

    例子:
        package alg

        import "fmt"

        type Appliances interface {
            Open()
            Close()
        }

        type Phone struct {
            name string
        }

        func (p Phone) Open() {
            fmt.Println(p.name, "开启")
        }

        func (p Phone) Close() {
            fmt.Println(p.name, "关闭")
        }

        type Computer struct {
            name string
        }

        func (p Computer) Open() {
            fmt.Println(p.name, "开启")
        }

        func (p Computer) Close() {
            fmt.Println(p.name, "关闭")
        }

        func OpAppliances(a Appliances) {
            a.Open()
            a.Close()
        }

        func TestIF() {
            var p Phone = Phone{"苹果"}
            var c Computer = Computer{"华为"}

            OpAppliances(p)
            OpAppliances(c)
        }

    



