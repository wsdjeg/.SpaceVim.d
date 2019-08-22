---
layout: post
title: "Vim Script 基本语法"
categories: 学习笔记
tags: vim
author: 王世东
---

* content
{:toc}

Vim Script 是用于配置 Vim 的脚本语言，也可以归类为一种编程语言。

## 注释

在 Vim 脚本里，支持整行注释和句尾注释：

```vim
" 这是单行注释
let g:wsdjeg_info = "xxx"  " 这是行尾注释
```


## 变量

在 Vim 脚本里，可以使用关键字 `let` 来申明变量，最基本的方式为：

```vim
" 定义一个类型是字符串的变量 g:helloworld
let g:helloworl = "sss"
```

前面的例子中，是定义一个字符串，Vim 脚本中支持以下几种数据类型：

