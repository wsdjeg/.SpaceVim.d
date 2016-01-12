# vim configuration for happy java coding


![conplete](https://github.com/wsdjeg/DotFiles/blob/master/pic/complete.png)

![check](https://github.com/wsdjeg/DotFiles/blob/master/pic/check.png)

![import](https://github.com/wsdjeg/DotFiles/blob/master/pic/import.png)

# Getting Started

## INSTALL

## Requirements

1. jdk 1.8  `sudo apt-get install openjdk-8-jdk openjdk-8-doc openjdk-8-source`
2. Vim 7.3.885+ compiled with lua. If :echo has("lua") returns 1, then you're done; otherwise, see below.

install vim with lua e.g.
```shell
$ sudo apt-get install vim-gnome
# by install gvim you also can use vim in command
```

install android sdk
```shell
cd ~
mkdir tools
cd tools
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar -zxvf android-sdk_r24.4.1-linux.tgz
```

configration for vim

```shell
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ git clone git@github.com:wsdjeg/DotFiles.git ~/DotFiles
$ mv ~/.vimrc ~/.vimrc.bak
$ ln -s ~/DotFiles/vimrc ~/.vimrc
$ ln -s ~/DotFiles/vimrc ~/.config/nvim/init.vim
```
Launch `vim`, run `:NeoBundleInstall`

or

Command run `vim +NeoBundleInstall +qall`

## For bash

```shell
$ cd ~
$ git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
$ mv ~/.bashrc ~/.bashrc.backup
$ ln -s ~/DotFiles/bash/bashrc ~/.bashrc
$ ln -s ~/DotFiles/bash/inputrc ~/.inputrc
```

## For zsh
```shell
ln -s ~/DotFiles/zsh/zshrc ~/.zshrc
```

## For fzf

```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### For neovim

```shell
sudo apt-get install neovim
sudo apt-get install python python3 python-dev python3-dev python-pip python3-pip
pip2 install --user neovim
pip3 install --user neovim
```

## Dark powered Plugins

- [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)

> Dark powered asynchronous completion framework for neovim


## Other tools

Screen catch

Kazam
```shell
sudo apt-get install kazam
```
