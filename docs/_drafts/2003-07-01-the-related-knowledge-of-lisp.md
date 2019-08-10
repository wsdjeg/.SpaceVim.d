---
layout: post
title:  "Lisp 编程语言相关知识"
categories: 学习笔记
tags: lisp
author: 王世东
---

利用暑假的时间，简单学习了解了下 Lisp 这一编程语言，也可以说这一类编程语言。

## 初识 Lisp

Lisp 是一种历史悠久的、函数式编程语言举个简单的例子：

```lisp
(+ 1 7 9 11)
```

## 安装 Scheme

从 Scheme 官网下载安装包： https://groups.csail.mit.edu/mac/ftpdir/scheme-7.5/#Download

下周安装完成后，可以使用 mit-scheme 命令调用。

## 运行 scm 文件

在 MIT-Scheme 中输入 code 非常麻烦，光标不能回退和上下移动，所以比较简单的方法就是运行已经写完的文件：

```
mit-scheme -load yourfile.scm 
```
