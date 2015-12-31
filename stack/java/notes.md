### 第一章 Java程序设计概述
#### Java程序设计平台

Java不只是一中语言，而是一个完整的平台，有一个庞大的库，其中包含了很多可重用的代码和一个提供诸如安全性、跨操作系统的可移植性以及自动垃圾回收等服务的执行环境。

#### java“白皮书”的关键术语
- 简单性：语法简单，去除了C++中部分不适当的特性 支持小型机器；
- 面向对象：面向对象是一种设计艺术，重点放在数据的对象的接口上；
- 网络技能：大量类库支持，便于网络开发；
- 健壮性：Java编译时能检测出许多在其它语言中仅能在运行时刻才能检测出的问题；
- 安全性：
- 体系结构中立：
- 可移植性：Java中数据类型有固定的大小，这消除了代码移植时的问题；
- 解释型：增量链接，言过其实，但目前即时编译技术使得效率更高；
- 高性能：即时编译含有更多可用的信息，监控代码执行频率，消除函数内嵌；
- 多线程：
- 动态性：

#### Java applet 与 Internet

#### Java 发展简史

```
1991 Green
    ↓
1992 * 7
    ↓
1993 First Person
    ↓
1994
    ↓
1995 HotJava applet
    ↓
1996 - 今 Java
```

#### 关于Java的常见误解

### 第二章 Java程序设计环境

- *JDK*
```shell
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-doc
sudo apt-get install openjdk-8-source
```

- *VIM*or*NEOVIM*

[vimrc](https://github.com/wsdjeg/DotFiles/blob/master/vimrc)

### 第三章 Java的基本程序设计结构
访问修饰符 access modifier
骆驼命名 CamelCase

关于字符串，应先判断是否为null，否则调用方法是会出现运行时异常；

![2015-12-27 20-43-36](https://cloud.githubusercontent.com/assets/13142418/12010282/d2764e7c-acda-11e5-9a6e-b4892820daff.png)

### 第五章 继承(inheritance)

一个对象变量可以指示多种实际类型的现象被称为多态(polymorphism)。在运行时能够自动地选择调用哪个方法的现象被称为动态绑定(dynamic bingding)。

Java语言规范要求euqals方法具有下面的特征：

1. 自反性：对于任何非空引用x，x.equals(x)应该返回true
2. 对称性：对于任何引用x和y，当且仅当y.equals(x)返回true时，x.equals(y)也应当返回true
3. 传递性：对于任何引用x,y和z，如果x.equals(y)返回true，y.equals(z)返回true，那么x.equals(z)也应该返回true
4. 一致性
5. 对于任意非空引用x，x.equals(null)应该返回false

