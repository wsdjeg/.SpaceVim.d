---
layout: post
title: "ruby 流程控制"
categories: 学习笔记
tags: ruby
author: 王世东
---

* content
{:toc}

Ruby 提供了其他现代语言中很常见的条件结构。在这里，我们将解释所有的条件语句和 Ruby 中可用的修饰符。

## if...else 语句

```
if conditional [then]
   code...
[elsif conditional [then]
    code...]...
[else
    code...]
end
```

if 表达式用于条件执行。值 false 和 nil 为假，其他值都为真。请注意，Ruby 使用 elsif，不是使用 else if 和 elif。
如果 conditional 为真，则执行 code。如果 conditional 不为真，则执行 else 子句中指定的 code。
通常我们省略保留字 then 。若想在一行内写出完整的 if 式，则必须以 then 隔开条件式和程式区块。如下所示:

```ruby
if a == 4 then a = 7 end
```

实例

```ruby
#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

x=1
if x > 2
   puts "x 大于 2"
elsif x <= 2 and x!=0
   puts "x 是 1"
else
   puts "无法得知 x 的值"
end
```

![图片](https://user-images.githubusercontent.com/13142418/62419681-b9dcbe00-b6b8-11e9-907a-aedd3a797f32.png)

## if 修饰符

语法

```
code if condition
```

如果 conditional 为真，则执行 code。

实例

```ruby
#!/usr/bin/ruby

$debug=1
puts "debug\n" if $debug
```

![图片](https://user-images.githubusercontent.com/13142418/62419702-66b73b00-b6b9-11e9-95d0-21584614add6.png)

## unless 语句

语法

```
unless conditional [then]
   code
[else
   code ]
end
```

unless 式和 if 式作用相反，即如果 conditional 为假，则执行 code。如果 conditional 为真，则执行 else 子句中指定的 code。

实例

```ruby
#!/usr/bin/ruby

x=1
unless x>2
   puts "x 小于 2"
 else
  puts "x 大于 2"
end
```

![图片](https://user-images.githubusercontent.com/13142418/62419722-cca3c280-b6b9-11e9-807e-f6c7b88420b8.png)

## unless 修饰符

语法

```
code unless conditional
```

如果 conditional 为假，则执行 code。

实例

```ruby
#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

$var =  1
print "1 -- 这一行输出\n" if $var
print "2 -- 这一行不输出\n" unless $var

$var = false
print "3 -- 这一行输出\n" unless $var
```

![图片](https://user-images.githubusercontent.com/13142418/62419738-3d4adf00-b6ba-11e9-855d-c90a4b01cf52.png)

## case 语句

语法

```
case expression
[when expression [, expression ...] [then]
   code ]...
[else
   code ]
end
```

case 先对一个 expression 进行匹配判断，然后根据匹配结果进行分支选择。

它使用 ===运算符比较 when 指定的 expression，若一致的话就执行 when 部分的内容。

通常我们省略保留字 then 。若想在一行内写出完整的 when 式，则必须以 then 隔开条件式和程式区块。如下所示:

```
when a == 4 then a = 7 end
```

因此：

```
case expr0
when expr1, expr2
   stmt1
when expr3, expr4
   stmt2
else
   stmt3
end
```

基本上类似于：

```
_tmp = expr0
if expr1 === _tmp || expr2 === _tmp
   stmt1
elsif expr3 === _tmp || expr4 === _tmp
   stmt2
else
   stmt3
end
```

实例

```ruby
#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

$age =  5
case $age
when 0 .. 2
    puts "婴儿"
when 3 .. 6
    puts "小孩"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "少年"
else
    puts "其他年龄段的"
end
```

![图片](https://user-images.githubusercontent.com/13142418/62419785-5902b500-b6bb-11e9-85a4-130587abf2a2.png)

