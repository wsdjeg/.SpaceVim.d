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
"vim settings {{{
"initialize default settings
let s:settings = {}
let s:settings.default_indent = 2
let s:settings.max_column = 120
let s:settings.autocomplete_method = ''
let s:settings.enable_cursorcolumn = 0
let s:settings.enable_cursorline = 0
let s:settings.use_colorscheme=0
let s:settings.vim_help_language='en'
let s:settings.colorscheme = 'solarized'

if has('nvim')
    let s:settings.autocomplete_method = 'deoplete'
elseif has('lua')
    let s:settings.autocomplete_method = 'neocomplete'
elseif s:settings.autocomplete_method == 'ycm'
    let s:settings.autocomplete_method = 'ycm'
else
    let s:settings.autocomplete_method = 'neocomplcache'
endif
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

let s:settings.plugin_groups_exclude = []

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
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
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
    NeoBundle 'rking/ag.vim'
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
    let s:hooks = neobundle#get_hooks("vimfiler")
    function! s:hooks.on_source(bundle) abort
        let g:vimfiler_as_default_explorer = 1
        let g:vimfiler_restore_alternate_file = 1
        let g:vimfiler_tree_indentation = 1
        let g:vimfiler_tree_leaf_icon = '¦'
        let g:vimfiler_tree_opened_icon = '▼'
        let g:vimfiler_tree_closed_icon = '▷'
        let g:vimfiler_file_icon = ' '
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
                    \  'safe': 0,
                    \  'winwidth': 35,
                    \  'explorer': 1,
                    \  'auto_expand': 1,
                    \  'no_quit': 1,
                    \  'direction' : 'rightbelow',
                    \  'force_hide': 1,
                    \  'parent': 0,
                    \  'split': 1,
                    \  'toggle': 1,
                    \ })
    endfunction
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
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
                \|  endif

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

endif "}}}


"{{{ctrlpvim settings
if count(s:settings.plugin_groups, 'ctrlp') "{{{

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
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,tags
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
    inoremap <silent> <CR> <C-r>=MyEnterfunc()<Cr>
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
            let g:neocomplete#enable_ignore_case = 1
            let g:neocomplete#enable_fuzzy_completion = 1
            " Set minimum syntax keyword length.
            let g:neocomplete#sources#syntax#min_keyword_length = 3
            let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

            " Define dictionary.
            let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

            " Define keyword.
            if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
            endif
            let g:neocomplete#keyword_patterns['default'] = '\h\w*'


            " AutoComplPop like behavior.
            let g:neocomplete#enable_auto_select = 0

            if !exists('g:neocomplete#sources#omni#input_patterns')
                let g:neocomplete#sources#omni#input_patterns = {}
            endif

            let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
            let g:neocomplete#sources#omni#input_patterns.java = '[^. *\t]\.\w*\|\h\w*::'
            let g:neocomplete#force_omni_input_patterns = {}
            "let g:neocomplete#force_omni_input_patterns.java = '^\s*'
            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y>  neocomplete#close_popup()
            inoremap <expr><C-e>  neocomplete#cancel_popup()
        endfunction
    elseif s:settings.autocomplete_method == 'neocomplcache' "{{{
        NeoBundleLazy 'Shougo/neocomplcache.vim', {'autoload':{'insert':1}} "{{{
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_temporary_dir=s:get_cache_dir('neocomplcache')
        let g:neocomplcache_enable_fuzzy_completion=1
    elseif s:settings.autocomplete_method == 'deoplete'
        NeoBundle 'Shougo/deoplete.nvim'
        let s:hooks = neobundle#get_hooks("deoplete.nvim")
        function! s:hooks.on_source(bundle)
            let g:deoplete#enable_at_startup = 1
            let g:deoplete#enable_ignore_case = 1
            let g:deoplete#enable_smart_case = 1
            let g:deoplete#enable_fuzzy_completion = 1
            let g:deoplete#omni_patterns = {}
            "let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
            let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
            let g:deoplete#omni#input_patterns.java = [
                        \'[^. \t0-9]\.\w*',
                        \'[^. \t0-9]\->\w*',
                        \'[^. \t0-9]\::\w*',
                        \'\s[A-Z][a-z]'
                        \]
            inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
            inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
        endfunction
    endif "}}}
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
endif "}}}

