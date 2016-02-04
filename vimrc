if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif
"detect OS {{{
function! OSX()
    return has('macunix')
endfunction
function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
function! WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction
"}}}

"use English for anything in vim
if WINDOWS()
    silent exec 'language english'
elseif OSX()
    silent exec 'language en_US'
else
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " in mac-terminal
        silent exec 'language en_US'
    else
        " in linux-terminal
        silent exec 'language en_US.utf8'
    endif
endif

if WINDOWS()
    let s:Psep = ';'
    let s:Fsep = '\'
else
    let s:Psep = ':'
    let s:Fsep = '/'
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
"vim settings {{{
"initialize default settings
let s:settings = {}
let s:settings.default_indent = 2
let s:settings.max_column = 120
let s:settings.auto_download_neobundle = 0
let s:settings.neobundle_installed = 0
let s:settings.plugin_bundle_dir = join([$HOME,'.vim','bundle',''],s:Fsep)
let s:settings.autocomplete_method = ''
let s:settings.enable_cursorcolumn = 0
let s:settings.enable_neomake = 1
let s:settings.enable_ycm = 0
let s:settings.enable_neocomplcache = 0
let s:settings.enable_cursorline = 0
let s:settings.use_colorscheme = 1
let s:settings.vim_help_language='en'
let s:settings.colorscheme = 'gruvbox'
let s:settings.colorscheme_default  = 'desert'
let s:settings.filemanager = 'vimfiler'
let s:settings.plugin_groups_exclude = []
let g:Vimrc_Home = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'. s:Fsep. '?')


"core vimrc
let s:settings.plugin_groups = []
call add(s:settings.plugin_groups, 'web')
call add(s:settings.plugin_groups, 'javascript')
call add(s:settings.plugin_groups, 'ruby')
call add(s:settings.plugin_groups, 'python')
call add(s:settings.plugin_groups, 'scala')
call add(s:settings.plugin_groups, 'go')
call add(s:settings.plugin_groups, 'scm')
call add(s:settings.plugin_groups, 'editing')
call add(s:settings.plugin_groups, 'indents')
call add(s:settings.plugin_groups, 'navigation')
call add(s:settings.plugin_groups, 'misc')

call add(s:settings.plugin_groups, 'core')
call add(s:settings.plugin_groups, 'unite')
call add(s:settings.plugin_groups, 'ctrlp')
call add(s:settings.plugin_groups, 'autocomplete')


if s:settings.vim_help_language == 'cn'
    call add(s:settings.plugin_groups, 'chinese')
endif
if s:settings.use_colorscheme==1
    call add(s:settings.plugin_groups, 'colorscheme')
endif
if OSX()
    call add(s:settings.plugin_groups, 'osx')
endif
if WINDOWS()
    call add(s:settings.plugin_groups, 'windows')
endif
if LINUX()
    call add(s:settings.plugin_groups, 'linux')
endif

if has('nvim')
    let s:settings.autocomplete_method = 'deoplete'
elseif has('lua')
    let s:settings.autocomplete_method = 'neocomplete'
else
    let s:settings.autocomplete_method = 'neocomplcache'
endif
if s:settings.enable_ycm
    let s:settings.autocomplete_method = 'ycm'
endif
if s:settings.enable_neocomplcache
    let s:settings.autocomplete_method = 'neocomplcache'
endif

for s:group in s:settings.plugin_groups_exclude
    let s:i = index(s:settings.plugin_groups, s:group)
    if s:i != -1
        call remove(s:settings.plugin_groups, s:i)
    endif
endfor

"}}}
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"setup & neobundle {{{
if filereadable(expand(s:settings.plugin_bundle_dir) . 'neobundle.vim'. s:Fsep. 'README.md')
    let s:settings.neobundle_installed = 1
else
    if executable('git')
        exec '!git clone https://github.com/Shougo/neobundle.vim ' . s:settings.plugin_bundle_dir . 'neobundle.vim'
        let s:settings.neobundle_installed = 1
    endif
