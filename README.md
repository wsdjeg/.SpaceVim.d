# awesome-dotfiles

### Requirements
1. jdk 1.8  `sudo apt-get install openjdk-8-jdk openjdk-8-doc openjdk-8-source`
2. Vim 7.3.885+ compiled with lua. If :echo has("lua") returns 1, then you're done; otherwise, see below.
3. recommend to use neovim(please see how to install below)


### INSTALL
```sh
chmod +x install.sh
./install.sh
```



install android sdk
```sh
cd ~
mkdir tools
cd tools
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar -zxvf android-sdk_r24.4.1-linux.tgz
```


## For bash

```sh
$ cd ~
$ git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt
$ mv ~/.bashrc ~/.bashrc.backup
$ ln -s ~/DotFiles/bash/bashrc ~/.bashrc
$ ln -s ~/DotFiles/bash/inputrc ~/.inputrc
```


## For fzf

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## For irssi (Get token from irc.gitter.im)
```sh
sudo apt-get install irssi
# /connect -ssl irc.gitter.im 6697 token nick
# /join neovim/neovim
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
