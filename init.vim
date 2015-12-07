"nvim requilment
"sudo apt-get intsall xclip
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
    let g:deoplete#data_directory='~/.cache/deoplete'
    let g:acp_enableAtStartup = 0
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_fuzzy_completion = 1
    " Set minimum syntax keyword length.
    let g:deoplete#sources#syntax#min_keyword_length = 3
    let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
    " Define dictionary.
    let g:deoplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }
    " Define keyword.
    if !exists('g:deoplete#keyword_patterns')
        let g:deoplete#keyword_patterns = {}
    endif
    let g:deoplete#keyword_patterns['default'] = '\h\w*'


    " AutoComplPop like behavior.
    let g:deoplete#enable_auto_select = 0

    if !exists('g:deoplete#sources#omni#input_patterns')
        let g:deoplete#sources#omni#input_patterns = {}
    endif

    let g:deoplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:deoplete#sources#omni#input_patterns.java = '[^. *\t]\.\w*\|\h\w*::'
    let g:deoplete#force_omni_input_patterns = {}
    "let g:deoplete#force_omni_input_patterns.java = '^\s*'
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h>
                \ deolete#mappings#smart_close_popup()."\<C-h>"
    inoremap <expr><BS>
                \ deoplete#mappings#smart_close_popup()."\<C-h>"    
    inoremap <expr><C-y>  deoplete#close_popup()
    inoremap <expr><C-e>  deoplete#cancel_popup()
endfunction
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neopairs.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim' "{{{
let g:neosnippet#snippets_directory='~/DotFiles/snippets'
let g:neosnippet#enable_snipmate_compatibility=1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
NeoBundle 'Shougo/vimfiler.vim'
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
set relativenumber
" 显示行号
set number
" 自动缩进
set autoindent
" 自动智能对齐
set smartindent
" 状态栏预览命令
set wildmenu
set cindent
"整词换行
set linebreak
"Tab键的宽度
set tabstop=4
"用空格来执行tab
set expandtab
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
"set nobackup
set backup
set undofile
set undolevels=1000
let g:data_dir = $HOME.'/.data/'
let g:backup_dir = g:data_dir . 'nvimbackup'
let g:swap_dir = g:data_dir . 'nvimswap'
let g:undo_dir = g:data_dir . 'nvimundofile'
if finddir(g:data_dir) == ''
    silent call mkdir(g:data_dir)
endif
if finddir(g:backup_dir) == ''
    silent call mkdir(g:backup_dir)
endif
if finddir(g:swap_dir) == ''
    silent call mkdir(g:swap_dir)
endif
if finddir(g:undo_dir) == ''
    silent call mkdir(g:undo_dir)
endif
unlet g:backup_dir
unlet g:swap_dir
unlet g:data_dir
unlet g:undo_dir
set undodir=$HOME/.data/undofile
set backupdir=$HOME/.data/backup
set directory=$HOME/.data/swap
set nofoldenable                "关闭自动折叠 折叠按键 'za'
set nowritebackup
set matchtime=0
set ruler
set showcmd                     "命令行显示输入的命令
set showmatch                   "设置匹配模式,显示匹配的括号
set showmode                    "命令行显示当前vim的模式
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set scrolloff=7               "最低显示行数
set cursorline                  "显示当前行
"set cursorcolumn               "显示当前列
set incsearch
set autowrite
set hlsearch
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set completeopt=longest,menu
