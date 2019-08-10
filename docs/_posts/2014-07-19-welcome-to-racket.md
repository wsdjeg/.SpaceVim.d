---
layout: post
title: "欢迎来到 Racket"
categories: 学习笔记
tags: lisp
author: 王世东
---

Racket 是一种编程语言（programming language）—— Lisp 语言的一种方言和 Scheme 的一种派生语言；

## 简介

1958 年，人工智能之父 John McCarthy 发明了一种以 Lambda 演算为基础的符号处理语言，
1960 年 McCarthy 发表著名论文 Recursive Functions of Symbolic Expressions and Their Computation by Machine,
从此这种语言被命名为 LSIP (List Processor），其语法被命名为：符号表达式(S-Expression)。
LISP 构建在 7 个函数 [atom car cdr cond cons eq quote] 和 2 个特型 [lambda label] 之上。

Lisp诞生之初是为了纯粹的科学研究，代码执行像数学公式一样，以人的大脑来演算。
直到麦卡锡的学生斯蒂芬·罗素将eval函数在IBM 704机器上实现后，
才开启了Lisp作为一种计算机语言的历史。1962年，第一个完整的Lisp编译器在MIT诞生，
从此之后Lisp以MIT为中心向全世界传播。之后十多年，出现了各种Lisp方言。

1975年，Scheme诞生。Scheme同样诞生与MIT，它的设计哲学是最小极简主义，
它只提供必须的少数几个原语，所有其他的实用功能都由库来实现。在极简主义的设计思想下，
Scheme趋于极致的优雅，并作为计算机教学语言在教育界广泛使用。

1984年，Common Lisp诞生。在二十世纪七八十年代，由于Lisp方言过多，社区分裂，
不利于lisp整体的发展。从1981年开始，在一个Lisp黑客组织的运作下，
经过三年的努力整合后，于1984年推出了Common Lisp。由于Scheme的设计理念和其他Lisp版本不同，
所以尽管Common Lisp借鉴了Scheme的一些特点，但没有把Scheme整合进来。此后Lisp仅剩下两支方言： Common Lisp 和 Scheme。


从二十世纪九十年代开始，由于C++、Java、C#的兴起，Lisp逐渐没落。直到2005年后，
随着科学计算的升温，动态语言JavaScript、Python、Ruby的流行，Lisp又渐渐的回到人们的视线。
不过在Lisp的传统阵地教育界，Python作为强有力的挑战者对Scheme发起冲锋；
在2008年，MIT放弃了使用Scheme作为教学语言的SICP（计算机程序的构造和解释）课程，
而启用Python进行基础教学。同时美国东北大学另立炉灶，其主导的科学计算系统PLT Scheme开始迅猛发展；
2010年，PLT Scheme改名为Racket。近几年，The Racket Language连续成为年度最活跃语言网站，并驾齐驱的还有haskell网站。

![lisp](https://user-images.githubusercontent.com/13142418/62820991-907fce80-bb9f-11e9-9975-1cd92f9cfe79.jpg)

## 安装

在 Racket 官网下载对应系统的安装包，安装完成后，就可以在命令行里使用 racket 命令。

## 执行 racket 脚本

新建 `hello.rkt` 文件：

```racket
#lang lisp

(+ 1 1)
```

打开命令行，执行 `racket -t hello.rkt`, 就可以看到输出 `2`。