endif
if s:settings.neobundle_installed
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand($HOME.'/.vim/bundle/'))
    scriptencoding utf-8
    NeoBundleFetch 'Shougo/neobundle.vim'
    "}}}

    " plugin/mapping configuration {{{
    if count(s:settings.plugin_groups, 'core') "{{{
        NeoBundle 'Shougo/vimproc.vim', {
                    \ 'build' : {
                    \     'windows' : 'tools\\update-dll-mingw',
                    \     'cygwin' : 'make -f make_cygwin.mak',
                    \     'mac' : 'make -f make_mac.mak',
                    \     'linux' : 'make',
                    \     'unix' : 'gmake',
                    \    },
                    \ }
    endif "}}}

    if count(s:settings.plugin_groups, 'unite') "{{{
        NeoBundle 'Shougo/unite.vim'
        if neobundle#tap('unite.vim')
            let s:hooks = neobundle#get_hooks('unite.vim')
            func! s:hooks.on_source(bundle) abort
                " for codesearch{{{
                " Make search case insensitive
                let g:unite_source_codesearch_ignore_case = 1
                call unite#custom#source('codesearch', 'max_candidates', 30)
                "" Unite: {{{

                "call unite#filters#matcher_default#use(['matcher_fuzzy'])
                "call unite#filters#sorter_default#use(['sorter_rank'])
                "call unite#custom#profile('default', 'context', {'no_split':1, 'resize':0})

                let g:unite_source_file_mru_time_format = "%m/%d %T "
                let g:unite_source_directory_mru_limit = 80
                let g:unite_source_directory_mru_time_format = "%m/%d %T "
                let g:unite_source_file_rec_max_depth = 6
                let g:unite_enable_ignore_case = 1
                let g:unite_enable_smart_case = 1
                let g:unite_data_directory='~/.cache/unite'
                "let g:unite_enable_start_insert=1
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


                let g:unite_source_grep_max_candidates = 200
                if executable('hw')
                    " Use hw (highway)
                    " https://github.com/tkengo/highway
                    let g:unite_source_grep_command = 'hw'
                    let g:unite_source_grep_default_opts = '--no-group --no-color'
                    let g:unite_source_grep_recursive_opt = ''
                elseif executable('ag')
                    " Use ag (the silver searcher)
                    " https://github.com/ggreer/the_silver_searcher
                    let g:unite_source_grep_command = 'ag'
                    let g:unite_source_grep_default_opts =
                                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
                    let g:unite_source_grep_recursive_opt = ''
                elseif executable('pt')
                    " Use pt (the platinum searcher)
                    " https://github.com/monochromegane/the_platinum_searcher
                    let g:unite_source_grep_command = 'pt'
                    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
                    let g:unite_source_grep_recursive_opt = ''
                elseif executable('ack-grep')
                    " Use ack
                    " http://beyondgrep.com/
                    let g:unite_source_grep_command = 'ack-grep'
                    let g:unite_source_grep_default_opts =
                                \ '-i --no-heading --no-color -k -H'
                    let g:unite_source_grep_recursive_opt = ''
                elseif executable('ack')
                    let g:unite_source_grep_command = 'ack'
                    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
                    let g:unite_source_grep_recursive_opt = ''
                elseif executable('jvgrep')
                    " Use jvgrep
                    " https://github.com/mattn/jvgrep
                    let g:unite_source_grep_command = 'jvgrep'
                    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
                    let g:unite_source_grep_recursive_opt = '-R'
                endif

                nnoremap <leader>gd :execute 'Unite  -auto-preview -start-insert -no-split  gtags/def:'.expand('<cword>')<CR>
                nnoremap <leader>gc :execute 'Unite  -auto-preview -start-insert -no-split gtags/context'<CR>
                nnoremap <leader>gr :execute 'Unite  -auto-preview -start-insert -no-split gtags/ref'<CR>
                nnoremap <leader>gg :execute 'Unite  -auto-preview -start-insert -no-split gtags/grep'<CR>
                nnoremap <leader>gp :execute 'Unite  -auto-preview -start-insert -no-split gtags/completion'<CR>
                vnoremap <leader>gd <ESC>:execute 'Unite -auto-preview -start-insert -no-split gtags/def:'.GetVisualSelection()<CR>

                let g:unite_source_gtags_project_config = {
                            \ '_':                   { 'treelize': 0 }
                            \ }
                "" File search
                "Ctrlsf
                nmap <C-F>f <Plug>CtrlSFPrompt
                vmap <C-F>f <Plug>CtrlSFVwordPath
                vmap <C-F>F <Plug>CtrlSFVwordExec
                nmap <C-F>n <Plug>CtrlSFCwordPath
                nmap <C-F>p <Plug>CtrlSFPwordPath
                nnoremap <C-F>o :CtrlSFOpen<CR>
                nnoremap <C-F>t :CtrlSFToggle<CR>
                inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

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
                nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
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

                nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
                " The prefix key.
                nnoremap    [unite]   <Nop>
                nmap    f [unite]
                nnoremap <space>/ :Unite grep:.<cr>
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
            endf
        endif
        NeoBundle 'Shougo/neoyank.vim'
        NeoBundle 'soh335/unite-qflist'
        NeoBundle 'ujihisa/unite-equery'
        NeoBundle 'm2mdas/unite-file-vcs'
        NeoBundle 'Shougo/neomru.vim'
        NeoBundle 'kmnk/vim-unite-svn'
        NeoBundle 'basyura/unite-rails'
        NeoBundle 'nobeans/unite-grails'
        NeoBundle 'choplin/unite-vim_hacks'
        NeoBundle 'mattn/webapi-vim'
        NeoBundle 'mattn/wwwrenderer-vim'
        NeoBundle 'thinca/vim-openbuf'
        NeoBundle 'ujihisa/unite-haskellimport'
        NeoBundle 'oppara/vim-unite-cake'
        "NeoBundle 'Sixeight/unite-grep'
        "NeoBundle 't9md/vim-unite-lines'
        NeoBundle 'thinca/vim-ref'
        if neobundle#tap('vim-ref')
            let s:hooks = neobundle#get_hooks('vim-ref')
            func! s:hooks.on_source(bundle) abort
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
                "Default site
                let g:ref_source_webdict_sites.default = 'cn'
                "let g:ref_source_webdict_cmd='lynx -dump -nonumbers %s'
                "let g:ref_source_webdict_cmd='w3m -dump %s'
                "The filter on the output. Remove the first few lines
                function! g:ref_source_webdict_sites.je.filter(output)
                    return join(split(a:output, "\n")[15 :], "\n")
                endfunction
                function! g:ref_source_webdict_sites.ej.filter(output)
                    return join(split(a:output, "\n")[15 :], "\n")
                endfunction
                function! g:ref_source_webdict_sites.wiki.filter(output)
                    return join(split(a:output, "\n")[17 :], "\n")
                endfunction
                nnoremap <Leader>rj :<C-u>Ref webdict je<Space>
                nnoremap <Leader>re :<C-u>Ref webdict ej<Space>
                nnoremap <Leader>rc :<C-u>Ref webdict cn<Space>
                nnoremap <Leader>rw :<C-u>Ref webdict wikipedia:en<Space>
                nnoremap <Leader>rb :<C-u>Ref webdict bing<Space>
            endf
        endif
        NeoBundle 'heavenshell/unite-zf'
        NeoBundle 'heavenshell/unite-sf2'
        NeoBundle 'Shougo/unite-outline'
        NeoBundle 'hewes/unite-gtags'
        NeoBundle 'tsukkee/unite-tag'
        NeoBundle 'ujihisa/unite-launch'
        NeoBundle 'ujihisa/unite-gem'
        NeoBundle 'osyo-manga/unite-filetype'
        NeoBundle 'thinca/vim-unite-history'
        NeoBundle 'Shougo/neobundle-vim-recipes'
        NeoBundle 'Shougo/unite-help'
        NeoBundle 'ujihisa/unite-locate'
        NeoBundle 'kmnk/vim-unite-giti'
        NeoBundle 'ujihisa/unite-font'
        NeoBundle 't9md/vim-unite-ack'
        NeoBundle 'mileszs/ack.vim'
        NeoBundle 'albfan/ag.vim'
        let g:ag_prg="ag  --vimgrep"
        let g:ag_working_path_mode="r"
        NeoBundle 'dyng/ctrlsf.vim'
        NeoBundle 'daisuzu/unite-adb'
        NeoBundle 'osyo-manga/unite-airline_themes'
        NeoBundle 'mattn/unite-vim_advent-calendar'
        NeoBundle 'mattn/unite-remotefile'
        NeoBundle 'sgur/unite-everything'
        NeoBundle 'kannokanno/unite-dwm'
        NeoBundle 'raw1z/unite-projects'
        NeoBundle 'voi/unite-ctags'
        NeoBundle 'Shougo/unite-session'
        NeoBundle 'osyo-manga/unite-quickfix'
        NeoBundle 'Shougo/vimfiler'
        if neobundle#tap('vimfiler')
            let s:hooks = neobundle#get_hooks("vimfiler")
            function! s:hooks.on_source(bundle) abort
                let g:vimfiler_as_default_explorer = 1
                let g:vimfiler_restore_alternate_file = 1
                let g:vimfiler_tree_indentation = 1
                let g:vimfiler_tree_leaf_icon = ''
                let g:vimfiler_tree_opened_icon = '▼'
                let g:vimfiler_tree_closed_icon = '▷'
                let g:vimfiler_file_icon = ''
                let g:vimfiler_readonly_file_icon = '*'
                let g:vimfiler_marked_file_icon = '√'
                "let g:vimfiler_preview_action = 'auto_preview'
                let g:vimfiler_ignore_pattern =
                            \ '^\%(\.git\|\.idea\|\.DS_Store\|\.vagrant\|.stversions'
                            \ .'\|node_modules\|.*\.pyc\)$'

                if has('mac')
                    let g:vimfiler_quick_look_command =
                                \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
                else
                    let g:vimfiler_quick_look_command = 'gloobus-preview'
                endif

                call vimfiler#custom#profile('default', 'context', {
                            \ 'explorer' : 1,
                            \ 'winwidth' : 30,
                            \ 'winminwidth' : 30,
                            \ 'toggle' : 1,
                            \ 'columns' : 'type',
                            \ 'auto_expand': 1,
                            \ 'direction' : 'rightbelow',
                            \ 'parent': 0,
                            \ 'explorer_columns' : 'type',
                            \ 'status' : 1,
                            \ 'safe' : 0,
                            \ 'split' : 1,
                            \ 'hidden': 1,
                            \ 'no_quit' : 1,
                            \ 'force_hide' : 0,
                            \ })
                autocmd FileType vimfiler call s:vimfilerinit()
                "autocmd VimEnter * if !argc() | VimFiler | endif
                autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
                            \ q | endif
                function! s:vimfilerinit()
                    set nonumber
                    set norelativenumber
                endf
            endfunction
        endif
        "NeoBundle 'mattn/webapi-vim'
        "NeoBundle 'mattn/googlesuggest-complete-vim'
        "NeoBundle 'mopp/googlesuggest-source.vim'
        NeoBundle 'ujihisa/unite-colorscheme'
        NeoBundle 'mattn/unite-gist'
        "NeoBundle 'klen/unite-radio.vim'
        NeoBundle 'tacroe/unite-mark'
        NeoBundle 'tacroe/unite-alias'
        "NeoBundle 'ujihisa/quicklearn'
        NeoBundle 'tex/vim-unite-id'
        NeoBundle 'sgur/unite-qf'
        if neobundle#tap('unite.vim')
        endif
    endif "}}}


    "{{{ctrlpvim settings
    if count(s:settings.plugin_groups, 'ctrlp') "{{{

        NeoBundle 'ctrlpvim/ctrlp.vim'
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
        NeoBundle 'ompugao/ctrlp-z'
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_root_markers = 'pom.xml'
        let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
        let g:ctrlp_show_hidden = 1
        "for caching
        let g:ctrlp_use_caching = 1
        let g:ctrlp_clear_cache_on_exit = 0
        let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
        "let g:ctrlp_map = ',,'
        "let g:ctrlp_open_multiple_files = 'v'
        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '\v[\/]\.(git|hg|svn)$|target',
                    \ 'file': '\v\.(exe|so|dll|ttf|png)$',
                    \ 'link': 'some_bad_symbolic_links',
                    \ }
        let g:ctrlp_user_command = ['ag %s -i --nocolor --nogroup --hidden
                    \ --ignore out
                    \ --ignore .git
                    \ --ignore .svn
                    \ --ignore .hg
                    \ --ignore .DS_Store
                    \ --ignore "**/*.pyc"
                    \ -g ""'
                    \ ]

        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }


        "nnoremap <Leader>kk :CtrlPMixed<Cr>


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

        ""for ctrlp-cmatcher {{{

        "let g:ctrlp_max_files = 0
        "let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

        ""}}}

    endif "}}}


    if count(s:settings.plugin_groups, 'autocomplete') "{{{
        NeoBundle 'honza/vim-snippets'
        imap <silent><expr><TAB> MyTabfunc()
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        inoremap <silent> <CR> <C-r>=MyEnterfunc()<Cr>
        inoremap <silent> <Leader><Tab> <C-r>=MyLeaderTabfunc()<CR>
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
        inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
        if s:settings.autocomplete_method == 'ycm' "{{{
            NeoBundle 'SirVer/ultisnips'
            let g:UltiSnipsExpandTrigger="<tab>"
            let g:UltiSnipsJumpForwardTrigger="<tab>"
            let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
            let g:UltiSnipsSnippetsDir='~/DotFiles/snippets'
            NeoBundle 'ervandew/supertab'
            let g:SuperTabContextDefaultCompletionType = "<c-n>"
            let g:SuperTabDefaultCompletionType = '<C-n>'
            autocmd InsertLeave * if pumvisible() == 0|pclose|endif
            let g:neobundle#install_process_timeout = 1500
            NeoBundle 'Valloric/YouCompleteMe'
            "let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
            "let g:ycm_confirm_extra_conf = 0
            let g:ycm_collect_identifiers_from_tags_files = 1
            let g:ycm_collect_identifiers_from_comments_and_strings = 1
            let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
            let g:ycm_key_list_previous_completion = ['<C-S-TAB>','<Up>']
            let g:ycm_seed_identifiers_with_syntax = 1
            let g:ycm_key_invoke_completion = '<leader><tab>'
            let g:ycm_semantic_triggers =  {
                        \   'c' : ['->', '.'],
                        \   'objc' : ['->', '.'],
                        \   'ocaml' : ['.', '#'],
                        \   'cpp,objcpp' : ['->', '.', '::'],
                        \   'perl' : ['->'],
                        \   'php' : ['->', '::'],
                        \   'cs,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                        \   'java,jsp' : ['.'],
                        \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
                        \   'ruby' : ['.', '::'],
                        \   'lua' : ['.', ':'],
                        \   'erlang' : [':'],
                        \ }
        elseif s:settings.autocomplete_method == 'neocomplete' "{{{
            NeoBundle 'Shougo/neocomplete'
            let s:hooks = neobundle#get_hooks("neocomplete")
            function! s:hooks.on_source(bundle) abort
                let g:neocomplete#data_directory='~/.cache/neocomplete'
                let g:acp_enableAtStartup = 0
                let g:neocomplete#enable_at_startup = 1
                " Use smartcase.
                let g:neocomplete#enable_smart_case = 1
                let g:neocomplete#enable_camel_case = 1
                "let g:neocomplete#enable_ignore_case = 1
                let g:neocomplete#enable_fuzzy_completion = 1
                " Set minimum syntax keyword length.
                let g:neocomplete#sources#syntax#min_keyword_length = 3
                let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

                " Define dictionary.
                let g:neocomplete#sources#dictionary#dictionaries = {
                            \ 'default' : '',
                            \ 'vimshell' : $CACHE.'/vimshell/command-history',
                            \ 'java' : '~/.vim/dict/java.dict',
                            \ 'ruby' : '~/.vim/dict/ruby.dict',
                            \ 'scala' : '~/.vim/dict/scala.dict',
                            \ }

                let g:neocomplete#enable_auto_delimiter = 1

                " Define keyword.
                if !exists('g:neocomplete#keyword_patterns')
                    let g:neocomplete#keyword_patterns = {}
                endif
                let g:neocomplete#keyword_patterns._ = '\h\k*(\?'


                " AutoComplPop like behavior.
                let g:neocomplete#enable_auto_select = 0

                if !exists('g:neocomplete#sources#omni#input_patterns')
                    let g:neocomplete#sources#omni#input_patterns = {}
                endif

                let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                let g:neocomplete#sources#omni#input_patterns.java ='[^. \t0-9]\.\w*'
                let g:neocomplete#force_omni_input_patterns = {}
                "let g:neocomplete#force_omni_input_patterns.java = '^\s*'
                " <C-h>, <BS>: close popup and delete backword char.
                inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
                inoremap <expr><C-y>  neocomplete#close_popup()
                inoremap <expr><C-e>  neocomplete#cancel_popup()
            endfunction
        elseif s:settings.autocomplete_method == 'neocomplcache' "{{{
            NeoBundle 'Shougo/neocomplcache.vim'
            if neobundle#tap('neocomplcache.vim)
                let s:hooks = neobundle#get_hooks("neocomplcache.vim")
                function! s:hooks.on_source(bundle) abort
                    "---------------------------------------------------------------------------
                    " neocomplache.vim
                    "

                    " Use smartcase.
                    let g:neocomplcache_enable_smart_case = 0
                    " Use camel case completion.
                    let g:neocomplcache_enable_camel_case_completion = 0
                    " Use underbar completion.
                    let g:neocomplcache_enable_underbar_completion = 0
                    " Use fuzzy completion.
                    let g:neocomplcache_enable_fuzzy_completion = 0

                    " Set minimum syntax keyword length.
                    let g:neocomplcache_min_syntax_length = 3
                    " Set auto completion length.
                    let g:neocomplcache_auto_completion_start_length = 2
                    " Set manual completion length.
                    let g:neocomplcache_manual_completion_start_length = 0
                    " Set minimum keyword length.
                    let g:neocomplcache_min_keyword_length = 3
                    " let g:neocomplcache_enable_cursor_hold_i = v:version > 703 ||
                    "       \ v:version == 703 && has('patch289')
                    let g:neocomplcache_enable_cursor_hold_i = 0
                    let g:neocomplcache_cursor_hold_i_time = 300
                    let g:neocomplcache_enable_insert_char_pre = 1
                    let g:neocomplcache_enable_prefetch = 1
                    let g:neocomplcache_skip_auto_completion_time = '0.6'

                    " For auto select.
                    let g:neocomplcache_enable_auto_select = 1

                    let g:neocomplcache_enable_auto_delimiter = 1
                    let g:neocomplcache_disable_auto_select_buffer_name_pattern =
                                \ '\[Command Line\]'
                    "let g:neocomplcache_disable_auto_complete = 0
                    let g:neocomplcache_max_list = 100
                    let g:neocomplcache_force_overwrite_completefunc = 1
                    if !exists('g:neocomplcache_omni_patterns')
                        let g:neocomplcache_omni_patterns = {}
                    endif
                    if !exists('g:neocomplcache_omni_functions')
                        let g:neocomplcache_omni_functions = {}
                    endif
                    if !exists('g:neocomplcache_force_omni_patterns')
                        let g:neocomplcache_force_omni_patterns = {}
                    endif
                    let g:neocomplcache_enable_auto_close_preview = 1
                    " let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
                    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

                    " For clang_complete.
                    let g:neocomplcache_force_overwrite_completefunc = 1
                    let g:neocomplcache_force_omni_patterns.c =
                                \ '[^.[:digit:] *\t]\%(\.\|->\)'
                    let g:neocomplcache_force_omni_patterns.cpp =
                                \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
                    let g:clang_complete_auto = 0
                    let g:clang_auto_select = 0
                    let g:clang_use_library   = 1

                    " Define keyword pattern.
                    if !exists('g:neocomplcache_keyword_patterns')
                        let g:neocomplcache_keyword_patterns = {}
                    endif
                    let g:neocomplcache_keyword_patterns['default'] = '[0-9a-zA-Z:#_]\+'
                    let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
                    let g:neocomplete#enable_multibyte_completion = 1

                    let g:neocomplcache_vim_completefuncs = {
                                \ 'Ref' : 'ref#complete',
                                \ 'Unite' : 'unite#complete_source',
                                \ 'VimShellExecute' :
                                \      'vimshell#vimshell_execute_complete',
                                \ 'VimShellInteractive' :
                                \      'vimshell#vimshell_execute_complete',
                                \ 'VimShellTerminal' :
                                \      'vimshell#vimshell_execute_complete',
                                \ 'VimShell' : 'vimshell#complete',
                                \ 'VimFiler' : 'vimfiler#complete',
                                \ 'Vinarise' : 'vinarise#complete',
                                \}
                endf
            endif
        elseif s:settings.autocomplete_method == 'deoplete'
            NeoBundle 'Shougo/deoplete.nvim'
            let s:hooks = neobundle#get_hooks("deoplete.nvim")
            function! s:hooks.on_source(bundle)
                let g:deoplete#enable_at_startup = 1
                let g:deoplete#enable_ignore_case = 1
                let g:deoplete#enable_smart_case = 1
                let g:deoplete#enable_refresh_always = 1
                let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
                let g:deoplete#omni#input_patterns.java = [
                            \'[^. \t0-9]\.\w*',
                            \'[^. \t0-9]\->\w*',
                            \'[^. \t0-9]\::\w*',
                            \]
                let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
                let g:deoplete#ignore_sources = {}
                let g:deoplete#ignore_sources._ = ['javacomplete2']
                call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
                inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
                inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
            endfunction
        endif "}}}
        NeoBundle 'Shougo/neco-syntax'
        NeoBundle 'Shougo/neco-vim'
        if !exists('g:necovim#complete_functions')
            let g:necovim#complete_functions = {}
        endif
        let g:necovim#complete_functions.Ref =
                    \ 'ref#complete'
        NeoBundle 'Shougo/context_filetype.vim'
        NeoBundle 'Shougo/neoinclude.vim'
        NeoBundle 'Shougo/neosnippet-snippets'
        NeoBundle 'Shougo/neosnippet.vim' "{{{
        if WINDOWS()
            let g:neosnippet#snippets_directory=g:Vimrc_Home .s:Fsep .'snippets'
        else
            let g:neosnippet#snippets_directory='~/DotFiles/snippets'
        endif
        let g:neosnippet#enable_snipmate_compatibility=1
        let g:neosnippet#enable_complete_done = 1
        let g:neosnippet#completed_pairs= {}
        let g:neosnippet#completed_pairs.java = {'(' : ')'}
        NeoBundle 'Shougo/neopairs.vim'
        if g:neosnippet#enable_complete_done
            let g:neopairs#enable = 0
        endif
        imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
        smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
    endif "}}}

    if count(s:settings.plugin_groups, 'colorscheme') "{{{
        "colorscheme
        NeoBundle 'morhetz/gruvbox'
        NeoBundle 'mhartington/oceanic-next'
        NeoBundle 'nanotech/jellybeans.vim'
        NeoBundle 'altercation/vim-colors-solarized'
        NeoBundle 'kristijanhusak/vim-hybrid-material'
    endif

    if count(s:settings.plugin_groups, 'chinese') "{{{
        NeoBundle "vimcn/vimcdoc"
    endif
    NeoBundle 'tpope/vim-scriptease'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'terryma/vim-multiple-cursors'
    let g:multi_cursor_next_key='<C-j>'
    let g:multi_cursor_prev_key='<C-k>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'

    "web plugins

    NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
    NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
    NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
    NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
    NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
    NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
    NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
    NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
    NeoBundle 'Valloric/MatchTagAlways'

    "javascript plugins

    "NeoBundleLazy 'marijnh/tern_for_vim', {
    "\ 'autoload': { 'filetypes': ['javascript'] },
    "\ 'build': {
    "\ 'mac': 'npm install',
    "\ 'unix': 'npm install',
    "\ 'cygwin': 'npm install',
    "\ 'windows': 'npm install',
    "\ },
    "\ }
    NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
    NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}} "{{{
    nnoremap <leader>fjs :call JsBeautify()<cr>
    "}}}
    NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
    NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
    NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
    NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
    NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}




    NeoBundle 'artur-shaik/vim-javacomplete2'
    let g:JavaComplete_UseFQN = 1
    let g:JavaComplete_ServerAutoShutdownTime = 300
    let g:JavaComplete_MavenRepositoryDisable = 0
    NeoBundle 'wsdjeg/vim-dict'
    NeoBundle 'wsdjeg/java_getset.vim'
    let s:hooks = neobundle#get_hooks('java_getset.vim')
    function! s:hooks.on_source(bundle)
        let g:java_getset_disable_map = 1
    endfunction
    NeoBundle 'wsdjeg/JavaUnit.vim'
    NeoBundle 'wsdjeg/Mysql.vim'
    let g:JavaUnit_key = "<leader>ooo"
    NeoBundle 'vim-jp/vim-java'
    NeoBundle 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    if neobundle#tap('vim-airline')
        let s:hooks = neobundle#get_hooks('bling/vim-airline')
        function! s:hooks.on_source(bundle)
            let g:Powerline_sybols = 'unicode'
            let g:airline#extensions#tmuxline#enabled = 0
            set statusline+=%#warningmsg#
            set statusline+=%{SyntasticStatuslineFlag()}
            set statusline+=%*
        endfunction
    endif
    NeoBundle 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key='<C-e>'
    let g:user_emmet_mode='a'
    let g:user_emmet_settings = {
                \  'jsp' : {
                \      'extends' : 'html',
                \  },
                \}
    " use this two command to find how long the plugin take!
    "profile start vim-javacomplete2.log
    "profile! file */vim-javacomplete2/*
    if has('nvim') && s:settings.enable_neomake
        NeoBundle 'wsdjeg/neomake'
    else
        NeoBundle 'wsdjeg/syntastic'
    endif
    if !filereadable('pom.xml') && !filereadable('build.gradle') && isdirectory('bin')
        let g:syntastic_java_javac_options = '-d bin'
    endif
    let g:syntastic_java_javac_config_file_enabled = 1
    let g:syntastic_java_javac_delete_output = 0
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_error_symbol = '✖'
    let g:syntastic_warning_symbol = '⚠'
    let g:syntastic_warning_symbol = '➤'
    NeoBundle 'syngan/vim-vimlint', {
                \ 'depends' : 'ynkdir/vim-vimlparser'}
    let g:syntastic_vimlint_options = {
                \'EVL102': 1 ,
                \'EVL103': 1 ,
                \'EVL205': 1 ,
                \'EVL105': 1 ,
                \}
    NeoBundle 'ynkdir/vim-vimlparser'
    NeoBundle 'todesking/vint-syntastic'
    "let g:syntastic_vim_checkers = ['vint']
    NeoBundle 'gcmt/wildfire.vim'
    noremap <SPACE> <Plug>(wildfire-fuel)
    vnoremap <C-SPACE> <Plug>(wildfire-water)
    let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it']

    NeoBundle 'scrooloose/nerdcommenter'
    NeoBundle 'easymotion/vim-easymotion'
    NeoBundle 'MarcWeber/vim-addon-mw-utils'
    "NeoBundle 'tomtom/tlib_vim'
    NeoBundle 'mhinz/vim-startify'
    NeoBundle 'mhinz/vim-signify'
    let g:signify_disable_by_default = 0
    let g:signify_line_highlight = 0
    NeoBundle 'airblade/vim-rooter'
    let g:rooter_silent_chdir = 1
    NeoBundle 'Yggdroot/indentLine'
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '¦'
    let g:indentLine_concealcursor = 'niv' " (default 'inc')
    let g:indentLine_conceallevel = 2  " (default 2)
    NeoBundle 'godlygeek/tabular'
    NeoBundle 'benizi/vim-automkdir'
    "[c  ]c  jump between prev or next hunk
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'itchyny/calendar.vim'
    "配合fcitx输入框架,在离开插入模式时自动切换到英文,在同一个缓冲区再次进入插入模式时回复到原来的输入状态
    NeoBundle 'lilydjwg/fcitx.vim'
    NeoBundle 'junegunn/goyo.vim'
    function! s:goyo_enter()
        silent !tmux set status off
        set noshowmode
        set noshowcmd
        set scrolloff=999
        Limelight
    endfunction

    function! s:goyo_leave()
        silent !tmux set status on
        set showmode
        set showcmd
        set scrolloff=5
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()


    "vim Wimdows config
    "NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'tpope/vim-projectionist'
    NeoBundle 'Xuyuanp/nerdtree-git-plugin'
    NeoBundle 'taglist.vim'
    NeoBundle 'ntpeters/vim-better-whitespace'
    NeoBundle 'junegunn/rainbow_parentheses.vim'
    augroup rainbow_lisp
        autocmd!
        autocmd FileType lisp,clojure,scheme,java RainbowParentheses
    augroup END
    let g:rainbow#max_level = 16
    let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}']]
    " List of colors that you do not want. ANSI code or #RRGGBB
    let g:rainbow#blacklist = [233, 234]
    NeoBundle 'majutsushi/tagbar'
    let g:tagbar_width=30
    let g:tagbar_left = 1
    let g:NERDTreeWinPos='right'
    let g:NERDTreeWinSize=31
    let g:NERDTreeChDirMode=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if !executable('ctags')
        let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'  "设置ctags执行路径
    endif
    let g:Tlist_Auto_Update=1
    let g:Tlist_Auto_Open =0
    let g:Tlist_Use_Right_Window=1
    let g:Tlist_Show_One_File=0
    let g:Tlist_File_Fold_Auto_Close=1
    let g:Tlist_Exit_OnlyWindow=1
    let g:Tlist_Show_Menu=1
    noremap <silent> <F8> :TlistToggle<CR>
    "noremap <silent> <F3> :NERDTreeToggle<CR>
    noremap <silent> <F3> :VimFiler<CR>
    autocmd FileType nerdtree nnoremap <silent><Space> :call OpenOrCloseNERDTree()<cr>
    noremap <silent> <F2> :TagbarToggle<CR>
    function! OpenOrCloseNERDTree()
        exec "normal A"
    endfunction
    "}}}

    NeoBundle 'wsdjeg/MarkDown.pl'
    NeoBundle 'wsdjeg/matchit.zip'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'simnalamburt/vim-mundo'
    nnoremap <silent> <F7> :MundoToggle<CR>
    "NeoBundle 'nerdtree-ack'
    NeoBundle 'L9'
    NeoBundle 'TaskList.vim'
    map <unique> <Leader>td <Plug>TaskList
    NeoBundle 'ianva/vim-youdao-translater'
    vnoremap <silent> <C-l> <Esc>:Ydv<CR>
    nnoremap <silent> <C-l> <Esc>:Ydc<CR>
    noremap <leader>yd :Yde<CR>
    NeoBundle 'junegunn/vim-plug'
    NeoBundle 'elixir-lang/vim-elixir'
    NeoBundle 'tyru/open-browser.vim'
    if neobundle#tap('open-brower.vim')
        let s:hooks = neobundle#get_hooks("open-brower.vim")
        function! s:hooks.on_source(bundle)
            "for open-browser {{{
            " This is my setting.
            let g:netrw_nogx = 1 " disable netrw's gx mapping.
            "nmap gx <Plug>(openbrowser-smart-search)
            "vmap gx <Plug>(openbrowser-smart-search)
            "" Open URI under cursor.
            nnoremap go <Plug>(openbrowser-open)
            "" Open selected URI.
            vnoremap go <Plug>(openbrowser-open)
            " Search word under cursor.
            nnoremap gs <Plug>(openbrowser-search)
            " Search selected word.
            vnoremap gs <Plug>(openbrowser-search)
            " If it looks like URI, Open URI under cursor.
            " Otherwise, Search word under cursor.
            nnoremap gx <Plug>(openbrowser-smart-search)
            " If it looks like URI, Open selected URI.
            " Otherwise, Search selected word.
            vnoremap gx <Plug>(openbrowser-smart-search)
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
        endf
    endif
    call neobundle#end()
    NeoBundleCheck
