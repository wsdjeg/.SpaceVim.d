if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
scriptencoding utf-8
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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-launch'
NeoBundle 'osyo-manga/unite-filetype'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/neobundle-vim-recipes'
NeoBundle 'Shougo/unite-help'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'ujihisa/unite-font'
NeoBundle 't9md/vim-unite-ack'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'dyng/ctrlsf.vim'
NeoBundle 'daisuzu/unite-adb'
NeoBundle 'osyo-manga/unite-airline_themes'
NeoBundle 'mattn/unite-vim_advent-calendar'
NeoBundle 'kannokanno/unite-dwm'
NeoBundle 'raw1z/unite-projects'
NeoBundle 'voi/unite-ctags'
NeoBundle 'Shougo/unite-session'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/googlesuggest-complete-vim'
"NeoBundle 'mopp/googlesuggest-source.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'tacroe/unite-alias'
"NeoBundle 'ujihisa/quicklearn'
NeoBundle 'tex/vim-unite-id'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'felixSchl/ctrlp-unity3d-docs'
NeoBundle 'voronkovich/ctrlp-nerdtree.vim'
NeoBundle 'elentok/ctrlp-objects.vim'
NeoBundle 'h14i/vim-ctrlp-buftab'
NeoBundle 'vim-scripts/ctrlp-cmdpalette'
NeoBundle 'mattn/ctrlp-windowselector'
NeoBundle 'the9ball/ctrlp-gtags'
NeoBundle 'thiderman/ctrlp-project'
NeoBundle 'mattn/ctrlp-google'
NeoBundle 'ompugao/ctrlp-history'
NeoBundle 'pielgrzym/ctrlp-sessions'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'brookhong/k.vim'
NeoBundle 'mattn/ctrlp-launcher'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'JazzCore/ctrlp-cmatcher'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_key='<C-h>'
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"Javacomplete and autocompile
"{{{
NeoBundle 'artur-shaik/vim-javacomplete2'
"NeoBundle 'artur-shaik/vim-javacomplete2' , { 'rev' : '7aaba87' }
NeoBundle 'VJDE/VJDE'
NeoBundle 'java_getset.vim'
NeoBundle 'vim-scripts/Maven-Compiler'
"YCM
"{{{
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

let g:ycm_server_log_level = 'debug'
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'java,jsp' : ['.', '::'],
            \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>','<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:SuperTabContextDefaultCompletionType = "<c-n>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <silent> <buffer> <CR> <C-r>=MyEnterfunc()<Cr>
function MyEnterfunc()
    if pumvisible()
        return "\<esc>a"
    else
        return "\<Enter>"
    endif
endf
let g:neobundle#install_process_timeout = 1500

"}}}
NeoBundle 'vim-jp/vim-java'
autocmd! Filetype pom compiler mvn
"do not use fall class name
let g:JavaComplete_UseFQN = 0
"set the server autoshutdown time
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0
"{{{
"}}}
"}}}
NeoBundle 'bling/vim-airline'
let g:Powerline_sybols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_mode='a'
" use this two command to find how long the plugin take!
"profile start syntastic.log
"profile! file */syntastic/*
NeoBundle 'scrooloose/syntastic'
let g:syntastic_java_javac_delete_output = 0
let g:syntastic_java_javac_config_file_enabled = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '1'
let g:syntastic_warning_symbol = '2'
NeoBundle 'syngan/vim-vimlint', {
    \ 'depends' : 'ynkdir/vim-vimlparser'}
let g:syntastic_vimlint_options = { 
            \'EVL102': 1 ,
            \'EVL103': 1 ,
            \'EVL205': 1 ,
            \}
NeoBundle 'ynkdir/vim-vimlparser'
NeoBundle 'gcmt/wildfire.vim'
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'airblade/vim-rooter'
let g:rooter_patterns = ['Rakefile' , 'pom.xml' , 'web.xml' , '.git/']
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '¦'
NeoBundle 'godlygeek/tabular'
NeoBundle 'benizi/vim-automkdir'
"[c  ]c  jump between prev or next hunk
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'itchyny/calendar.vim'
"配合fcitx输入框架,在离开插入模式时自动切换到英文,在同一个缓冲区再次进入插入模式时回复到原来的输入状态
NeoBundle 'lilydjwg/fcitx.vim'
"NeoBundle 'mileszs/ack.vim'
NeoBundle 'junegunn/goyo.vim'
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  "Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


