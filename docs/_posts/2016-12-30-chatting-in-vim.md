---
layout: post
title: "在 Vim 中使用聊天工具"
categories: 工具分享
tags: vim
author: 王世东
---

* content
{:toc}


在装了 arch 之后，没有庄 gnome 等桌面，而是采用了 I3-WM 这样的平铺桌面，
平时有聊天的需求，又无法忍受手机打字那么麻烦，
于是做了一个 Linux 系统下 借助 Vim 的聊天工具。分享给大家：

## 安装

```viml
call dein#add('wsdjeg/vim-chat')
```

安装完成之后，可以使用 `call chat#chatting#OpenMsgWin()`，打开聊天窗口。

## 微信及QQ聊天

### 依赖

- [mojo-webqq](https://github.com/sjdy521/Mojo-Webqq) 和 [mojo-weixin](https://github.com/sjdy521/Mojo-Weixin)：用于将QQ及微信协议转换成irc协议
- IRC 依赖模块: `cpanm -v Mojo::IRC::Server::Chinese`, 详见： [irc.md](https://github.com/sjdy521/Mojo-Webqq/blob/master/IRC.md)
- [irssi](https://irssi.org/): irc 聊天客户端
- [feh](https://feh.finalrewind.org/): 图片查看器，用于打开二维码
- [neovim](https://github.com/neovim/neovim)： vim8 的异步存在[问题](https://github.com/vim/vim/issues/1198)，无法实现相应功能，故只能在neovim下使用
- Linux: 目前仅在Linux下测试成功， Windows 下请直接使用QQ客户端

### 启动

首先启动 QQ 服务器 `call chat#qq#start()`, 然后会自动弹出一个二维码，手机扫描下就可以登录了。neovim 默认使用 `Alt + x` 打开/关闭聊天窗口。