endif
filetype plugin indent on
syntax on
"}}}
if count(s:settings.plugin_groups, 'colorscheme')&&s:settings.colorscheme!='' "{{{
    set background=dark
    if s:settings.colorscheme!='' && s:settings.neobundle_installed
        exec 'colorscheme '. s:settings.colorscheme
    else
        exec 'colorscheme '. s:settings.colorscheme_default
    endif
endif

let s:My_vimrc = expand('<sfile>')
function! EditMy_virmc()
    exec "edit ".s:My_vimrc
endf

" basic vim settiing
if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

" indent use backspace delete indent, eol use backspace delete line at
" begining start delete the char you just typed in if you do not use set
" nocompatible ,you need this
set backspace=indent,eol,start

"显示相对行号
set relativenumber

" 显示行号
set number

" 自动缩进,自动智能对齐
set autoindent
set smartindent
set cindent

" 状态栏预览命令
set wildmenu

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
"menuone: show the pupmenu when only one match
set completeopt=menu,menuone,longest " disable preview scratch window,
set complete=.,w,b,u,t " h: 'complete'
set pumheight=15 " limit completion menu height
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set scrolloff=7               "最低显示行数
if s:settings.enable_cursorline == 1
    set cursorline					"显示当前行
endif
if s:settings.enable_cursorcolumn == 1
    set cursorcolumn				"显示当前列