"vim Wimdows config
"{{{
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'taglist.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
NeoBundle 'majutsushi/tagbar'
let g:tagbar_width=30
let g:tagbar_left = 1
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=31
let g:NERDTreeChDirMode=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'  "设置ctags执行路径
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open =0
let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File=0
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_Menu=1
noremap <silent> <F8> :TlistToggle<CR>
noremap <silent> <F3> :NERDTreeToggle<CR>
autocmd FileType nerdtree nnoremap <silent><Space> :call OpenOrCloseNERDTree()<cr>
noremap <silent> <F2> :TagbarToggle<CR>
function! OpenOrCloseNERDTree()
    exec "normal A"
endfunction
"}}}

NeoBundle 'wsdjeg/MarkDown.pl'
autocmd filetype markdown nmap md :!~/.vim/bundle/MarkDown.pl/markdown.pl % > %.html<cr><cr>
autocmd filetype markdown nmap fi :!firefox %.html & <CR><CR>
autocmd filetype html nmap fi :!firefox % &
NeoBundle 'tomasr/molokai'
NeoBundle 'vimchina/vimcdoc'
NeoBundle 'sjl/gundo.vim'
nnoremap <silent> <F7> :GundoToggle<CR>
NeoBundle 'nerdtree-ack'
NeoBundle 'L9'
NeoBundle 'TaskList.vim'
map <unique> <Leader>td <Plug>TaskList
NeoBundle 'ianva/vim-youdao-translater'
vnoremap <silent> <C-i> <Esc>:Ydv<CR>
nnoremap <silent> <C-i> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()
"call vundle#end()
NeoBundleCheck
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" ###################################################################################
" basic vim setting                 基础设置                                        #
" ###################################################################################
"{{{
"显示相对行号
set relativenumber
" 显示行号
set number
" 自动缩进
set autoindent					"自动缩进
" 自动智能对齐
set smartindent					"设置智能对齐方式
set cindent
set linebreak					"整词换行
set tabstop=4					"Tab键的宽度
set expandtab					"用空格来执行tab
set softtabstop=4				" 统一缩进为4
set shiftwidth=4
syntax enable
syntax on
filetype on
filetype indent on
"set nobackup
set backup
set undofile
set undolevels=1000
let g:data_dir = $HOME.'/.data/'
let g:backup_dir = g:data_dir . 'backup'
let g:swap_dir = g:data_dir . 'swap'
let g:undo_dir = g:data_dir . 'undofile'
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
set showcmd						"命令行显示输入的命令
set showmatch					"设置匹配模式,显示匹配的括号
set showmode					"命令行显示当前vim的模式
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set scrolloff=7               "最低显示行数
set cursorline					"显示当前行
"set cursorcolumn				"显示当前列
set incsearch
set autowrite
set hlsearch
set laststatus=2
set t_Co=256
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"set completeopt=longest,menu
"设置molokai配色 但是颜色太丑
"colo molokai
"}}}
"全局映射
"Super paste it does not work
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
" {{{对于没有权限的文件使用 :w!!来保存
cnoremap w!! %!sudo tee > /dev/null %

" 映射Ctrl+上下左右来切换窗口
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
inoremap jk <esc>

