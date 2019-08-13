---
layout: post
title: "模块化 vimrc 初体验"
categories: 工具分享
tags: vim
author: 王世东
---

Vim 使用已经快有4个年头了，从最早期的只有一个 `~/.vimrc` 文件，到之前一个完整的 `~/.vim` 目录，
期间配置文件结构也改变了很多。配置也变得越来越臃肿。

体验过 eclipse 这样的工具后，回过头来在看看 Vim 的配置，似乎也可以把一些功能做成一些模块，
然后根据自己实际的需求载入这些模块。

在这里，我们使用 Bundle 这款工具来管理插件，大致的思路如下：

## 主文件结构

**~/.vimrc:**

```vim

" 将插件管理器加入 rtp
set rtp+=~/.vim/bundle/bundle
call bundle#begin()

" 模块逻辑
let g:modulars = ['core', 'java']

" 根据模块变量载入模块

for m in g:modulars
    exe 'so ~/.vim/modulars/' . m . '.vim' 
endfor

call bundle#end()

```

## 模块结构

我们以 Java 模块为例：

**~/.vim/modulars/java.vim:**

```vim
Bundle 'javautil.vim'
Bundle 'javaclass.vim'


" 插件配置

let g:java_util_foo = 'xxx'
```
