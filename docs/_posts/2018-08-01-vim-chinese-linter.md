---
layout: post
title: "Vim 中文文档规范检查插件"
categories: 工具分享
tags: vim
author: 王世东
---

* content
{:toc}

## 初心

经常使用 markdown 进行中文写作，包括但不限于写一些文档。对于中文排版目前没有非常好的检查工具。
因此做了 chinese_linter.vim 这个插件，目的在于提示中文文档中一些常见的排版错误。

## 使用说明

在编辑中文文档时，使用如下命令即可检查，错误信息将被展示在 Vim 的 location list 窗口

```
:CheckChinese
```

目前支持如下错误代码：

| 错误代码 | 描述                   |
| -------- | ---------------------- |
| E001     | 中文字符后存在英文标点 |
| E002     | 中英文之间没有空格     |
| E003     | 中文与数字之间没有空格 |
| E004     | 中文标点之后存在空格   |
| E005     | 行尾含有空格           |

该插件才开始做，目前仅仅实现了以上五种规范检查，后面会添加更多的规范检查，欢迎尝试。

## 协作开发

目前这个项目发布在 github 上面，如果有熟悉 Vim 脚本的同学，也欢迎参与，感谢！

[wsdjeg/ChineseLinter.vim](https://github.com/wsdjeg/ChineseLinter.vim)