"Ctrl+Shift+上下移动当前行
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
"上下移动选中的行
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax java inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR> |inoremap " "
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
autocmd Syntax java inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
autocmd! FileType jsp call JspFileTypeInit()
autocmd FileType html,css,jsp EmmetInstall
autocmd! FileType java call JavaFileTypeInit()
function! JspFileTypeInit()
    set tags+=/home/wsdjeg/others/openjdk-8-src/tags
    set omnifunc=javacomplete#Complete
    nnoremap <F4> :JCimportAdd<cr>
    inoremap <F4> <esc>:JCimportAddI<cr>
    compiler mvn
    if !filereadable("pom.xml")
        inoremap <F5> <esc>:w<CR>:!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
        nnoremap <F5> :!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
        nnoremap <F6> :!java -cp classes/ -Djava.ext.dirs=lib/ com.wsdjeg.util.TestMethod
        let g:JavaComplete_LibsPath = 'classes/:lib/:/home/wsdjeg/tools/apache-tomcat-8.0.24/lib'
    else
        no <F9> :make clean<CR><CR>
        no <F5> <up>:wa<CR> :make clean compile<CR><CR>
        no <F6> :make exec:exec<CR>
    endif
endfunction
function! JavaFileTypeInit()
    set tags+=/home/wsdjeg/others/openjdk-8-src/tags
    set omnifunc=javacomplete#Complete
    nnoremap <F4> :JCimportAdd<cr>
    inoremap <F4> <esc>:JCimportAddI<cr>
    inoremap <silent> <buffer>  .  <C-r>=WSDAutoComplete('.')<CR>
    inoremap <silent> <buffer>  A  <C-r>=WSDAutoComplete('A')<CR>
    inoremap <silent> <buffer>  B  <C-r>=WSDAutoComplete('B')<CR>
    inoremap <silent> <buffer>  C  <C-r>=WSDAutoComplete('C')<CR>
    inoremap <silent> <buffer>  D  <C-r>=WSDAutoComplete('D')<CR>
    inoremap <silent> <buffer>  E  <C-r>=WSDAutoComplete('E')<CR>
    inoremap <silent> <buffer>  F  <C-r>=WSDAutoComplete('F')<CR>
    inoremap <silent> <buffer>  G  <C-r>=WSDAutoComplete('G')<CR>
    inoremap <silent> <buffer>  H  <C-r>=WSDAutoComplete('H')<CR>
    inoremap <silent> <buffer>  I  <C-r>=WSDAutoComplete('I')<CR>
    inoremap <silent> <buffer>  J  <C-r>=WSDAutoComplete('J')<CR>
    inoremap <silent> <buffer>  K  <C-r>=WSDAutoComplete('K')<CR>
    inoremap <silent> <buffer>  L  <C-r>=WSDAutoComplete('L')<CR>
    inoremap <silent> <buffer>  M  <C-r>=WSDAutoComplete('M')<CR>
    inoremap <silent> <buffer>  N  <C-r>=WSDAutoComplete('N')<CR>
    inoremap <silent> <buffer>  O  <C-r>=WSDAutoComplete('O')<CR>
    inoremap <silent> <buffer>  P  <C-r>=WSDAutoComplete('P')<CR>
    inoremap <silent> <buffer>  Q  <C-r>=WSDAutoComplete('Q')<CR>
    inoremap <silent> <buffer>  R  <C-r>=WSDAutoComplete('R')<CR>
    inoremap <silent> <buffer>  S  <C-r>=WSDAutoComplete('S')<CR>
    inoremap <silent> <buffer>  T  <C-r>=WSDAutoComplete('T')<CR>
    inoremap <silent> <buffer>  U  <C-r>=WSDAutoComplete('U')<CR>
    inoremap <silent> <buffer>  V  <C-r>=WSDAutoComplete('V')<CR>
    inoremap <silent> <buffer>  W  <C-r>=WSDAutoComplete('W')<CR>
    inoremap <silent> <buffer>  X  <C-r>=WSDAutoComplete('X')<CR>
    inoremap <silent> <buffer>  Y  <C-r>=WSDAutoComplete('Y')<CR>
    inoremap <silent> <buffer>  Z  <C-r>=WSDAutoComplete('Z')<CR>
    compiler mvn
    if !filereadable("pom.xml")
        inoremap <F5> <esc>:w<CR>:!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
        nnoremap <F5> :!javac -cp classes/ -Djava.ext.dirs=lib/ -d classes/ % <CR>
        nnoremap <F6> :!java -cp classes/ -Djava.ext.dirs=lib/ com.wsdjeg.util.TestMethod
        let g:JavaComplete_LibsPath = 'classes/:lib/:/home/wsdjeg/tools/apache-tomcat-8.0.24/lib'
    else
        no <F9> :make clean<CR><CR>
        no <F5> <up>:wa<CR> :make compile<CR><CR>
        no <F6> :make exec:exec<CR>
    endif
