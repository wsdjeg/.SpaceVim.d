SpaceVim 是一个社区驱动的模块化 Vim IDE，以模块的方式组织管理插件以及相关配置， 为不同的语言开发量身定制了相关的开发模块，该模块提供代码自动补全， 语法检查、格式化、调试、REPL 等特性。用户仅需载入相关语言的模块即可得到一个开箱即用的Vim-IDE。

-  项目主页： [spacevim.org/cn/](https://spacevim.org/cn/)
- Github地址： [SpaceVim](https://github.com/SpaceVim/SpaceVim)
- 码云地址： [SpaceVim](https://gitee.com/SpaceVim/SpaceVim)

使用过程中如果遇到问题，可以加入 [SpaceVim 中文社区](https://spacevim.org/cn/community/)参与讨论。或者加入 QQ 群交流：[点击加入 QQ 交流群](https://jq.qq.com/?_wv=1027&k=43zWPlT)

SpaceVim 的开发主要在 github 上，以下为最近几周的开发汇总：

[![Throughput Graph](https://graphs.waffle.io/SpaceVim/SpaceVim/throughput.svg)](https://waffle.io/SpaceVim/SpaceVim/metrics/throughput)

## 安装

在安装 SpaceVim 之前，你需要确保电脑上已经安装了 `git` 和 `curl`。这两个工具用来
下载插件以及字体。

如果在终端中使用 vim 或者 neovim，还需要设置终端的字体。

### Linux 或 macOS

```bash
curl -sLf https://spacevim.org/cn/install.sh | bash
```

安装结束后，初次打开 `vim` 或者 `gvim` 时， SpaceVim 会**自动**下载并安装插件。

如果需要获取安装脚本的帮助信息，可以执行如下命令，包括定制安装、更新和卸载等。

```bash
curl -sLf https://spacevim.org/cn/install.sh | bash -s -- -h
```

### Windows

window 下最快捷的安装方法是下载安装脚本 [install.cmd](https://spacevim.org/cn/install.cmd) 并运行。

## 配置

SpaceVim 的默认配置文件为 `~/.SpaceVim.d/init.toml`。下面为一简单的配置示例。
如果需要查阅更多 SpaceVim 配置相关的信息，请阅读 SpaceVim 用户文档。


```toml
# 这是一个基础的 SpaceVim 配置示例

# 所有的 SpaceVim 选项都列在 [option] 之下
[options]
    # 设置 SpaceVim 主题及背景，默认的主题是 gruvbox，如果你需要使用更
    # 多的主题，你可以载入 colorscheme 模块
    colorscheme = "gruvbox"
    # 背景可以取值 "dark" 和 "light"
    colorscheme_bg = "dark"
    # 启用/禁用终端真色，在目前大多数终端下都是支持真色的，当然也有
    # 一小部分终端不支持真色，如果你的 SpaceVim 颜色看上去比较怪异
    # 可以禁用终端真色，将下面的值设为 false
    enable_guicolors = true
    # 设置状态栏上分割符号形状，如果字体安装失败，可以将值设为 "nil" 以
    # 禁用分割符号，默认为箭头 "arrow"
    statusline_separator = "nil"
    statusline_separator = "bar"
    # 设置顶部标签列表序号类型，有以下五种类型，分别是 0 - 4
    # 0: 1 ➛ ➊ 
    # 1: 1 ➛ ➀
    # 2: 1 ➛ ⓵
    # 3: 1 ➛ ¹
    # 4: 1 ➛ 1
    buffer_index_type = 4
    # 显示/隐藏顶部标签栏上文件类型图标，这一图标需要安装 nerd fonts，
    # 如果未能成功安装这一字体，可以隐藏图标
    enable_tabline_filetype_icon = true
    # 是否在状态栏上显示当前模式，默认情况下，不显示 Normal/Insert 等
    # 字样，只以颜色区分当前模式
    enable_statusline_display_mode = false

# SpaceVim 模块设置，主要包括启用/禁用模块

# 启用 autocomplete 模块, 启用模块时，可以列出一些模块选项，并赋值，
# 关于模块的选项，请阅读各个模块的文档
[[layers]]
name = "autocomplete"
auto-completion-return-key-behavior = "complete"
auto-completion-tab-key-behavior = "cycle"

# 禁用 shell 模块, 禁用模块时，需要加入 enable = false
[[layers]]
name = "shell"
enable = false

# 添加自定义插件

[[custom_plugins]]
name = "lilydjwg/colorizer"
merged = 0
```

## 特性

### 模块化

SpaceVim 各种功能以及语言支持都是通过模块来封装插件和配置，可以从 SpaceVim 可用模块中选择需要的模块并启用。目前版本已经支持 Java、php、c/c++、python 等 16 种语言模块，更多的语言支持将陆续支持。

### 快捷键导航

SpaceVim 中大部分快捷键以空格键为前缀，内置一个快捷键导航插件，可以实时提示按键功能，因此在使用初期并不需要记忆繁杂的快捷键。

![mapping guide](https://user-images.githubusercontent.com/13142418/35568184-9a318082-058d-11e8-9d88-e0eafd1d498d.gif)

### 快捷键功能描述

当需要了解一个快捷键详细功能以及定义的时候，可以使用该功能快速打开快捷键功能描述，并且可以跳转到快捷键定义处。

![describe key bindings](https://user-images.githubusercontent.com/13142418/35568829-e3c8e74c-058f-11e8-8fa8-c0e046d8add3.gif)
