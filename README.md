# awesome-dotfiles

[![Gitter](https://badges.gitter.im/wsdjeg/DotFiles.svg)](https://gitter.im/wsdjeg/DotFiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![Build Status](https://travis-ci.org/wsdjeg/DotFiles.svg?branch=master)](https://travis-ci.org/wsdjeg/DotFiles)

### Requirements

1. jdk 1.8
2. Vim 7.3.885+ compiled with lua. If :echo has("lua") returns 1, then you're done;
3. Recommend to use [neovim](https://neovim.io/)
4. mutt getmail procmail msmtp


### Install

##### Linux
you can use the install.sh script for vim or neovim;

```sh
chmod +x install.sh
./install.sh nvim  # or ./install.sh vim
```
### Docs

- VIM [README.md](config/nvim/README.md)

### Thanks

- [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)

> Dark powered asynchronous completion framework for neovim

- [javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)

> Updated javacomplete plugin for vim

- [neosnippet.vim](https://github.com/Shougo/neosnippet.vim)

> neo-snippet plugin contains neocomplcache snippets source


## Screenshots

#### termite
![i3-wm](pic/i3-wm.png)

#### Tecent QQ
![Vim-QQ](pic/Vim-QQ.png)

To install qq.vim, you just need copy qq.vim to your vim autoload dir.
now the plugin only support neovim, if you want to use it in vim8,
you need install [job.vim](config/nvim/autoload/job.vim).

#### irssi
![irssi](pic/irssi.png)

#### neovim && vim(You can do everything in vim)
##### List all the installed plugin,and open plugin's official website in github
![installed plugins](pic/installed_plugin.png)
##### List all the mappings and descriptions
![mappings](pic/list_mappings.png)
##### List all the repos I starred in github
![starred repos](pic/starred.png)

![complete](pic/complete.png)

![check](pic/check.png)

![import](pic/import.png)

![gradle](pic/gradle_project.png)