endf
function! WSDAutoComplete(char)
    if(getline(".")=~?'^\s*.*\/\/')==0
        let line = getline('.')
        let col = col('.')
        if a:char == "."
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 2] == " "||line[col -2] == "("||line[col - 2] == ","
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return a:char
        endif
    else
        "bug exists
        let line = getline('.')
        let col = col('.')
        let [commentline,commentcol] = searchpos('//','nc','W')
        if line == getline(commentline)
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return a:char
        endif
    endif
endf
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
    else
        "Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf
"}}}
"##########
"autocmd(s)
"##########
augroup no_cursor_line_in_insert_mode
    autocmd!
    autocmd BufEnter,WinEnter,InsertLeave * set cursorline
    autocmd BufLeave,WinLeave,InsertEnter * set nocursorline
augroup END
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
noremap <silent><leader>bg :call ToggleBG()<CR>
noremap <silent><leader>nu :call ToggleNumber()<CR>
function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set nonumber
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endf
"也可以通过'za'打开或者关闭折叠
nnoremap <silent><leader><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
if has('autocmd')

    augroup ex
        au!

        " ------------------------------------------------------------------
        " Desc: Buffer
        " ------------------------------------------------------------------

        " when editing a file, always jump to the last known cursor position.
        " don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        au BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
        au BufNewFile,BufEnter * set cpoptions+=d " NOTE: ctags find the tags file from the current path instead of the path of currect file
        au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
        au BufNewFile,BufRead *.avs set syntax=avs " for avs syntax file.

        " DISABLE {
        " NOTE: will have problem with exvim, because exvim use exES_CWD as working directory for tag and other thing
        " Change current directory to the file of the buffer ( from Script#65"CD.vim"
        " au   BufEnter *   execute ":lcd " . expand("%:p:h")
        " } DISABLE end

        " ------------------------------------------------------------------
        " Desc: file types
        " ------------------------------------------------------------------

        au FileType text setlocal textwidth=78 " for all text files set 'textwidth' to 78 characters.
        au FileType c,cpp,cs,swig set nomodeline " this will avoid bug in my project with namespace ex, the vim will tree ex:: as modeline.

        " disable auto-comment for c/cpp, lua, javascript, c# and vim-script
        au FileType c,cpp,java,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
        au FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f://
        au FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
        au FileType lua set comments=f:--

        " if edit python scripts, check if have \t. ( python said: the programme can only use \t or not, but can't use them together )
        au FileType python,coffee call s:check_if_expand_tab()
    augroup END

    function! s:check_if_expand_tab()
        let has_noexpandtab = search('^\t','wn')
        let has_expandtab = search('^    ','wn')

        "
        if has_noexpandtab && has_expandtab
            let idx = inputlist ( ['ERROR: current file exists both expand and noexpand TAB, python can only use one of these two mode in one file.\nSelect Tab Expand Type:',
                        \ '1. expand (tab=space, recommended)',
                        \ '2. noexpand (tab=\t, currently have risk)',
                        \ '3. do nothing (I will handle it by myself)'])
            let tab_space = printf('%*s',&tabstop,'')
            if idx == 1
                let has_noexpandtab = 0
                let has_expandtab = 1
                silent exec '%s/\t/' . tab_space . '/g'
            elseif idx == 2
                let has_noexpandtab = 1
                let has_expandtab = 0
                silent exec '%s/' . tab_space . '/\t/g'
            else
                return
            endif
        endif

        "
        if has_noexpandtab == 1 && has_expandtab == 0
            echomsg 'substitute space to TAB...'
            set noexpandtab
            echomsg 'done!'
        elseif has_noexpandtab == 0 && has_expandtab == 1
            echomsg 'substitute TAB to space...'
            set expandtab
            echomsg 'done!'
        else
            " it may be a new file
            " we use original vim setting
        endif
    endfunction
