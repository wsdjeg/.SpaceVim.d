---
layout: post
title: "SpaceVim 下的异步任务系统"
categories: 工具分享
tags: spacevim
author: 王世东
---

* content
{:toc}

项目的构建、打包、测试通需要调用一些外部命令，比如`make`、`ant`等，SpaceVim 内置一个任务管理系统，通过分析项目的任务配置文件，获取相关命令，并且异步执行，同时根据配置按照需求展示运行结果。

## 配置文件

配置文件支持全局配置文件以及项目局部配置文件，分别为`~/.SpaceVim.d/tasks.toml`和`.SpaceVim.d/tasks.toml`，局部配置文件具有更高的优先权限。

### 基本使用

以下为一个简单的 hello world 示例：

```toml
[my-first-task]
    command = 'echo'
    args = ['hello world']
```

添加以上内容至 `~/.SpaceVim.d/tasks.toml`后，在SpaceVim内按下`SPC p t r`快捷键，就会弹出如下界面：


![](https://user-gold-cdn.xitu.io/2020/2/15/17046b77705d8292?w=679&h=84&f=png&s=8165)

可以使用`j`/`k`按键进行上下选择，回车键执行，也可以按下任务名称前面的序号直接执行。执行效果如下：


![](https://user-gold-cdn.xitu.io/2020/2/15/17046b920794243c?w=746&h=227&f=png&s=9599)

### 进阶使用

对于一些复杂的任务，可以使用预定义的一些变量，来简化配置文件，比如，在一个简单的C项目里：

```
[in]: e:/ctest/                         
  ▶ bin/                                    
  ▼ src/                                    
        main.c                                
```

编译一个简单的编译当前C文件`src/main.c`至`bin/`目录，以及调用编译后的可以执行文件运行：

```toml
[file-build]
    command = 'gcc $(file) -o $(workspaceFolder)/bin/$(workspaceFolderBasename)'
[file-run]
    command = "$(workspaceFolder)/bin/$(workspaceFolderBasename)"
```
上面的配置文件里涉及到的变量分别是：

| 变量名                       | 值                    |
| ---------------------------- | --------------------- |
| `$(file)`                    | `e:/ctest/src/main.c` |
| `$(workspaceFolder)`         | `e:/ctest`            |
| `$(workspaceFolderBasename)` | `ctest`               |


---

> SpaceVim 中文官网: https://spacevim.org/cn/
>
> 中文 Gitter 聊天室：https://gitter.im/SpaceVim/cn 
