# awesome-dotfiles

### INSTALL

### Requirements
1. jdk 1.8  `sudo apt-get install openjdk-8-jdk openjdk-8-doc openjdk-8-source`
2. Vim 7.3.885+ compiled with lua. If :echo has("lua") returns 1, then you're done; otherwise, see below.
3. recommend to use neovim(please see how to install below)

### For neovim

```sh
sudo apt-get install neovim
sudo apt-get install python python3 python-dev python3-dev python-pip python3-pip
pip2 install --user neovim
pip3 install --user neovim
```

install vim with lua e.g.
```sh
$ sudo apt-get install vim-gnome
# by install gvim you also can use vim in command
```

install android sdk
```sh
cd ~
mkdir tools
cd tools
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar -zxvf android-sdk_r24.4.1-linux.tgz
```

configration for vim

```sh
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

```sh
$ cd ~
$ git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
$ mv ~/.bashrc ~/.bashrc.backup
$ ln -s ~/DotFiles/bash/bashrc ~/.bashrc
$ ln -s ~/DotFiles/bash/inputrc ~/.inputrc
```

## For zsh
```sh
ln -s ~/DotFiles/zsh/zshrc ~/.zshrc
```

## For fzf

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```


### true color terminal in ubuntu 14.04
```sh
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get install gnome-terminal
sudo add-apt-repository -r ppa:gnome3-team/gnome3-staging

```

### Install fcitx in ubuntu 14.04

```sh
sudo apt-get install fcitx fcitx-pinyin
```

### Install latest version ag
```sh
sudo add-apt-repository ppa:jonathonf/backports
sudo apt-get update
sudo apt-get install silversearcher-ag
```

### Fix mysql chinese support
add into my.cnf(/etc/mysql/my.cnf)
```
[mysql]
default-character-set=utf8
[mysqld]
character-set-server=utf8
```

### Build vim from source
> I have enable both py and py3
```sh
sudo apt-get build-dep vim
git clone https://github.com/vim/vim.git
## make distclean && make clean
## build script from this repo
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
```

## Dark powered Plugins

- [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)

> Dark powered asynchronous completion framework for neovim

- [javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)

> Updated javacomplete plugin for vim

- [neosnippet.vim](https://github.com/Shougo/neosnippet.vim)

> neo-snippet plugin contains neocomplcache snippets source

## Other tools

Screen catch

Kazam
```sh
sudo apt-get install kazam
```

## Screenshots
![conplete](https://github.com/wsdjeg/DotFiles/blob/master/pic/complete.png)

![check](https://github.com/wsdjeg/DotFiles/blob/master/pic/check.png)

![import](https://github.com/wsdjeg/DotFiles/blob/master/pic/import.png)