endif



" Unite: {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {'no_split':1, 'resize':0})


"" ------------  define custom action -------------------------------------------
"" file_association
"let s:file_association = {
"\   'description' : 'open withd file associetion'
"\    , 'is_selectable' : 1
"\    }

"function! s:file_association.func(candidates)
    "for l:candidate in a:candidates
        "" .vimrcに関数の定義有り
        "call OpenFileAssociation(l:candidate.action__path)
    "endfor
"endfunction

"call unite#custom_action('openable', 'file_association', s:file_association)
"unlet s:file_association



"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
"let g:unite_enable_split_vertically = 1

let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 6
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_data_directory='~/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='>> '
let g:unite_split_rule = 'botright'
let g:unite_winheight=25
let g:unite_source_grep_default_opts = "-iRHn"
            \ . " --exclude='tags'"
            \ . " --exclude='cscope*'"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.log*'"
            \ . " --exclude='*tmp*'"
            \ . " --exclude-dir='**/tmp'"
            \ . " --exclude-dir='CVS'"
            \ . " --exclude-dir='.svn'"
            \ . " --exclude-dir='.git'"
            \ . " --exclude-dir='node_modules'"


let g:unite_launch_apps = [
      \ 'rake',
      \ 'make',
      \ 'git pull',
      \ 'git push']

if executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif


if executable('ag')
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup -S'
let g:unite_source_grep_recursive_opt=''
endif
let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt in unite grep source.
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif

" For ack.
if executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif
""" my custom unite config
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <silent> <C-f> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <leader>m :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <silent> <C-b> :<C-u>Unite -start-insert -buffer-name=buffer buffer<cr>

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
            \ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
            \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>

nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>


nnoremap <silent> [unite]fr
            \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
            \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
            \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]w
            \ :<C-u>Unite -buffer-name=files -no-split
            \ jump_point file_point buffer_tab
            \ file_rec:! file file/new<CR>

" Start insert.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1
"\ })

" Like ctrlp.vim settings.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1,
"\   'winheight': 10,
"\   'direction': 'botright',
"\ })

" Prompt choices.
"call unite#custom#profile('default', 'context', {
"\   'prompt': '>> ',
"\ })



" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.

    " Play nice with supertab
    let b:SuperTabDisabled=1
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-n>   <Plug>(unite_select_next_line)
    nmap <buffer> <C-n>   <Plug>(unite_select_next_line)
    imap <buffer> <C-p>   <Plug>(unite_select_previous_line)
    nmap <buffer> <C-p>   <Plug>(unite_select_previous_line)


    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
                \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    imap <buffer> <C-e>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
                \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
                \ empty(unite#mappings#get_current_filters()) ?
                \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')



endfunction"}}}



""" end for my custom unite config


"" File search

"nnoremap <silent><C-p> :Unite -no-split -start-insert file_rec buffer<CR>
"nnoremap <leader>mm :Unite -auto-resize file file_mru file_rec<cr>
nnoremap <leader>mm :Unite   -no-split -start-insert   file file_mru file_rec buffer<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>tf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>mr :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>tb :<C-u>Unite -no-split -buffer-name=buffer_tab  buffer_tab<cr>

"" shortcup for key mapping
nnoremap <silent><leader>u  :<C-u>Unite -start-insert mapping<CR>

"" Execute help.
nnoremap <silent><leader>h  :Unite -start-insert -no-split help<CR>
" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"" Tag search

""" For searching the word in the cursor in tag file
nnoremap <silent><leader>f :Unite -no-split tag/include:<C-R><C-w><CR>

nnoremap <silent><leader>ff :Unite tag/include -start-insert -no-split<CR>

"" grep dictionay

""" For searching the word in the cursor in the current directory
nnoremap <silent><leader>v :Unite -auto-preview -no-split grep:.::<C-R><C-w><CR>

nnoremap <space>/ :Unite -auto-preview grep:.<cr>

