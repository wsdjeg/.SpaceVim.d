let g:python_host_prog = '/usr/bin/python2'
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
NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/deoplete.nvim'
let s:hooks = neobundle#get_hooks("deoplete.nvim")
function! s:hooks.on_source(bundle)
	let g:deoplete#enable_at_startup = 1
endfunction
NeoBundle 'simnalamburt/vim-mundo'
NeoBundle 'artur-shaik/vim-javacomplete2'
let g:JavaComplete_UseFQN = 1
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
let g:Powerline_sybols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
syntax on
autocmd FileType java set omnifunc=javacomplete#Complete
