scriptencoding utf-8
let s:SYS = SpaceVim#api#import('system')
let s:JOB = SpaceVim#api#import('job')
let s:FILE = SpaceVim#api#import('file')

function! myspacevim#before() abort
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    set history=10000
    let g:LanguageClient_loggingFile = expand('~/LanguageClient.log')
    let g:neomru#file_mru_ignore_pattern = '^[a-z]\+://'
    let g:deoplete#enable_at_startup = 1
    " Windows bin utils {{{
    if s:SYS.isWindows
        " Neovim default layout
        " D:\Program Files\Neovim\bin\nvim-qt.exe" -qwindowgeometry 1300x650+20+20
        " if !has('nvim')
        " set rop=type:directx
        " let g:githubapi_curl_exe = 'D:\Program Files\Neovim\bin\curl.exe'
        " endif
        " mingw
        " let $PATH .= ';D:\Program Files\mingw-w64\i686-8.1.0-posix-dwarf-rt_v6-rev0\mingw32\bin'
        " llvm
        " let $PATH .= ';D:\Program Files\LLVM\bin'
        " Downloads gun global from:
        " http://adoxa.altervista.org/global/
        " GLOBAL 6.6.3 Win32 (938k)
        " let $PATH .= ';D:\Program Files\gtags\bin'
        " Downloads coreutils from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/coreutils/5.3.0/coreutils-5.3.0-bin.zip
        " coreutils-5.3.0-bin.zip
        " let $PATH .= ';D:\Program Files\coreutils\bin'
        " Downloads grep from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/grep/2.5.4/grep-2.5.4-setup.exe
        " let $PATH .= ';D:\Program Files\GnuWin32\bin'
        " Downloads make from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/make/3.81/make-3.81-bin.zip
        " let $PATH .= ';D:\Program Files\GnuWin32-make\bin'
        " Downloads gawk awk from
        " https://iweb.dl.sourceforge.net/project/gnuwin32/gawk/3.1.6-1/gawk-3.1.6-1-bin.zip
        " let $PATH .= ';D:\Program Files\GnuWin32-gawk\bin'
        " Downloads sed from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/sed/4.2.1/sed-4.2.1-bin.zip
        " let $PATH .= ';D:\Program Files\GnuWin32-sed\bin'
        " Add bin path, in this path, there are ag, rg, pt, etc.
        " ag: 
        "   sources: https://github.com/ggreer/the_silver_searcher
        "   bin:     https://github.com/k-takata/the_silver_searcher-win32/releases
        " rg:
        "   sources: https://github.com/BurntSushi/ripgrep
        "   bin:     https://github.com/BurntSushi/ripgrep/releases
        " pt:
        "   sources: https://github.com/monochromegane/the_platinum_searcher
        "   bin:     https://github.com/monochromegane/the_platinum_searcher/releases
        " let $PATH .= ';D:\bin'
        " go language
        "
        " let $PATH .= ';D:\Go\bin'
        " let $PATH .= ';D:\goprojects\bin'
        " let $GOPATH = 'D:\goprojects'
        " Perl language
        " http://strawberryperl.com/download/5.28.1.1/strawberry-perl-5.28.1.1-64bit.zip
        " let $PATH .= ';D:\strawberry-perl\perl\bin'
        " Java language
        " let $PATH .= ';D:\Program Files\Java\jdk1.8.0_191\bin'
        " let $PATH .= ';D:\Program Files\maven\bin'
        " Lua language
        " let $PATH .= ';D:\Program Files\lua-5.3.4_Win64_bin'
        " red language: https://www.red-lang.org/
        let $PATH .= ';D:\red'
        " kotlin native
        " let $PATH .=';D:\kotlin\bin'
        " kotlin compiler
        " let $PATH .=';D:\kotlinc\bin'
        " Add php, scoop install php
        " let $PATH .= ';D:\Program Files\php'
        " SpaceVim server client
        let $PATH .= ';C:\Users\Administrator\.SpaceVim\bin'
        let $PATH .= ';C:\Users\Administrator\SpaceVim\bin'
        " fuck the Python37 PATH
        let $PATH .= ';C:\Users\Administrator\AppData\Roaming\Python\Python37\Scripts'
        " let g:tagbar_type_markdown = {
                    " \ 'ctagsbin'  : 'php',
                    " \ 'ctagsargs' : 'C:\Users\Administrator\.cache\vimfiles\repos\github.com\lvht\tagbar-markdown\bin\mdctags',
                    " \ 'kinds'     : [
                    " \     'a:h1:0:0',
                    " \     'b:h2:0:0',
                    " \     'c:h3:0:0',
                    " \     'd:h4:0:0',
                    " \     'e:h5:0:0',
                    " \     'f:h6:0:0',
                    " \ ],
                    " \ 'sro'        : '::',
                    " \ 'kind2scope' : {
                    " \     'a' : 'h1',
                    " \     'b' : 'h2',
                    " \     'c' : 'h3',
                    " \     'd' : 'h4',
                    " \     'e' : 'h5',
                    " \     'f' : 'h6',
                    " \ },
                    " \ 'scope2kind' : {
                    " \     'h1' : 'a',
                    " \     'h2' : 'b',
                    " \     'h3' : 'c',
                    " \     'h4' : 'd',
                    " \     'h5' : 'e',
                    " \     'h6' : 'f',
                    " \}
                    " \}
        " let g:tagbar_type_ghmarkdown = g:tagbar_type_markdown
        " let g:tagbar_type_rmd = g:tagbar_type_markdown
        "
        " When using neovim in windows the only var need to be set is:
        " PYTHON_HOST_PROG 
        " C:\Python27\python.exe
        " PYTHON3_HOST_PROG
        " C:\Users\Administrator\AppData\Local\Programs\Python\Python37\python.exe

        " In windows neovim, if there is space in PATH, the executable()
        " function will not work
        if 1 " here, I do not know which patch will fix this issue
            " let $PATH = substitute($PATH, ' ', '\\ ', 'g')
        endif
        " SpaceVim development
        " lint:  vint
        " install: pip install --pre vim-vint
        let g:neomake_vim_vint_maker = {
                    \ 'exe': 'C:\Users\Administrator\AppData\Local\Programs\Python\Python37\Scripts\vint',
                    \ 'args': ['--style-problem', '--no-color',
                    \          '-f', '{file_path}:{line_number}:{column_number}:{severity}:{description} ({policy_name})'],
                    \ 'errorformat': '%f:%l:%c: %m',
                    \ 'output_stream': 'stdout',
                    \ }
        " lint:  vint-errors
        let g:neomake_vim_vinterrors_maker = {
                    \ 'exe': 'C:\Users\Administrator\AppData\Local\Programs\Python\Python37\Scripts\vint',
                    \ 'args': ['--style-problem', '--no-color',
                    \          '-f', '{file_path}:{line_number}:{column_number}:{severity}:{description} ({policy_name})'],
                    \ 'errorformat': '%f:%l:%c: %m',
                    \ 'output_stream': 'stdout',
                    \ }
        " lint:  vimlint
        let g:neomake_vim_vimlint_maker = {
                    \ 'exe': 'C:\Users\Administrator\AppData\Local\Programs\Python\Python37\Scripts\vint',
                    \ 'args': ['--style-problem', '--no-color',
                    \          '-f', '{file_path}:{line_number}:{column_number}:{severity}:{description} ({policy_name})'],
                    \ 'errorformat': '%f:%l:%c: %m',
                    \ 'output_stream': 'stdout',
                    \ }
        " lint:  vimlint-errors
        let g:neomake_vim_vimlinterrors_maker = {
                    \ 'exe': 'C:\Users\Administrator\AppData\Local\Programs\Python\Python37\Scripts\vint',
                    \ 'args': ['--style-problem', '--no-color',
                    \          '-f', '{file_path}:{line_number}:{column_number}:{severity}:{description} ({policy_name})'],
                    \ 'errorformat': '%f:%l:%c: %m',
                    \ 'output_stream': 'stdout',
                    \ }
    endif
    " }}}

    " here is a list of plugins which are used in SpaceVim, and I need to
    " debug locally:
    " All plugins arg cloned into $MYSRCDIR default is ~/SpaceVim
    let $MYSRCDIR = '~/SpaceVim'
    " defind global var before using it:
    let g:spacevim_disabled_plugins = []
    " vim-nim           {{{
    call add(g:spacevim_disabled_plugins, 'vim-nim')
    call s:add_load_repo('wsdjeg/vim-nim')
    " }}}
    " gtags.vim         {{{
    call add(g:spacevim_disabled_plugins, 'gtags.vim')
    call s:add_load_repo('SpaceVim/gtags.vim')
    " }}}
    " vim-markdown      {{{
    call add(g:spacevim_disabled_plugins, 'vim-markdown')
    call s:add_load_repo('SpaceVim/vim-markdown')
    " }}}
    " vim-hug-neovim-rpc      {{{
    call add(g:spacevim_disabled_plugins, 'vim-hug-neovim-rpc')
    call s:add_load_repo('SpaceVim/vim-hug-neovim-rpc')
    " }}}
    " nvim-yarp      {{{
    call add(g:spacevim_disabled_plugins, 'nvim-yarp')
    call s:add_load_repo('SpaceVim/nvim-yarp')
    " }}}
    " cscope.vim      {{{
    call add(g:spacevim_disabled_plugins, 'cscope.vim')
    call s:add_load_repo('SpaceVim/cscope.vim')
    " }}}
    " vim-slumlord      {{{
    call add(g:spacevim_disabled_plugins, 'vim-slumlord')
    call s:add_load_repo('wsdjeg/vim-slumlord')
    " }}}
    " SourceCounter     {{{
    call add(g:spacevim_disabled_plugins, 'SourceCounter.vim')
    call s:add_load_repo('wsdjeg/SourceCounter.vim')
    " }}}
    " Github.vim        {{{
    call add(g:spacevim_disabled_plugins, 'GitHub-api.vim')
    call s:add_load_repo('wsdjeg/GitHub.vim')
    " }}}
    " vim-elm           {{{
    call add(g:spacevim_disabled_plugins, 'vim-elm')
    call s:add_load_repo('wsdjeg/vim-elm')
    " }}}
    " vim-asciidoc      {{{
    call add(g:spacevim_disabled_plugins, 'vim-asciidoc')
    call s:add_load_repo('wsdjeg/vim-asciidoc')
    " }}}
    " perldoc-vim       {{{
    call add(g:spacevim_disabled_plugins, 'perldoc-vim')
    call s:add_load_repo('wsdjeg/perldoc-vim')
    " }}}
    " JavaUnit.vim      {{{
    call add(g:spacevim_disabled_plugins, 'JavaUnit.vim')
    call s:add_load_repo('wsdjeg/JavaUnit.vim')
    " }}}
    " ChineseLinter.vim      {{{
    call add(g:spacevim_disabled_plugins, 'ChineseLinter.vim')
    call s:add_load_repo('wsdjeg/ChineseLinter.vim')
    " }}}
    " gtags.vim         {{{
    call add(g:spacevim_disabled_plugins, 'vim-lua')
    call s:add_load_repo('wsdjeg/vim-lua')
    " }}}
    " gtags.vim         {{{
    call add(g:spacevim_disabled_plugins, 'Nvim-R')
    call s:add_load_repo('wsdjeg/Nvim-R')
    " }}}
    " vim-coffeescript         {{{
    call add(g:spacevim_disabled_plugins, 'vim-coffeescript')
    call s:add_load_repo('wsdjeg/vim-coffeescript')
    " }}}
    " vim-lookup         {{{
    call add(g:spacevim_disabled_plugins, 'vim-lookup')
    call s:add_load_repo('wsdjeg/vim-lookup')
    " }}}
    " gina.vim         {{{
    call add(g:spacevim_disabled_plugins, 'gina.vim')
    call s:add_load_repo('wsdjeg/gina.vim')
    " }}}
    " vimpyter         {{{
    call add(g:spacevim_disabled_plugins, 'vimpyter')
    call s:add_load_repo('wsdjeg/vimpyter')
    " }}}
    " tagbar-markdown         {{{
    call add(g:spacevim_disabled_plugins, 'tagbar-markdown')
    call s:add_load_repo('wsdjeg/tagbar-markdown')
    " }}}
    " vim-translate-me         {{{
    " call add(g:spacevim_disabled_plugins, 'vim-translate-me')
    " call s:add_load_repo('wsdjeg/vim-translate-me')
    " }}}
    for repo in s:repos
        call s:check_local_repo(repo)
    endfor
    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
    augroup myspacevim
        autocmd!
        autocmd FileType defx call s:defx_my_settings()
    augroup END
    let g:spacevim_layer_lang_java_formatter = '/home/wsdjeg/Downloads/google-java-format-1.5-all-deps.jar'
    command! CursorHighlight call s:cursor_highlight()
    let profile = SpaceVim#mapping#search#getprofile('rg')
    let default_opt = profile.default_opts + ['--no-ignore-vcs']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})

    let g:vimfiler_tree_opened_icon = ''
    let g:vimfiler_tree_closed_icon = ''
