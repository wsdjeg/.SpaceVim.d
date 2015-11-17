syntax on
filetype off
let g:python3_host_prog = '/usr/bin/python3'
set rtp+=~/.config/nvim/bundle/Vundle.vim/
call vundle#begin("~/.config/nvim/bundle/")
Plugin 'VundleVim/Vundle.vim'
Plugin 'DonnieWest/VimStudio'
call vundle#end()
filetype plugin indent on
