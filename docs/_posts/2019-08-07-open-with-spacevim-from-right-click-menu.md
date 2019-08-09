---
layout: post
title:  "右键使用 SpaceVim 打开文件"
categories: 学习笔记
tags: spacevim
author: wsdjeg
---

我们知道，在 Linux 命令行里，可以使用 cd 命令切换到项目所在的目录，
此时启动 SpaceVim，会读取工程目录下的一些 SpaceVim 配置信息。
这样的好处有很多，假定我日常需要编辑 Java Python 和 c 语言项目，
那么在使用SpaceVim时不需要在用户配置里将所有的语言模块都启用了，
而是只需要在 Java 项目根目录创建一个 `.SpaceVim.d/init.toml` 文件，
在此文件里启用 `lang#java` 模块即可。同理，在 Python 项目根目录同样操作启用 `lang#python` 模块即可。

但是在 windows 系统下使用 neovim-qt 时，就不太方便了，为此，添加了这一功能，可以使用 windows 自身的文件管理器，定位到项目所在位置后使用右键打开 SpaceVim 并读取项目下的 SpaceVim 配置。

下面，我们来看看如何添加：

1. 按下 `Win + r` 在运行弹窗理输入：`regedit` 回车，打开注册表编辑器：

![1](https://user-images.githubusercontent.com/13142418/62628353-b584ff00-b95d-11e9-95ec-10634e32baa3.jpg)

2. 定位到 HKEY_CLASSES_ROOT > * > shell :

![2](https://user-images.githubusercontent.com/13142418/62628350-b4ec6880-b95d-11e9-9b34-5dd6743875ed.jpg)

右键新建项，此时可以输入一个你需要看到的名字，比如 使用 SpaceVim 打开，
再在这个项里新建一个 command 项，修改其默认值为：

```
"D:\Program Files\Neovim\bin\nvim-qt.exe" -qwindowgeometry 1310x650+20+20 "%1"
```

此时，就可以在右键中使用 neovim-qt 打开文件了，上面启动参数里指定了窗口位置和大小，可以自行调节。

![3](https://user-images.githubusercontent.com/13142418/62628347-b4ec6880-b95d-11e9-9eed-c928f9b91f0d.gif)
