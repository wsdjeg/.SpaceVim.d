scriptencoding utf-8
let s:SYS = SpaceVim#api#import('system')
let s:JOB = SpaceVim#api#import('job')
let s:FILE = SpaceVim#api#import('file')

function! myspacevim#before() abort
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    set dictionary+=C:\\Users\\wsdjeg\\DotFiles\\dict\\words.txt
    set history=10000
    let g:LanguageClient_loggingFile = expand('~/LanguageClient.log')
    let g:neomru#file_mru_ignore_pattern = '^[a-z]\+://'
    let g:deoplete#enable_at_startup = 1
    " Windows bin utils {{{
    if s:SYS.isWindows
        " Neovim default layout
        "D:\Program Files\Neovim\bin\nvim-qt.exe" -qwindowgeometry 1300x650+20+20
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
        " Perl language
        " http://strawberryperl.com/download/5.28.1.1/strawberry-perl-5.28.1.1-64bit.zip
        " let $PATH .= ';D:\strawberry-perl\perl\bin'
        " Java language
        " let $PATH .= ';D:\Program Files\Java\jdk1.8.0_191\bin'
        " let $PATH .= ';D:\Program Files\maven\bin'
        " Lua language
        " let $PATH .= ';D:\Program Files\lua-5.3.4_Win64_bin'
        if exists('+luadll')
            set luadll=D:\\scoop\\apps\\lua53\\current\\lua53.dll
        endif
        " Add D:\bin to PATH
        let $PATH .= ';D:\bin'
        " red language: https://www.red-lang.org/
        let $PATH .= ';D:\red'
        " kotlin native
        " let $PATH .=';D:\kotlin\bin'
        " kotlin compiler
        " let $PATH .=';D:\kotlinc\bin'
        " Add php, scoop install php
        " let $PATH .= ';D:\Program Files\php'
        " SpaceVim server client
        let $PATH .= ';C:\Users\wsdjeg\.SpaceVim\bin'
        let $PATH .= ';C:\Users\wsdjeg\SpaceVim\bin'
        " forth language PATH
        let $PATH .= ';D:\Program Files\bigforth'
        " v language PATH
        let $VROOT = 'D:\Program Files\v'
        let $PATH .= ';D:\Program Files\v'
        " fuck the Python37 PATH
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
    " 某些情况下该目录需要手动新建。
    " defind global var before using it:
    let g:spacevim_disabled_plugins = get(g:, 'spacevim_disabled_plugins', [])
    " vim-nim           {{{
    call add(g:spacevim_disabled_plugins, 'vim-nim')
    call s:add_load_repo('wsdjeg/vim-nim')
    " }}}
    " vim-powershell           {{{
    call add(g:spacevim_disabled_plugins, 'vim-powershell')
    call s:add_load_repo('wsdjeg/vim-powershell')
    " }}}
    " gtags.vim         {{{
    if SpaceVim#layers#isLoaded('gtags')
        call add(g:spacevim_disabled_plugins, 'gtags.vim')
        call s:add_load_repo('SpaceVim/gtags.vim')
    endif
    " }}}
    " markdown layer      {{{
    if SpaceVim#layers#isLoaded('lang#markdown')
        call add(g:spacevim_disabled_plugins, 'vim-markdown')
        call s:add_load_repo('SpaceVim/vim-markdown')
    endif
    " lang#j layer      {{{
    if SpaceVim#layers#isLoaded('lang#j')
        let $PATH .= ';D:\Program Files\j\bin'
        call add(g:spacevim_disabled_plugins, 'vim-j')
        call s:add_load_repo('wsdjeg/vim-j')
    endif
    " }}}
    " lang#io layer      {{{
    if SpaceVim#layers#isLoaded('lang#io')
        let $PATH .= ';D:\Program Files\io\bin'
        call add(g:spacevim_disabled_plugins, 'vim-iolang')
        call s:add_load_repo('wsdjeg/vim-iolang')
    endif
    " }}}
    " lang#batch layer      {{{
    if SpaceVim#layers#isLoaded('lang#batch')
        call add(g:spacevim_disabled_plugins, 'vim-batch')
        call s:add_load_repo('wsdjeg/vim-batch')
    endif
    " }}}
    " lang#idris layer      {{{
    if SpaceVim#layers#isLoaded('lang#idris')
        let $PATH .= ';D:\idris;D:\idris\mingw\bin'
        call add(g:spacevim_disabled_plugins, 'vim-idris')
        call s:add_load_repo('wsdjeg/vim-idris')
    endif
    " }}}
    " lang#gosu layer      {{{
    if SpaceVim#layers#isLoaded('lang#gosu')
        let $PATH .= ';D:\gosu\bin'
        call add(g:spacevim_disabled_plugins, 'vim-gosu')
        call s:add_load_repo('wsdjeg/vim-gosu')
    endif
    " }}}
    " lang#lisp layer      {{{
    if SpaceVim#layers#isLoaded('lang#lisp')
        call add(g:spacevim_disabled_plugins, 'vim-lisp')
        call s:add_load_repo('wsdjeg/vim-lisp')
    endif
    " }}}
    " lang#supercollider layer      {{{
    if SpaceVim#layers#isLoaded('lang#supercollider')
        call add(g:spacevim_disabled_plugins, 'vim-supercollider')
        call s:add_load_repo('wsdjeg/vim-supercollider')
    endif
    " }}}
    " ctrlp layer      {{{
    if SpaceVim#layers#isLoaded('ctrlp')
        call add(g:spacevim_disabled_plugins, 'ctrlp.vim')
        call s:add_load_repo('wsdjeg/ctrlp.vim')
        call add(g:spacevim_disabled_plugins, 'ctrlp-menu')
        call s:add_load_repo('wsdjeg/ctrlp-menu')
        call add(g:spacevim_disabled_plugins, 'ctrlp-yank')
        call s:add_load_repo('wsdjeg/ctrlp-yank')
        call add(g:spacevim_disabled_plugins, 'vim-ctrlp-message')
        call s:add_load_repo('wsdjeg/vim-ctrlp-message')
    endif
    " }}}
    " ctrlp layer      {{{
    if SpaceVim#layers#isLoaded('git')
        call add(g:spacevim_disabled_plugins, 'git.vim')
        call s:add_load_repo('wsdjeg/git.vim')
    endif
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
    if SpaceVim#layers#isLoaded('cscope')
        call add(g:spacevim_disabled_plugins, 'cscope.vim')
        call s:add_load_repo('SpaceVim/cscope.vim')
    endif
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
    if SpaceVim#layers#isLoaded('lang#coffeescript')
        call add(g:spacevim_disabled_plugins, 'vim-coffeescript')
        call s:add_load_repo('wsdjeg/vim-coffeescript')
    endif
    " }}}
    " vim-lookup         {{{
    call add(g:spacevim_disabled_plugins, 'vim-lookup')
    call s:add_load_repo('wsdjeg/vim-lookup')
    " }}}
    " gina.vim         {{{
    " call add(g:spacevim_disabled_plugins, 'gina.vim')
    " call s:add_load_repo('wsdjeg/gina.vim')
    " }}}
    " vimpyter         {{{
    if SpaceVim#layers#isLoaded('lang#ipynb')
        call add(g:spacevim_disabled_plugins, 'vimpyter')
        call s:add_load_repo('wsdjeg/vimpyter')
    endif
    " }}}
    " lang#pact layer local config
    if SpaceVim#layers#isLoaded('lang#pact')
        call add(g:spacevim_disabled_plugins, 'vim-pact')
        call s:add_load_repo('wsdjeg/vim-pact')
    endif
    " go language config
    let $PATH .= ';D:\GOPATH\bin'
    let $GOPATH = 'D:\GOPATH'
    if SpaceVim#layers#isLoaded('lang#go')
    endif
    if SpaceVim#layers#isLoaded('denite')
        " call add(g:spacevim_disabled_plugins, 'denite.nvim')
        " call s:add_load_repo('SpaceVim/denite.nvim')
        " so ~\.Spacevim\config\plugins\denite.vim
        call add(g:spacevim_disabled_plugins, 'Unite-sources')
        call s:add_load_repo('SpaceVim/Unite-sources')
    endif
    if SpaceVim#layers#isLoaded('autocomplete')
        " call add(g:spacevim_disabled_plugins, 'deoplete.nvim')
        " call s:add_load_repo('SpaceVim/deoplete.nvim')
        " so ~\.Spacevim\config\plugins\deoplete.vim
    endif
    " lang#assembly layer local config
    if SpaceVim#layers#isLoaded('lang#assembly')
        call add(g:spacevim_disabled_plugins, 'vim-assembly')
        call s:add_load_repo('wsdjeg/vim-assembly')
    endif
    " debug layer local config
    if SpaceVim#layers#isLoaded('debug')
        call add(g:spacevim_disabled_plugins, 'vim-debug')
        call s:add_load_repo('wsdjeg/vim-debug')
    endif
    " lang#pony layer local config
    if SpaceVim#layers#isLoaded('lang#pony')
        " download pony.zip from https://dl.bintray.com/pony-language/ponyc-win/
        " install .net framwork 4.5.1 https://www.microsoft.com/en-us/download/details.aspx?id=40779
        " install MSVC 2015 build tools https://visualstudio.microsoft.com/vs/older-downloads/
        " Microsoft Build Tools 2015 Update 3 
        let $PATH .= ';D:\Program Files\pony\ponyc\bin'
        call add(g:spacevim_disabled_plugins, 'vim-pony')
        call s:add_load_repo('wsdjeg/vim-pony')
    endif
    " debug.vim         {{{
    call add(g:spacevim_disabled_plugins, 'debug.vim')
    call s:add_load_repo('wsdjeg/debug.vim')
    " }}}
    " tagbar-markdown         {{{
    call add(g:spacevim_disabled_plugins, 'tagbar-markdown')
    call s:add_load_repo('wsdjeg/tagbar-markdown')
    call s:add_load_repo('wsdjeg/vim-fuzzy-search')
    " }}}
    " vim-translate-me         {{{
    " call add(g:spacevim_disabled_plugins, 'vim-translate-me')
    " call s:add_load_repo('wsdjeg/vim-translate-me')
    " }}}
    call s:add_load_repo('wsdjeg/nvim_if_lua')
    for repo in s:repos
        call s:check_local_repo(repo)
    endfor
    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
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
    " let g:neoformat_enabled_markdown = ['remark']
endfunction