endif
set incsearch
set autowrite
set hlsearch
set laststatus=2
set completeopt=longest,menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,tags
set wildignorecase
let g:markdown_fenced_languages = ['vim', 'java', 'bash=sh', 'sh', 'html', 'python']
"mapping
"{{{
"全局映射
"也可以通过'za'打开或者关闭折叠
nnoremap <silent><leader><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"Super paste it does not work
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"对于没有权限的文件使用 :w!!来保存
cnoremap w!! %!sudo tee > /dev/null %


" 映射Ctrl+上下左右来切换窗口
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left>  <C-W><Left>
nnoremap <C-Up>    <C-W><Up>
nnoremap <C-Down>  <C-W><Down>
if has('nvim')
    tnoremap <C-Right> <C-\><C-n><C-w><Right>
    tnoremap <C-Left>  <C-\><C-n><C-w><Left>
    tnoremap <C-Up>    <C-\><C-n><C-w><Up>
    tnoremap <C-Down>  <C-\><C-n><C-w><Down>
    tnoremap <esc>     <C-\><C-n>
endif

"for buftabs
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>

"Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"Use jk switch to normal model
inoremap jk <esc>

"]e or [e move current line ,count can be useed
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"Ctrl+Shift+上下移动当前行
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
"上下移动选中的行
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

