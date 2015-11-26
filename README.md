# vim configuration for happy java coding

![conplete](https://github.com/wsdjeg/DotFiles/blob/master/pic/complete.png)

![check](https://github.com/wsdjeg/DotFiles/blob/master/pic/check.png)

![import](https://github.com/wsdjeg/DotFiles/blob/master/pic/import.png)

# Getting Started

## INSTALL

## Requirements

1. jdk 1.8  `sudo apt-get install openjdk-8-jdk`
2. Vim 7.3.885+ compiled with lua. If :echo has("lua") returns 1, then you're done; otherwise, see below.

install vim with lua e.g.
```shell
$ sudo apt-get install vim-gnome
# by install gvim you also can use vim in command
```

configration for vim

```shell
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
$ git clone git@github.com:wsdjeg/DotFiles.git ~/DotFiles
$ cp .vimrc vimrc.bak
$ cp DotFiles/vimrc .vimrc
```
Launch `vim`, run `:NeoBundleInstall`

or

Command run `vim +NeoBundleInstall +qall`

##Plugins

* [neobundle](https://github.com/Shougo/neobundle.vim)
* [unite](https://github.com/Shougo/unite.vim)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [javacomplete2](https://github.com/artur-shaik/vim-javacomplete2)
* [youcompleteme](https://github.com/Valloric/YouCompleteMe)
* [syntastic](https://github.com/scrooloose/syntastic)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [tabular](https://github.com/godlygeek/tabular)
