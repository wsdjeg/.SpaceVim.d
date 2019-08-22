---
layout: post
title: "Vim Script 循环"
categories: 学习笔记
tags: vim
author: 王世东
---

* content
{:toc}


在编写 Vim 脚本时，很多情况下需要重复某个操作，为了避免过多的重复语句，
可以通过循环来让某些语句在特定条件下重复执行：

一组被重复执行的语句称之为循环体，能否继续重复，决定循环的终止条件。

循环语句是由循环体及循环的终止条件两部分组成的。

在 Vim 脚本内，有两种循环： for 循环和 while 循环：

## for 循环

重复执行指定语句，重复次数可在 for 语句中控制。

基本语法：

```
for item in items
    <执行体>
end
```

items 相当于是一个迭代器，从 items 的第一个元素便利至最后一个元素，并且将该元素赋值给 item，
在循环体中，可以引用 item 这一变量。