"for vim-fasd.vim
nnoremap <Leader>z :Z<CR>

"for ctrlp-z
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>

"background
noremap <silent><leader>bg :call ToggleBG()<CR>
"numbers
noremap <silent><leader>nu :call ToggleNumber()<CR>


"autocmds
autocmd FileType jsp call JspFileTypeInit()
autocmd FileType html,css,jsp EmmetInstall
autocmd FileType java call JavaFileTypeInit()
autocmd BufEnter,WinEnter,InsertLeave * set cursorline
autocmd BufLeave,WinLeave,InsertEnter * set nocursorline
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
autocmd BufNewFile,BufEnter * set cpoptions+=d " NOTE: ctags find the tags file from the current path instead of the path of currect file
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
autocmd BufNewFile,BufRead *.avs set syntax=avs " for avs syntax file.
autocmd FileType text setlocal textwidth=78 " for all text files set 'textwidth' to 78 characters.
autocmd FileType c,cpp,cs,swig set nomodeline " this will avoid bug in my project with namespace ex, the vim will tree ex:: as modeline.
autocmd FileType c,cpp,java,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
autocmd FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f://
autocmd FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
autocmd FileType lua set comments=f:--
autocmd FileType python,coffee call s:check_if_expand_tab()
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml call XmlFileTypeInit()
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType unite call s:unite_my_settings()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufEnter *
            \   if empty(&buftype)&&has('nvim')
            \|      nnoremap <silent><buffer> <C-]> :call MyTagfunc()<CR>
            \|      nnoremap <silent><buffer> <C-[> :call MyTagfuncBack()<CR>
            \|  else
                \|      nnoremap <silent><buffer> <leader>] :call MyTagfunc()<CR>
                \|      nnoremap <silent><buffer> <leader>[ :call MyTagfuncBack()<CR>
                \|  endif
"}}}

"functions
"{{{
function! OnmiConfigForJsp()
    let pos1 = search("</script>","nb",line("w0"))
    let pos2 = search("<script","nb",line("w0"))
    let pos3 = search("</script>","n",line("w$"))
    let pos4 = search("<script","n",line("w$"))
    let pos0 = line('.')
    if pos1 < pos2 && pos2 < pos0 && pos0 < pos3
        set omnifunc=javascriptcomplete#CompleteJS
        return "\<esc>a."
    else
        set omnifunc=javacomplete#Complete
        return "\<esc>a."
    endif
endf
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
endfunction
function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endf
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
function! BracketsFunc()
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "]"
        return "{}\<esc>i"
    else
        return "{\<cr>}\<esc>O"
    endif
endf
function! XmlFileTypeInit()
    set omnifunc=xmlcomplete#CompleteTags
    if filereadable("AndroidManifest.xml")
        set dict+=~/.vim/bundle/vim-dict/dict/android_xml.dic
    endif
endf
function! JavaFileTypeInit()
    let b:javagetset_setterTemplate =
                \ "/**\n" .
                \ " * Set %varname%.\n" .
                \ " *\n" .
                \ " * @param %varname% the value to set.\n" .
                \ " */\n" .
                \ "%modifiers% void %funcname%(%type% %varname%){\n" .
                \ "    this.%varname% = %varname%;\n" .
                \ "}"
    let b:javagetset_getterTemplate =
                \ "/**\n" .
                \ " * Get %varname%.\n" .
                \ " *\n" .
                \ " * @return %varname% as %type%.\n" .
                \ " */\n" .
                \ "%modifiers% %type% %funcname%(){\n" .
                \ "    return %varname%;\n" .
                \ "}"
    set omnifunc=javacomplete#Complete
    set tags +=~/others/openjdksrc/java/tags
    set tags +=~/others/openjdksrc/javax/tags
    inoremap <silent> <buffer> <leader>UU <esc>bgUwea
    inoremap <silent> <buffer> <leader>uu <esc>bguwea
    inoremap <silent> <buffer> <leader>ua <esc>bgulea
    inoremap <silent> <buffer> <leader>Ua <esc>bgUlea
    nmap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
    imap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
endf
function! WSDAutoComplete(char)
    if(getline(".")=~?'^\s*.*\/\/')==0
        let line = getline('.')
        let col = col('.')
        if a:char == "."
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 2] == " "||line[col -2] == "("||line[col - 2] == ","
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 3] == " "&&line[col - 2] =="@"
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return a:char
        endif
    else
        "bug exists
        let col = col('.')
        normal ma
        let [commentline,commentcol] = searchpos('//','b',line('.'))
        normal `a
        if commentcol == 0
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return "\<Right>".a:char
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
function! JspFileTypeInit()
    set tags+=/home/wsdjeg/others/openjdk-8-src/tags
    set omnifunc=javacomplete#Complete
    inoremap . <c-r>=OnmiConfigForJsp()<cr>
    nnoremap <F4> :JCimportAdd<cr>
    inoremap <F4> <esc>:JCimportAddI<cr>
endfunction
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

function! MyTagfunc() abort
    mark H
    let s:MyTagfunc_flag = 1
    UniteWithCursorWord -immediately tag
endfunction

function! MyTagfuncBack() abort
    if exists('s:MyTagfunc_flag')&&s:MyTagfunc_flag
        exe "normal! `H"
        let s:MyTagfunc_flag =0
    endif