""" For searching the word handin
nnoremap <silent><leader>vs :Unite -auto-preview -no-split grep:.<CR>

""" For searching the word in the cursor in the current buffer
noremap <silent><leader>vf :Unite -auto-preview -no-split grep:%::<C-r><C-w><CR>

""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>va :Unite -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>


"" outline
"nnoremap <leader>o :Unite -start-insert -no-split outline<CR>

nnoremap <leader>o :<C-u>Unite -buffer-name=outline   -start-insert -auto-preview -no-split outline<cr>
"" Line search
nnoremap <leader>l :Unite line -start-insert  -auto-preview -no-split<CR>

"" Yank history
nnoremap <leader>y :<C-u>Unite -no-split -auto-preview -buffer-name=yank history/yank<cr>
"nnoremap <space>y :Unite history/yank<cr>


" search plugin
" :Unite neobundle/search



nnoremap <space>s :Unite -quick-match -auto-preview buffer<cr>


"for Unite menu{

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
    \ 'description' : '            gestionar repositorios git
        \                            ⌘ [espacio]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git status       (Fugitive)                                ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff         (Fugitive)                                ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit       (Fugitive)                                ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log          (Fugitive)                                ⌘ ,gl',
        \'exe "silent Glog | Unite quickfix"'],
    \['▷ git blame        (Fugitive)                                ⌘ ,gb',
        \'Gblame'],
    \['▷ git stage        (Fugitive)                                ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout     (Fugitive)                                ⌘ ,go',
        \'Gread'],
    \['▷ git rm           (Fugitive)                                ⌘ ,gr',
        \'Gremove'],
    \['▷ git mv           (Fugitive)                                ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        \'Git! pull'],
    \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git cd           (Fugitive)',
        \'Gcd'],
    \]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>

"}
"}}}



"for gtags-cscope {{{
"" settings of cscope.
"" I use GNU global instead cscope because global is faster.
"set cscopetag
"set cscopeprg=gtags-cscope
"cs add /home/chenchunsheng/qc4.4_20140513/GTAGS

"set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
"nmap <silent> <leader>vj <ESC>:cstag <c-r><c-w><CR>
"nmap <silent> <leader>vc <ESC>:lcs f c <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vd <ESC>:lcs f d <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>ve <ESC>:lcs f e <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vf <ESC>:lcs f f <C-R>=expand("<cfile>")<cr><cr>
"nmap <silent> <leader>vg <ESC>:lcs f g <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vi <ESC>:lcs f i <C-R>=expand("<cfile>")<cr><cr>
"nmap <silent> <leader>vs <ESC>:lcs f s <C-R>=expand("<cword>")<cr><cr>
"nmap <silent> <leader>vt <ESC>:lcs f t <C-R>=expand("<cword>")<cr><cr>
"command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
"au VimEnter * call VimEnterCallback()
"au BufAdd *.[ch] call FindGtags(expand('<afile>'))
"au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))
  
"function! FindFiles(pat, ...)
     "let path = ''
     "for str in a:000
         "let path .= str . ','
     "endfor
  
     "if path == ''
         "let path = &path
     "endif
  
     "echo 'finding...'
     "redraw
     "call append(line('$'), split(globpath(path, a:pat), '\n'))
     "echo 'finding...done!'
     "redraw
 "endfunc
  
"function! VimEnterCallback()
     "for f in argv()
         "if fnamemodify(f, ':e') != 'c' && fnamemodify(f, ':e') != 'h'
             "continue
         "endif
  
         "call FindGtags(f)
     "endfor
"endfunc
  
"function! FindGtags(f)
     "let dir = fnamemodify(a:f, ':p:h')
     "while 1
         "let tmp = dir . '/GTAGS'
         "if filereadable(tmp)
             "exe 'cs add ' . tmp . ' ' . dir
             "break
         "elseif dir == '/'
             "break
         "endif
  
         "let dir = fnamemodify(dir, ":h")
     "endwhile
"endfunc
  
"function! UpdateGtags(f)
     "let dir = fnamemodify(a:f, ':p:h')
     "exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
"endfunction
"}}}

"for unite-gtags {{{

