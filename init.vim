let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
if 0 | endif
if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif
	set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'artur-shaik/vim-javacomplete2'
let g:JavaComplete_UseFQN = 1
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
syntax on
autocmd FileType java set omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-Add)
imap <F4> <Plug>(JavaComplete-Imports-Add)
nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
imap <F5> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
