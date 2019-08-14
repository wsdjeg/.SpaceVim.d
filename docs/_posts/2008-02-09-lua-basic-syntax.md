---
layout: post
title: "Lua 基本语法"
categories: 学习笔记
tags: lua
author: 王世东
---

* content
{:toc}

Lua 提供了交互式编程模式和脚本式编程模式，交互式编程模式可以在命令行中直接输入代码并查看结果。
Lua 的交互式编程可通过 `lua -i` 或者 `lua` 命令开启。

```
F:\languages>lua
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
>
```

在命令行中，输入以下命令:

```
> print("hello world!")
```

按下回车后可以看到执行结果如下：

```
> print("hello world!")
hello world!
>
```

脚本式编程，指的是，将代码写入文件后并执行，比如新建 hello.lua 文件，并写入以下内容：

```lua
print("hello world!")
```

使用 lua 执行以上脚本，输出结果为：

```
F:\languages\lua>lua hello.lua
hello world!
```

我们也可以在 lua 文件顶部添加执行命令，比如，添加

```
#!/usr/local/bin/lua
print("hello world!")
```

然后通过 `./hello.lua` 的方式来执行。

## 注释

Lua 的注释分单行注释和多行注释，单行注释以两个减号开头

```lua
-- 这是一个单行注释
print("hello world!")
```

多行注释在段落前后分别有 `--[[` 和 `--]]`。

```lua
--[[
这是一个多行注释
这是一个多行注释
--]]
print("hello world!")
```

## 标识符

Lua 标识符用于定义一个变量、函数的名称。标示符以一个字母 A 到 Z 或 a 到 z 或下划线 \_ 开头后加上 0 个或多个字母，下划线，数字（0 到 9）。

最好不要使用下划线加大写字母的标示符，因为 Lua 的保留字也是这样的。

Lua 不允许使用特殊字符如 @, \$, 和 % 来定义标示符。

Lua 是一个区分大小写的编程语言。因此在 Lua 中 W3c 与 w3c 是两个不同的标示符。

以下列出了一些正确的标示符：

```
mohd         zara      abc     move_name    a_123
myname50     _temp     j       a23b9        retVal
```

## 关键词

Lua 本身一些保留的关键字是不可以使用的，比如循环用到的 for while 等。

以下列出了 Lua 的保留关键字。保留关键字不能作为常量或变量或其他用户自定义标示符：

```
| and      | break | do    | else   |
| elseif   | end   | false | for    |
| function | if    | in    | local  |
| nil      | not   | or    | repeat |
| return   | then  | true  | until  |
| while    |
```

## 全局变量

Lua 的默认情况下变量总是全局变量，全局变量也不需要声明，直接赋值即可，访问一个未赋值即不存在的全局变量，
也不会报错，只不过得到的是：nil

```
> print(b)
nil
> b=10
> print(b)
10
>
```

如果你想删除一个全局变量，只需要将变量赋值为 nil。

```
> b = nil
> print(b)
nil
```

这样变量 b 就好像从没被使用过一样。换句话说, 当且仅当一个变量不等于 nil 时，这个变量即存在。
