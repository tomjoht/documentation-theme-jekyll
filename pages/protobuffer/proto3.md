---
title: Language Guide(proto3)
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: proto3.html
folder: /protobuffer
---

Protobuffer是语言中立、平台中立、可扩展的结构化数据序列化协议，由谷歌公司开发。Protobuffer主要用于通讯协议和数据序列化。

1. 定义消息 
  
  syntax = "proto3";

  message SearchRequest {
    string query = 1;
    int32 page_number = 2;
    int32 result_per_page = 3;
  }

  * 第一行表示使用proto3语法，如果不这么定义，默认使用proto2语法；第一行必须这么写
  * SearchRequest有３个字段（名称/值对），每个字段包含一个名称和一个类型
    
2. 自定义字段类型  
   上面的例子中所有字段都是原生类型，但是可以定义自己的数据类型，包括枚举和其他消息类型

3. 分配编号  
   在proto消息里，每一个字段都有一个唯一的编号。编号用来在消息二进制格式里标识字段，并且一旦确定不能更改。需要注意的是，１到15范围内的编号
占用一个自己进行编码，包括编号和字段数据类型。16到2047范围的编号站２个字节。所以应该保留１到15的编号用于频繁使用的消息字段。
   可以指定的最小的编号是１，最大的编号是536870911。不能使用19000到19999的编号，这些编号是为pb保留的。

4. 指定字段规则  
   消息规则可以是以下类型:
   * singular: 该字段可以有0或１个，不能超过１个。这是proto3语法默认的规则。
   * repeated: 该字段可以重复任意多次（包括０次）。   
  
5. 添加更多消息类型  
   可以在同一个proto文件定义多种消息类型

6. 添加注释  
   可以添加单行注释//和多行注释/*...*/

   /* SearchRequest represents a search query, with pagination options to
      indicate which results to include in the response. */

      message SearchRequest {
        string query = 1;
        int32 page_number = 2;  // Which page number do we want?
        int32 result_per_page = 3;  // Number of results to return per page.
      }   

7. 保留字段  
       
8. proto文件生成了什么


9. proto数据类型

| proto  |   c++  |  java  | python |   go   | ruby   |   c#   |  php   | 　备注  |  
|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:| 
| double | double | double | float  | float64| Float  | double | float  |        |
| float  | float  | float  | float  | float32| Float  | double | float  |        | 
| int32  | int32  | int    | int    | int32  | Fixnum/Bignum | int    | integer  |        | 
| int64  | int64  | long   |int/long| int64  | Bignum | long   |integer/string|        | 
| uint32 | uint32 | int    |int/long| uint32 | Fixnum/Bignum | uint   | integer  |        | 
| uint64 | uint64 | long   |int/long| uint64 | Bignum | ulong  |integer/string|        | 
| sint32 | int32  | int    | int    | int32  | Fixnum/Bignum | int    | integer  |        |  
| sint64 | int64  | long   |int/long| int64  | Bignum | long   |integer/string|        | 
| fixed32| uint32 | int    |int/long| uint32 | Fixnum/Bignum | uint   |integer|        | 
| fixed64| uint64 | long   |int/long| uint64 | Bignum | ulong  |integer/string|        | 
|sfixed32| int32  | int    | int    | int32  | Fixnum/Bignum | int    | integer |        |
|sfixed64| int64  | long   |int/long| int64  | Bignum | long   |integer/string|        |  
| bool   | bool   | boolean| bool   | bool   |TrueClass/FalseClass|bool | boolean |        | 
| string | string | String |str/unicode| string | String |string| string |        | 
| bytes  | string |ByteString| str | []byte  | String |ByteString| string|        | 

10. 默认值
  
  解析消息时，如果不存在某个字段，该字段就被设置成默认值。  
* string 空字符串
* bytes 空bytes
* bool  false
* 数值型　0
* enums, 第一个枚举值，必须为０
* 消息类型，不定，和语言有关

11. 枚举类型   

    message SearchRequest {
      string query = 1;
      int32 page_number = 2;
      int32 result_per_page = 3;
      enum Corpus {
        UNIVERSAL = 0;
        WEB = 1;
        IMAGES = 2;
        LOCAL = 3;
        NEWS = 4;
        PRODUCTS = 5;
        VIDEO = 6;
      }
      Corpus corpus = 4;
    }

每一个枚举类型必须包含一个０值作为它的第一个元素
* 必须有一个０值，作为默认值
* 0值昨晚第一个元素，为了和proto2兼容

可以定义多个枚举值对应一个常量，设置allow_alias为true可以实现；否则就会报错。

    enum EnumAllowingAlias {
      option allow_alias = true;
      UNKNOWN = 0;
      STARTED = 1;
      RUNNING = 1;
    }
    enum EnumNotAllowingAlias {
      UNKNOWN = 0;
      STARTED = 1;
      // RUNNING = 1;  // Uncommenting this line will cause a compile error inside Google and a warning message outside.
    }


12. 保留值 



13. 使用其他消息类型 

    import "myproject/other_protos.proto";

14. 嵌套类型

    message SearchResponse {
    message Result {
      string url = 1;
      string title = 2;
      repeated string snippets = 3;
    }
    repeated Result results = 1;
  }

    message SomeOtherMessage {
      SearchResponse.Result result = 1;
    }


15. 定义服务

    service SearchService {
      rpc Search (SearchRequest) returns (SearchResponse);
    }




