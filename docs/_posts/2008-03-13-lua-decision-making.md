---
layout: post
title: "Lua 流程控制"
categories: 学习笔记
tags: lua
author: 王世东
---

* content
{:toc}


Lua 编程语言流程控制语句通过程序设定一个或多个条件语句来设定。在条件为 true 时执行指定程序代码，在条件为 false 时执行其他指定代码。

控制结构的条件表达式结果可以是任何值，Lua 认为 false 和 nil 为假，true 和非 nil 为真。

要注意的是 Lua 中 0 为 true：

```lua
--[ 0 为true ]
if(0)
then
    print("0 为真")
end
```

以上代码输出结果为：

```
0 为真
```

Lua 提供了以下控制结构语句：

| 语句           | 描述                                                                              |
| -------------- | --------------------------------------------------------------------------------- |
| if 语句        | if 语句 由一个布尔表达式作为条件判断，其后紧跟其他语句组成。                      |
| if...else 语句 | if 语句 可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码。 |
| if 嵌套语句    | 你可以在 if 或 else if 中使用一个或多个 if 或 else if 语句 。                     |

## if 语句

Lua if 语句 由一个布尔表达式作为条件判断，其后紧跟其他语句组成。

Lua if 语句语法格式如下：

```
if(布尔表达式)
then
   --[ 在布尔表达式为 true 时执行的语句 --]
end
```

在布尔表达式为 true 时会 if 中的代码块会被执行，在布尔表达式为 false 时，紧跟在 if 语句 end 之后的代码会被执行。

Lua 认为 false 和 nil 为假，true 和非 nil 为真。要注意的是 Lua 中 0 为 true。

实例

以下实例用于判断变量 a 的值是否小于 20：

```lua
--[ 定义变量 --]
a = 10

--[ 使用 if 语句 --]
if( a < 20 )
then
   --[ if 条件为 true 时打印以下信息 --]
   print("a 小于 20" )
end
print("a 的值为:", a)
```

以上代码执行结果如下：

![if](https://user-images.githubusercontent.com/13142418/57591306-4ddc3500-7563-11e9-90b7-a477f11add54.png)

## if else 语句

Lua if 语句可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码块。

Lua if...else 语句语法格式如下：

```
if(布尔表达式)
then
   --[ 布尔表达式为 true 时执行该语句块 --]
else
   --[ 布尔表达式为 false 时执行该语句块 --]
end
```

在布尔表达式为 true 时会 if 中的代码块会被执行，在布尔表达式为 false 时，else 的代码块会被执行。

Lua 认为 false 和 nil 为假，true 和非 nil 为真。要注意的是 Lua 中 0 为 true。

实例

以下实例用于判断变量 a 的值：

```lua
--[ 定义变量 --]
a = 100;
--[ 检查条件 --]
if( a < 20 )
then
   --[ if 条件为 true 时执行该语句块 --]
   print("a 小于 20" )
else
   --[ if 条件为 false 时执行该语句块 --]
   print("a 大于 20" )
end
print("a 的值为 :", a)
```

以上代码执行结果如下：

## else if 语句

Lua if 语句可以与 else if...else 语句搭配使用, 在 if 条件表达式为 false 时执行 else if...else 语句代码块，用于检测多个条件语句。

Lua if...else if...else 语句语法格式如下：

```
if( 布尔表达式 1)
then
   --[ 在布尔表达式 1 为 true 时执行该语句块 --]

else if( 布尔表达式 2)
   --[ 在布尔表达式 2 为 true 时执行该语句块 --]

else if( 布尔表达式 3)
   --[ 在布尔表达式 3 为 true 时执行该语句块 --]
else
   --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
end
```

示例代码，以下示例代码对变量 a 值进行判断：

```lua
--[ 定义变量 --]
a = 100

--[ 检查布尔条件 --]
if( a == 10 )
then
   --[ 如果条件为 true 打印以下信息 --]
   print("a 的值为 10" )
elseif( a == 20 )
then
   --[ if else if 条件为 true 时打印以下信息 --]
   print("a 的值为 20" )
elseif( a == 30 )
then
   --[ if else if condition 条件为 true 时打印以下信息 --]
   print("a 的值为 30" )
else
   --[ 以上条件语句没有一个为 true 时打印以下信息 --]
   print("没有匹配 a 的值" )
end
print("a 的真实值为: ", a )
```

运行结果如下：

![elseif](https://user-images.githubusercontent.com/13142418/57591705-4d449e00-7565-11e9-97dd-a6c4c667597b.png)

## if else 嵌套

Lua if 语句允许嵌套, 这就意味着你可以在一个 if 或 else if 语句中插入其他的 if 或 else if 语句。
Lua if 嵌套语句语法格式如下：

```
if( 布尔表达式 1)
then
   --[ 布尔表达式 1 为 true 时执行该语句块 --]
   if(布尔表达式 2)
   then
      --[ 布尔表达式 2 为 true 时执行该语句块 --]
   end
end
```

你可以用同样的方式嵌套 else if...else 语句。

实例

以下实例用于判断变量 a 和 b 的值：

```lua
--[ 定义变量 --]
a = 100;
b = 200;

--[ 检查条件 --]
if( a == 100 )
then
   --[ if 条件为 true 时执行以下 if 条件判断 --]
   if( b == 200 )
   then
      --[ if 条件为 true 时执行该语句块 --]
      print("a 的值为 100 b 的值为 200" );
   end
end
print("a 的值为 :", a );
print("b 的值为 :", b );
```

以上代码执行结果如下：

![ififif](https://user-images.githubusercontent.com/13142418/57592594-1d4bc980-756a-11e9-894b-fe6137424a6d.png)


