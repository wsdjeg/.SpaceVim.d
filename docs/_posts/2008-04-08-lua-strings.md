---
layout: post
title: "Lua 字符串"
categories: 学习笔记
tags: lua
author: 王世东
---

* content
{:toc}

字符串或串(String)是由数字、字母、下划线组成的一串字符。

Lua 语言中字符串可以使用以下三种方式来表示：

- 单引号间的一串字符。
- 双引号间的一串字符。
- [[和]]间的一串字符。

以上三种方式的字符串实例如下：

```lua
string1 = "Hello"
print("\"字符串 1 是\"", string1)
string2 = 'lua'
print("字符串 2 是", string2)


string3 = [["Lua 教程"]]
print("字符串 3 是", string3)
```

以上代码执行输出结果为：

```
"字符串 1 是"	Hello
字符串 2 是	lua
字符串 3 是	"Lua 教程"
```

转义字符用于表示不能直接显示的字符，比如后退键，回车键，等。如在字符串转换双引号可以使用 "\""。

所有的转义字符和所对应的意义：

| 转义字符     | 意义                                 | ASCII 码值（十进制） |
| ------------ | ------------------------------------ | -------------------- |
| \a           | 响铃(BEL)                            | 007                  |
| \b           | 退格(BS) ，将当前位置移到前一列      | 008                  |
| \f           | 换页(FF)，将当前位置移到下页开头     | 012                  |
| \n           | 换行(LF) ，将当前位置移到下一行开头  | 010                  |
| \r           | 回车(CR) ，将当前位置移到本行开头    | 013                  |
| \t           | 水平制表(HT) （跳到下一个 TAB 位置） | 009                  |
| \v           | 垂直制表(VT)                         | 011                  |
| \\           | 代表一个反斜线字符''\'               | 092                  |
| \'           | 代表一个单引号（撇号）字符           | 039                  |
| \"           | 代表一个双引号字符                   | 034                  |
| 空字符(NULL) | 000                                  |
| \ddd         | 1 到 3 位八进制数所代表的任意字符    | 三位八进制           |
| \xhh         | 1 到 2 位十六进制所代表的任意字符    | 二位十六进制         |

## 字符串操作

Lua 提供了很多的方法来支持字符串的操作：

字符串大小写转换

以下实例演示了如何对字符串大小写进行转换：

```lua
string1 = "Lua";
print(string.upper(string1))
print(string.lower(string1))
```

以上代码执行结果为：

```
LUA
lua
```

字符串查找与反转

以下实例演示了如何对字符串进行查找与反转操作：

```lua
string = "Lua Tutorial"
-- 查找字符串
print(string.find(string,"Tutorial"))
reversedString = string.reverse(string)
print("新字符串为",reversedString)
```

以上代码执行结果为：

```
5    12
新字符串为   lairotuT auL
```

字符串格式化

以下实例演示了如何对字符串进行格式化操作：

```lua
string1 = "Lua"
string2 = "Tutorial"
number1 = 10
number2 = 20
-- 基本字符串格式化
print(string.format("基本格式化 %s %s",string1,string2))
-- 日期格式化
date = 2; month = 1; year = 2014
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year))
-- 十进制格式化
print(string.format("%.4f",1/3))
```

以上代码执行结果为：

```
基本格式化 Lua Tutorial
日期格式化 02/01/2014
0.3333
```

字符与整数相互转换

以下实例演示了字符与整数相互转换：

```lua
-- 字符转换
-- 转换第一个字符
print(string.byte("Lua"))
-- 转换第三个字符
print(string.byte("Lua",3))
-- 转换末尾第一个字符
print(string.byte("Lua",-1))
-- 第二个字符
print(string.byte("Lua",2))
-- 转换末尾第二个字符
print(string.byte("Lua",-2))


-- 整数 ASCII 码转换为字符
print(string.char(97))
```

以上代码执行结果为：

```
76
97
97
117
117
a
```

其他常用函数

以下实例演示了其他字符串操作，如计算字符串长度，字符串连接，字符串复制等：

```lua
string1 = "wsdjeg."
string2 = "spacevim"
string3 = ".org"
-- 使用 .. 进行字符串连接
print("连接字符串",string1..string2..string3)


-- 字符串长度
print("字符串长度 ",string.len(string2))


-- 字符串复制 2 次
repeatedString = string.rep(string2,2)
print(repeatedString)
```

以上代码执行结果为：

```
连接字符串	wsdjeg.spacevim.org
字符串长度 	8
spacevimspacevim
```

## 字符串操作

Lua 提供了很多的方法来支持字符串的操作：

### string.upper

字符串全部转为大写字母。

```
string.upper(argument)
```


示例：

```lua
str1 = "wsdjeg"
print(string.upper(str1))
```

输出：

```
WSDJEG
```


