# 终端特殊转义代码

`ANSI/VT100` 终端或终端模拟器不仅仅可以显示黑白字符，同时可以通过 `escape sequences` 显示各种颜色和格式。这些 `escape sequences` 以转义符号起始，
通常是 `^[` 或者 `<Esc>`, 紧接其后是一些字符串，其格式为：`<Esc>[FormatCodem`

在 Bash 里，`<Esc>` 字符可以用以下形式表示：

- `\e`
- `\033`
- `\x1B`

示例：

| Code (Bash)                        | preview                                                                         |
| ---------------------------------- | ------------------------------------------------------------------------------- |
| `echo -e "\e[31mHello World\e[0m"` | ![](https://misc.flogisoft.com/_media/bash/colors_format/escape_example_01.png) |

原文链接： <https://misc.flogisoft.com/bash/tip_colors_and_formatting>
