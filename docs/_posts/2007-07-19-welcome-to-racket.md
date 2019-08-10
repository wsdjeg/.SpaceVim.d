---
layout: post
title:  "欢迎来到 Racket"
categories: 学习笔记
tags: lisp
author: 王世东
---

Racket 是一种编程语言（programming language）—— Lisp语言的一种方言和Scheme的一种派生语言；

## 安装

在 Racket 官网下载对应系统的安装包，安装完成后，就可以在命令行里使用 racket 命令。

## 执行 racket 脚本

新建 `hello.rkt` 文件：

```racket
#lang lisp

(+ 1 1)
```

打开命令行，执行 `racket -t hello.rkt`, 就可以看到输出 `2`。