nnoremap <leader>gd :execute 'Unite  -auto-preview -start-insert -no-split  gtags/def:'.expand('<cword>')<CR>
nnoremap <leader>gc :execute 'Unite  -auto-preview -start-insert -no-split gtags/context'<CR>
nnoremap <leader>gr :execute 'Unite  -auto-preview -start-insert -no-split gtags/ref'<CR>
nnoremap <leader>gg :execute 'Unite  -auto-preview -start-insert -no-split gtags/grep'<CR>
nnoremap <leader>gp :execute 'Unite  -auto-preview -start-insert -no-split gtags/completion'<CR>
vnoremap <leader>gd <ESC>:execute 'Unite -auto-preview -start-insert -no-split gtags/def:'.GetVisualSelection()<CR>

let g:unite_source_gtags_project_config = {
  \ '_':                   { 'treelize': 0 }
  \ }
" specify your project path as key.
" '_' in key means default configuration.
" }}}

"for vimfiler {{{
let g:vimfiler_as_default_explorer = 1

"}}}

"for quicklearn {{{
"nnoremap <space>R :<C-u>Unite quicklearn -immediately<Cr>
"}}}

"for buftabs {{{
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
"}}}

"for taghighlight {{{
"
""let s:plugin_paths = split(globpath(&rtp, 'plugin/TagHighlight/TagHighlight.py'), '\n') --> in taghighlight.vim
""let s:plugin_paths = split('~/.vim/bundle/TagHighlight/plugin/TagHighlight/TagHighlight.py', '\n')
"
"
"hi Class                ctermfg=205   cterm=bold
"hi Structure            ctermfg=205   cterm=bold
"hi DefinedName          ctermfg=49    cterm=bold
"hi Member              ctermfg=244
"hi Label                   ctermfg=21    cterm=bold
"hi EnumerationName      ctermfg=19
"hi EnumerationValue     ctermfg=57
"hi LocalVariable        ctermfg=100
"hi GlobalVariable       ctermfg=93

"}}}


" CtrlSF {{{
"nnoremap <C-F> :CtrlSF<space>
"nmap <Leader>cf :CtrlSF <c-r><c-w><CR>
"nmap <Leader>csf :CtrlSFOpen<CR>
"}}}

" for codesearch{{{
" Make search case insensitive
let g:unite_source_codesearch_ignore_case = 1
call unite#custom#source('codesearch', 'max_candidates', 30)

"}}}

"webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\   'cn': {
\     'url': 'http://www.iciba.com/%s',
\   },
\   'wikipedia:en':{'url': 'http://en.wikipedia.org/wiki/%s',  },
\   'bing':{'url': 'http://cn.bing.com/search?q=%s', },
\ }


"デフォルトサイト
let g:ref_source_webdict_sites.default = 'cn'
"let g:ref_source_webdict_cmd='lynx -dump -nonumbers %s'
"let g:ref_source_webdict_cmd='w3m -dump %s'
"出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.ej.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
function! g:ref_source_webdict_sites.wiki.filter(output)
  return join(split(a:output, "\n")[17 :], "\n")
endfunction

nmap <Leader>rj :<C-u>Ref webdict je<Space>
nmap <Leader>re :<C-u>Ref webdict ej<Space>
nmap <Leader>rc :<C-u>Ref webdict cn<Space>
nmap <Leader>rw :<C-u>Ref webdict wikipedia:en<Space>
nmap <Leader>rb :<C-u>Ref webdict bing<Space>

"}}}
" Man.vim {{{
source $VIMRUNTIME/ftplugin/man.vim
nnoremap <C-K> :Man 3 <C-R>=expand("<cword>")<CR><CR>
inoremap <C-K> <ESC>:Man 3 <C-R>=expand("<cword>")<CR><CR>
"}}}
"for open-browser {{{
" This is my setting. 
let g:netrw_nogx = 1 " disable netrw's gx mapping. 
"nmap gx <Plug>(openbrowser-smart-search) 
"vmap gx <Plug>(openbrowser-smart-search) 


