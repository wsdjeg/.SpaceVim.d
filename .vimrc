set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-rooter'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'benizi/vim-automkdir'
Plugin 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'taglist.vim'
Plugin 'java_getset.vim'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" 'Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"=====>设置vim编辑界面
set nu							"显示行号
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
set nobackup
set nowritebackup
set ruler
set showcmd						"命令行显示输入的命令
set showmatch					"设置匹配模式,显示匹配的括号
set showmode					"命令行显示当前vim的模式
set encoding=utf-8
set termencoding=utf-8
set scrolloff=7
set cursorline					"显示当前行
"set cursorcolumn				"显示当前列
set incsearch
set hlsearch
"===============>移动行
"nnoremap <C-S-Up> dd<Up>P
"nnoremap <C-S-Down> ddp
"vmap <C-S-Up> d<Up>P
"vmap <C-S-Down> dp
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

"===============>unite 设置
let g:unite_source_history_yank_enable = 1


"===============> indentLine 相关设置
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
"===============> vim-rooter 相关设置
let g:rooter_patterns = ['Rakefile' , 'web.xml' , '.git/']

"===============> tagbar 相关设置 映射<F2>
nmap <F2> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_left = 1

"===============> SirVer/ultisnips设置
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"===============> Emmet-vim 相关设置 映射
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsp EmmetInstall
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_mode='a'

"===============> javaComplete2 相关设置 映射
autocmd FileType java,jsp set omnifunc=javacomplete#Complete
nmap <F4> :call javacomplete#AddImport()<cr>
imap <F4> <Esc>:call javacomplete#AddImport()<cr>
"let g:JavaComplete_UseFQN = 1			"补全描述使用全类名 默认是0
"++++++> app1 补全配置
"let g:JavaComplete_LibsPath = '/home/wsdjeg/wsdjeg.github.io/java/app1/WEB-INF/classes:/home/wsdjeg/wsdjeg.github.io/lib/'
"++++++> Invoicing_System 补全配置
let g:JavaComplete_LibsPath = 'classes/:lib/:/home/wsdjeg/tools/apache-tomcat-8.0.24/lib'
let g:JavaComplete_ServerAutoShutdownTime = 300				"自动关闭javavi服务的等待时间间隔

"===============> syntastic 语法检查相关设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ==============> NerdTree 相关设置 映射按键 <F3>
let NERDTreeWinPos='right'
let NERDTreeWinSize=31
let NERDTreeChDirMode=1
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==============> Taglist相关设置 映射按键 <F8>
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  "设置ctags执行路径
let Tlist_Auto_Update=1
let Tlist_Auto_Open =0
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
map <F8> :TlistToggle<CR>

" ==============> ctags 相关设置 生成tags映射按键<F9>
nmap <F9> <Esc>:!ctags -R *<CR>
set tags+=/home/wsdjeg/wsdjeg.github.io/tags
set tags=tags
set autochdir

"===============> airline 相关设置
set laststatus=2
set t_Co=256
let g:Powerline_sybols = 'unicode'
set encoding=utf8
let g:airline#extensions#tabline#enabled = 1

" ==============> 自动补全括号
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
" ==========================================> 括号补全结束


"===========================================> 补全map
autocmd Filetype java inoremap <buffer>  .  .<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  A  A<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  B  B<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  C  C<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  D  D<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  E  E<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  F  F<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  G  G<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  H  H<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  I  I<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  J  J<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  K  K<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  L  L<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  M  M<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  N  N<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  O  O<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  P  P<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  Q  Q<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  R  R<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  S  S<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  T  T<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  U  U<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  V  V<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  W  W<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  X  X<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  Y  Y<C-X><C-O><C-P>
autocmd Filetype java inoremap <buffer>  Z  Z<C-X><C-O><C-P>

