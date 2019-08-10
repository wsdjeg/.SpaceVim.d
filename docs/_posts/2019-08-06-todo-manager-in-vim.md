---
layout: post
title:  "使用 Vim 管理待办事项"
categories: 学习笔记
tags: vim
author: wsdjeg
---

1. content
{:toc}

## 简介

这一功能主要是方便检索源码中的待办事项。只需要在源码注释中加入相关标签即可，比如

```vim
" @todo Use new prolog plugin
" call add(plugins, ['wsdjeg/prolog-vim', { 'merged' : 0}])
call add(plugins, ['wsdjeg/prolog.vim', { 'merged' : 0}])
```

![](https://user-images.githubusercontent.com/13142418/61044482-5342e800-a40b-11e9-9d6c-88cc20b06095.png)

## 安装

vim-todo 这一插件分离自 SpaceVim，可以在 SpaceVim 中使用，当然也支持独立安装。
可以使用任意插件管理器，比如 dein 来安装 vim-todo：

```vim
call dein#add('wsdjeg/vim-todo')
```

这一插件依赖于 Vim 的 `+job` 特性，因此需要确保你的 Vim 版本满足要求，并且需要安装一个命令行工具 [rg](https://github.com/jremmen/vim-ripgrep)