endfunction

let s:HI = SpaceVim#api#import('vim#highlight')

function! s:cursor_highlight() abort
    echo s:HI.syntax_at()
endfunction

function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
endfunction

let s:repos = []
function! s:add_load_repo(repo) abort
    call add(s:repos, a:repo)
    let &rtp = s:FILE.unify_path(expand($MYSRCDIR)) . split(a:repo, '/')[1]  . ',' . &rtp
endfunction

function! s:check_local_repo(repo) abort
    let dir = $MYSRCDIR . '/' . split(a:repo, '/')[1]
    if !isdirectory(expand(dir))
        call s:JOB.start(['git', 'clone', 'https://github.com/' . a:repo], {'cwd' : expand($MYSRCDIR), 
                    \ 'on_stdout' : function('s:clone_std'),
                    \ 'on_stderr' : function('s:clone_std'),
                    \ })
    endif
endfunction

let g:_mylog = []

function! s:clone_std(id, data, event) abort
    call add(g:_mylog, a:data)
endfunction


function! myspacevim#after()
    let s:CMD = SpaceVim#api#import('vim#command')
    let s:CMD.options = {
                \ '-f' : {
                \ 'description' : '',
                \ 'complete' : ['text'],
                \ },
                \ '-d' : {
                \ 'description' : 'Root directory for sources',
                \ 'complete' : 'file',
                \ },
                \ }
    function! CompleteTest(a, b, c)
        return s:CMD.complete(a:a, a:b, a:c)
    endfunction
    function! CompleteTestList(a, b, c)
        return s:CMD.completelist(a:a, a:b, a:c)
    endfunction
    function! Test(...)
    endfunction
    command! -nargs=* -complete=custom,CompleteTest
                \ Edit :call Test(<f-args>)
    command! -nargs=* -complete=customlist,CompleteTestList
                \ EditList :call Test(<f-args>)
endfunction
