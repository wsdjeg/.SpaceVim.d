---
layout: post
title: "Lua 函数"
categories: 学习笔记
tags: lua
author: 王世东
---

* content
{:toc}


在 Lua 中，函数是对语句和表达式进行抽象的主要方法。既可以用来处理一些特殊的工作，也可以用来计算一些值。

Lua 提供了许多的内建函数，你可以很方便的在程序中调用它们，如 print()函数可以将传入的参数打印在控制台上。

Lua 函数主要有两种用途：

1. 完成指定的任务，这种情况下函数作为调用语句使用；
2. 计算并返回值，这种情况下函数作为赋值语句的表达式使用。

函数定义

Lua 编程语言函数定义格式如下：

```
optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
   function_body
 return result_params_comma_separated
end
```

解析：

- `optional_function_scope`: 该参数是可选的制定函数是全局函数还是局部函数，未设置该参数末尾为全局函数，如果你需要设置函数为局部函数需要使用关键字 local。
- `function_name`: 指定函数名称。
- `argument1, argument2, argument3..., argumentn` : 函数参数，多个参数以逗号隔开，函数也可以不带参数。
- `function_body`: 函数体，函数中需要执行的代码语句块。
- `result_params_comma_separated`: 函数返回值，Lua 语言函数可以返回多个值，每个值以逗号隔开。

实例

以下实例定义了函数 max()，参数为 num1, num2，用于比较两值的大小，并返回最大值：

```lua
--[[ 函数返回两个值的最大值 --]]
function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end

   return result;
end
-- 调用函数
print("两值比较最大值为 ",max(10,4))
print("两值比较最大值为 ",max(5,6))
```

以上代码执行结果为：

![max](https://user-images.githubusercontent.com/13142418/57593287-5174b980-756d-11e9-867c-a1754ec68988.png)

Lua 中我们可以将函数作为参数传递给函数，如下实例：

```lua
myprint = function(param)
   print("这是打印函数 -   ##",param,"##")
end

function add(num1,num2,functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end
myprint(10)
-- myprint 函数作为参数传递
add(2,5,myprint)
```

以上代码执行结果为：

![function](https://user-images.githubusercontent.com/13142418/57593302-63565c80-756d-11e9-9e55-f8dc2177a253.png)

## 多返回值

Lua 函数可以返回多个结果值，比如 string.find，其返回匹配串"开始和结束的下标"（如果不存在匹配串返回 nil）。

```
> s, e = string.find("www.w3cschool.cn", "w3cschool")
> print(s, e)
5	13
```

Lua 函数中，在 return 后列出要返回的值得列表即可返回多值，如：

```lua
function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi
end

print(maximum({8,10,23,12,5}))
```

以上代码执行结果为：

![maximum](https://user-images.githubusercontent.com/13142418/57593257-373adb80-756d-11e9-8b28-d578035cf2aa.png)

## 可变参数

Lua 函数可以接受可变数目的参数，和 C 语言类似在函数参数列表中使用三点（...) 表示函数有可变的参数。

Lua 将函数的参数放在一个叫 arg 的表中，#arg 表示传入参数的个数。

例如，我们计算几个数的平均值：

```lua
function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,3,4,5,6))
```

以上代码执行结果为：

![average](https://user-images.githubusercontent.com/13142418/57593230-1bcfd080-756d-11e9-98b1-e4f515980e6d.png)