endfunction

function MyEnterfunc() abort
    if pumvisible()
        if getline('.')[col('.') - 2]=="{"
            return "\<Enter>"
        elseif s:settings.autocomplete_method == 'neocomplete'||s:settings.autocomplete_method == 'deoplete'
            return "\<C-y>"
        else
            return "\<esc>a"
        endif
    elseif getline('.')[col('.') - 2]=="{"&&getline('.')[col('.')-1]=="}"
        return "\<Enter>\<esc>ko"
    else
        return "\<Enter>"
    endif
endf

function! MyLeaderTabfunc() abort
    if s:settings.autocomplete_method == 'deoplete'
        return deoplete#mappings#manual_complete(['omni'])
    elseif s:settings.autocomplete_method == 'neocomplete'
        return neocomplete#start_manual_complete(['omni'])
    endif
endfunction

function! MyTabfunc() abort
    if getline('.')[col('.')-2] =='{'&& pumvisible()
        return "\<C-n>"
    endif
    if neosnippet#expandable() && getline('.')[col('.')-2] =='(' && !pumvisible()
        return "\<Plug>(neosnippet_expand)"
    elseif neosnippet#jumpable() && getline('.')[col('.')-2] =='(' && !pumvisible() && !neosnippet#expandable()
        return "\<plug>(neosnippet_jump)"
    elseif neosnippet#expandable_or_jumpable() && getline('.')[col('.')-2] !='('
        return "\<plug>(neosnippet_expand_or_jump)"
    elseif pumvisible()
        return "\<C-n>"
    else
        return "\<tab>"
    endif
