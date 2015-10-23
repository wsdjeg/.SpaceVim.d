# INSTALL

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