"" Open URI under cursor. 
nmap go <Plug>(openbrowser-open) 
"" Open selected URI. 
vmap go <Plug>(openbrowser-open) 

" Search word under cursor. 
nmap gs <Plug>(openbrowser-search) 
" Search selected word. 
vmap gs <Plug>(openbrowser-search) 

" If it looks like URI, Open URI under cursor. 
" Otherwise, Search word under cursor. 
nmap gx <Plug>(openbrowser-smart-search) 
" If it looks like URI, Open selected URI. 
" Otherwise, Search selected word. 
vmap gx <Plug>(openbrowser-smart-search) 

vnoremap gob :OpenBrowser http://www.baidu.com/s?wd=<C-R>=expand("<cword>")<cr><cr>
nnoremap gob :OpenBrowser http://www.baidu.com/s?wd=<C-R>=expand("<cword>")<cr><cr>

vnoremap gog :OpenBrowser http://www.google.com/?#newwindow=1&q=<C-R>=expand("<cword>")<cr><cr>
nnoremap gog :OpenBrowser http://www.google.com/?#newwindow=1&q=<C-R>=expand("<cword>")<cr><cr>

vnoremap goi :OpenBrowserSmartSearch http://www.iciba.com/<C-R>=expand("<cword>")<cr><cr>
nnoremap goi :OpenBrowserSmartSearch http://www.iciba.com/<C-R>=expand("<cword>")<cr><cr>
" In command-line 
":OpenBrowser http://google.com/ 
":OpenBrowserSearch ggrks 
":OpenBrowserSmartSearch http://google.com/ 
":OpenBrowserSmartSearch ggrks 
"}}}
" comment for ctrlp {{{
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_root_markers = '.projectile'

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
let g:ctrlp_show_hidden = 1
"for caching
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"set runtimepath^=~/.vim/bundle/ctrlp.vim 
"let g:ctrlp_map = ',,'
"let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|png|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"let g:ctrlp_user_command = {
    "\ 'types': {
        "\ 1: ['.git', 'cd %s && git ls-files'],
        "\ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "\ },
    "\ 'fallback': 'find %s -type f'
    "\ }

"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      "\ --ignore out
      "\ --ignore .git
      "\ --ignore .svn
      "\ --ignore .hg
      "\ --ignore .DS_Store
      "\ --ignore "**/*.pyc"
      "\ -g ""'
      

let g:ctrlp_user_command = {
    \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
    \ 'fallback': 'ag %s -i --nocolor --nogroup --hidden
                    \ --ignore out
                    \ --ignore .git
                    \ --ignore .svn
                    \ --ignore .hg
                    \ --ignore .DS_Store
                    \ --ignore "**/*.pyc"
                    \ -g ""'
    \ }

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }


nnoremap <Leader>kk :CtrlPMixed<Cr>

"}}}

" comment for ctrlp-funky {{{
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
" }}}

"for ctrlp_nerdtree {{{
let g:ctrlp_nerdtree_show_hidden = 1
"}}}

"for ctrlp_sessions{{{
let g:ctrlp_extensions = ['funky', 'sessions' , 'k' , 'tag', 'mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']
"}}}


"for k.vim {{{
nnoremap <silent> <leader>qe :CtrlPK<CR>
"}}}

" for ctrlp-launcher {{{
nnoremap <Leader>pl :<c-u>CtrlPLauncher<cr>
"}}}

"for ctrlp-cmatcher {{{

"let g:ctrlp_max_files = 0
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

"}}}

"for fzf {{{
set rtp+=~/.fzf
nnoremap <Leader>fz :FZF<CR>
"}}}

"for vim-fasd.vim {{{
nnoremap <Leader>z :Z<CR>
"}}}

"for ctrlp-z {{{
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>
"}}}
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    "autocmd FileType vim no za :call Fold_This_Vim_File()
    function Fold_This_Vim_File()
        if &foldenable==0
            setlocal foldmethod=marker
            execute "foldclose"
        else
            echo "1"
        endif

    endf
augroup END
let g:user_emmet_settings = {
            \  'jsp' : {
            \      'extends' : 'html',
            \  },
            \}
