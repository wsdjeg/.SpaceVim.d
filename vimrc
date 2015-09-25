" Let NeoBundle manage NeoBundle
" {{{
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" }}}
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


nnoremap <space>/ :Unite grep:.<cr>
nnoremap <silent> <C-f> :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <leader>m :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <silent> <C-b> :<C-u>Unite -start-insert -buffer-name=buffer buffer<cr>
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


NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_key='<C-h>'
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-k>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
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
"Javacomplete and autocompile
"{{{
NeoBundle 'artur-shaik/vim-javacomplete2'
NeoBundle 'VJDE/VJDE'
NeoBundle 'java_getset.vim'
NeoBundle 'vim-scripts/Maven-Compiler'
"YCM
"{{{
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
"i want to add a function that manage the <enter>
"if ultisnips pumvisible exists, call the ultisnips func
"inoremap <expr><CR> 11
"<c-r>=MyEnterfunc()<cr>
function MyEnterfunc()
    if '1'
        return '1'
    else
        return "\<Enter>"
    endif
endf
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
            \   'java' : ['.', '::'],
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
let g:ycm_seed_identifiers_with_syntax=1
let g:SuperTabContextDefaultCompletionType = "<c-n>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
let g:neobundle#install_process_timeout = 1500

"}}}
NeoBundle 'vim-jp/vim-java'
autocmd! Filetype pom compiler mvn
"do not use fall class name
let g:JavaComplete_UseFQN = 1
"set the server autoshutdown time
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0
"{{{
autocmd! FileType java call JavaFileTypeInit()
function! JavaFileTypeInit()
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
        elseif line[col - 2] == " "||line[col -2] == "("
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
"}}}
"}}}
NeoBundle 'bling/vim-airline'
let g:Powerline_sybols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsp EmmetInstall
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_mode='a'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_java_javac_delete_output=0
let g:syntastic_java_javac_config_file_enabled = 1
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
noremap <silent> <F2> :TagbarToggle<CR>
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
vnoremap <silent> <C-T> <Esc>:Ydv<CR>
nnoremap <silent> <C-T> <Esc>:Ydc<CR>
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
"基础设置
"{{{
set relativenumber				"显示行号
set nu
set autoindent					"自动缩进
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
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set scrolloff=0               "最低显示行数
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
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
autocmd Syntax java inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
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
noremap <leader>bg :call ToggleBG()<CR>
function! ToggleNumber()

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

