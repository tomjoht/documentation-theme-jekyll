---
title: Go map
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: go_map.html
folder: /go
---

   map类型是一种无序键值对的集合，map是使用hash表来实现的。

1.定义map
  
    语法: 
        var 变量名　map[key变量类型]value变量类型
            变量名　mp := make(map[key变量类型]value变量类型)

    例子:
        var mp map[string]string
        mp := make(map[string]string)

2.添加和修改元素

    var mp = map[int]string{
        1:"001",
        2:"002",
    }
    mp[3] = "003"
    mp[1] = "100"


3.查找元素

    var mp = map[int]string{
        1:"001",
        2:"002",
    }

    v1, exist := mp[1]
    //exist为true,表示存在该元素

    v2, exist2 := mp[３]
    //exist为false,表示不存在该元素

4.删除元素

    var mp = map[int]string{
        1:"001",
        2:"002",
    }

    delete(mp, 1)

5.map是引用类型
    
    package main

    import (
        "fmt"
    )      
    
    func ChangeMap(mp map[int]string) {
        mp[5] = "005"
        mp[6] = "006"
    }

    func main() {

        var mp = map[int]string{
            1: "001",
            2: "002",
            3: "003",
        }

        ChangeMap(mp)

        for k, v := range mp {
            fmt.Println("key:", k, "value:", v)
        }
    }

    输出：
        key: 1 value: 001
        key: 2 value: 002
        key: 3 value: 003
        key: 5 value: 005
        key: 6 value: 006



