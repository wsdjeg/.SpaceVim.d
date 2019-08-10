---
layout: post
title: "欢迎来到 Racket"
categories: 学习笔记
tags: lisp
author: 王世东
---

* content
{:toc}

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


## S-表达式

首先说一下S-表达式：S-表达式的基本元素是list与atom。list由括号包围，
可包涵任何数量的由空格所分隔的元素，原子是其它内容。
其使用前缀表示法，在Lisp中既用作代码，也用作数据。如：`1+2*3`  写成前缀表达式就是 `(+ 1 (* 2 3)) `。

- 优点：容易parse，简单纯粹，不用考虑什么优先级等，也是实现代码即数据的前提；
- 缺点：可读性不是很强；

## 高阶函数

高阶函数至少满足下列一个条件：

- 接受一个或多个函数作为输入； 
- 输出一个函数；

微积分中的导数就是一个例子，映射一个函数到另一个函数。在无类型 lambda 演算中，
所有函数都是高阶的。在函数式编程中，返回另一个函数的高阶函数被称为Curry化的函数。
Curry化即把接受多个参数的函数变换成接受一个单一参数（最初函数的第一个参数）的函数，
并且返回接受余下的参数而且返回结果的新函数的技术。如 `f(x,y)=x+y`, 如果给定了 y=1，则就得到了 `g(x)=x+1` 这个函数。


## Lambda 表达式

Racket中实用Lambda表达式来定义匿名函数，《如何设计程序》书中给出的使用原则是：
如果某个非递归函数只需要当参数使用一次，使用Lambda表达式。
如果想用Lambda表达式来表达递归，就需要引入Y组合子，Y 就是这样一个操作符，
它作用于任何一个 (接受一个函数作为参数的) 函数 F，就会返回一个函数 X。
再把 F 作用于这个函数 X，还是得到 X。所以 X 被叫做 F 的不动点(fixed point)，即 (Y F) = (F (Y F)) 。


## 惰性求值

惰性求值(Lazy Evaluation)，说白了就是某些中间结果不需要被求出来，
求出来反而不利于后面的计算也浪费了时间。参见：惰性求值与惰性编程。
惰性求值是一个计算机编程中的一个概念，
它的目的是要最小化计算机要做的工作。惰性计算的最重要的好处是它可以构造一个无限的数据类型。
使用惰性求值的时候，表达式不在它被绑定到变量之后就立即求值，
而是在该值被取用的时候求值。语句如 x:=expression; (把一个表达式的结果赋值给一个变量)明显的调用这个表达式并把计算并把结果放置到 x 中，但是先不管实际在 x 中的是什么，直到通过后面的表达式中到 x 的引用而有了对它的值的需求的时候，而后面表达式自身的求值也可以被延迟，最终为了生成让外界看到的某个符号而计算这个快速增长的依赖树。


## 闭包

闭包在计算机科学中，闭包（Closure）是词法闭包（Lexical Closure）的简称，
是引用了自由变量的函数。自由变量是在表达式中用于表示一个位置或一些位置的符号，
比如 f(x,y) 对 x 求偏导时，y就是自由变量。
这个被引用的自由变量将和这个函数一同存在，即使已经离开了创造它的环境也不例外。
在函数中(嵌套)定义另一个函数时，如果内部的函数引用了外部的函数的变量，
则可能产生闭包。运行时，一旦外部的 函数被执行，一个闭包就形成了，
闭包中包含了内部函数的代码，以及所需外部函数中的变量的引用。
其中所引用的变量称作上值(upvalue)。网上有很多讲 JavaScript 闭包的文章，如果你对 LISP 有系统的了解，那么这个概念自然会很清楚了。


快排的Racket实现

```racket
#lang racket
(define (quick-sort array)
  (cond
    [(empty? array) empty]                            ; 快排的思想是分治+递归
    [else (append 
           (quick-sort (filter (lambda (x) (< x (first array))) array))
           ; 这里的 array 就是闭包   
           (filter (lambda (x) (= x (first array))) array)
           (quick-sort (filter (lambda (x) (> x (first array))) array)))]))
 
(quick-sort '(1 3 2 5 3 4 5 0 9 82 4))
;; 运行结果 '(0 1 2 3 3 4 4 5 5 9 82)
```

通过这个例子，就可以感受到基于 lambda 算子的  Racket  语言强大的表达能力了。
高阶函数、lambda 表达式和闭包的使用使得 Racket 所描述的快排十分的精炼，
这和基于冯诺依曼模型C语言是迥然不容的思维模式。

## 安装

在 Racket 官网下载对应系统的安装包，安装完成后，就可以在命令行里使用 racket 命令。

## 执行 racket 脚本

新建 `hello.rkt` 文件：

```racket
#lang lisp

(+ 1 1)
```

打开命令行，执行 `racket -t hello.rkt`, 就可以看到输出 `2`。