endfunction



if filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/gv.vim'
    "for fzf
    nnoremap <Leader>fz :FZF<CR>
    if !has('nvim')
        Plug 'junegunn/vim-github-dashboard'
    endif
    call plug#end()
endif


"============> plug.vim
set mouse=
set hidden
if has('nvim')
    augroup Terminal
        au!
        au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
        au WinEnter term://* startinsert
    augroup END
    augroup Neomake_wsd
        au!
        autocmd! BufWritePost * Neomake
    augroup END
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    " dark0 + gray
    let g:terminal_color_0 = "#282828"
    let g:terminal_color_8 = "#928374"

    " neurtral_red + bright_red
    let g:terminal_color_1 = "#cc241d"
    let g:terminal_color_9 = "#fb4934"

    " neutral_green + bright_green
    let g:terminal_color_2 = "#98971a"
    let g:terminal_color_10 = "#b8bb26"

    " neutral_yellow + bright_yellow
    let g:terminal_color_3 = "#d79921"
    let g:terminal_color_11 = "#fabd2f"

    " neutral_blue + bright_blue
    let g:terminal_color_4 = "#458588"
    let g:terminal_color_12 = "#83a598"

    " neutral_purple + bright_purple
    let g:terminal_color_5 = "#b16286"
    let g:terminal_color_13 = "#d3869b"

    " neutral_aqua + faded_aqua
    let g:terminal_color_6 = "#689d6a"
    let g:terminal_color_14 = "#8ec07c"

    " light4 + light1
    let g:terminal_color_7 = "#a89984"
    let g:terminal_color_15 = "#ebdbb2"
endif

function! s:GetVisual()
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][:col2 - 2]
    let lines[0] = lines[0][col1 - 1:]
    return lines
endfunction

function! REPLSend(lines)
    call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction
" }}}
" Commands {{{
" REPL integration {{{
command! -range=% REPLSendSelection call REPLSend(s:GetVisual())
command! REPLSendLine call REPLSend([getline('.')])
" }}}
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.  Only define it when not
" defined already.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
" }}}