if count(s:settings.plugin_groups, 'colorscheme') "{{{
    "colorscheme
    NeoBundle 'morhetz/gruvbox'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'altercation/vim-colors-solarized'
endif

if count(s:settings.plugin_groups, 'chinese') "{{{
    "NeoBundle 'vimchina/vimcdoc'
    NeoBundle "vimcn/vimcdoc"
endif
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

"web plugins

NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
"NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
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




NeoBundle 'wsdjeg/vim-javacomplete2'
let g:JavaComplete_UseFQN = 1
let g:JavaComplete_ServerAutoShutdownTime = 300
let g:JavaComplete_MavenRepositoryDisable = 0
"NeoBundle 'VJDE/VJDE'
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
let g:Powerline_sybols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
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
NeoBundle 'wsdjeg/syntastic'
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_javac_delete_output = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
NeoBundle 'syngan/vim-vimlint', {
            \ 'depends' : 'ynkdir/vim-vimlparser'}
let g:syntastic_vimlint_options = {
            \'EVL102': 1 ,
            \'EVL103': 1 ,
            \'EVL205': 1 ,
            \'EVL105': 1 ,
            \}
NeoBundle 'ynkdir/vim-vimlparser'
NeoBundle 'gcmt/wildfire.vim'
noremap <SPACE> <Plug>(wildfire-fuel)
vnoremap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
"NeoBundle 'tomtom/tlib_vim'
NeoBundle 'airblade/vim-rooter'
"let g:rooter_patterns = ['Rakefile' , 'pom.xml' , 'web.xml' , '.git/']
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
" Alternate Files quickly use :A change between main and test files
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'taglist.vim'
"FixWhitespace
"NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ntpeters/vim-better-whitespace'
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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'  "设置ctags执行路径
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
nnoremap <silent> <F7> :GundoToggle<CR>
NeoBundle 'nerdtree-ack'
NeoBundle 'L9'
NeoBundle 'TaskList.vim'
map <unique> <Leader>td <Plug>TaskList
NeoBundle 'ianva/vim-youdao-translater'
vnoremap <silent> <C-l> <Esc>:Ydv<CR>
nnoremap <silent> <C-l> <Esc>:Ydc<CR>
noremap <leader>yd :Yde<CR>
NeoBundle 'junegunn/vim-plug'
call neobundle#end()
filetype plugin indent on
syntax on
if count(s:settings.plugin_groups, 'colorscheme') "{{{
    set background=dark
    exec 'colorscheme '.s:settings.colorscheme
endif
NeoBundleCheck

"}}}



"for buftabs {{{
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
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

nnoremap <Leader>rj :<C-u>Ref webdict je<Space>
nnoremap <Leader>re :<C-u>Ref webdict ej<Space>
nnoremap <Leader>rc :<C-u>Ref webdict cn<Space>
nnoremap <Leader>rw :<C-u>Ref webdict wikipedia:en<Space>
nnoremap <Leader>rb :<C-u>Ref webdict bing<Space>

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

" basic vim settiing
"{{{
"显示相对行号
if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif 
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
set t_Co=256
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set completeopt=longest,menu

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
autocmd Syntax html,vim inoremap <buffer> < <lt>><Esc>i| inoremap <buffer>  > <c-r>=ClosePair('>')<CR> |inoremap <buffer>  " "
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
autocmd Syntax java inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

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
    set tags +=~/others/openjdk_8_src/java/tags
    inoremap <silent> <buffer> { <C-r>=BracketsFunc()<cr>
    inoremap <silent> <buffer> } <C-r>=JavaCloseBracket()<cr>
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
function JavaCloseBracket()
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return "}"
    elseif line[col - 1] == "}"
        "Escaping out of the string
        return "\<Right>"
    elseif match(getline(line('.') + 1), '\s*}') < 0
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
function MyEnterfunc()
    if pumvisible()
        if s:settings.autocomplete_method == 'neocomplete'||s:settings.autocomplete_method == 'deoplete'
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
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"for fzf
nnoremap <Leader>fz :FZF<CR>
call plug#end()
