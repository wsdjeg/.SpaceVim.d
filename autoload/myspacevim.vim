scriptencoding utf-8

let s:SYS = SpaceVim#api#import('system')
let s:JOB = SpaceVim#api#import('job')
let s:FILE = SpaceVim#api#import('file')
function! myspacevim#before() abort
  let g:tagbar_type_markdown = {
        \ 'ctagsbin'  : 'D:\bin\mdctags.exe',
        \ 'ctagsargs' : '',
        \ 'kinds'     : [
        \     'a:h1:0:0',
        \     'b:h2:0:0',
        \     'c:h3:0:0',
        \     'd:h4:0:0',
        \     'e:h5:0:0',
        \     'f:h6:0:0',
        \ ],
        \ 'sro'        : '::',
        \ 'kind2scope' : {
        \     'a' : 'h1',
        \     'b' : 'h2',
        \     'c' : 'h3',
        \     'd' : 'h4',
        \     'e' : 'h5',
        \     'f' : 'h6',
        \ },
        \ 'scope2kind' : {
        \     'h1' : 'a',
        \     'h2' : 'b',
        \     'h3' : 'c',
        \     'h4' : 'd',
        \     'h5' : 'e',
        \     'h6' : 'f',
        \}
        \}
  set rtp+=~/.SpaceVim/build/vader/
  set rtp+=~/Desktop/vim-floaterm-master
  " set rtp+=f:\\minigrep\target\debug\minigrep.exe
  let $PATH .= ';e:\vim-async-dict\target\debug'
  " let $PATH .= ';e:\mdctags\target\debug'
  set rtp+=e:\\vim-async-dict
  set rtp+=d:\\repos\\gfr.vim
  set history=10000
  let g:LanguageClient_loggingFile = expand('~/LanguageClient.log')
  let g:neomru#file_mru_ignore_pattern = '^[a-z]\+://'
  let g:deoplete#enable_at_startup = 1
  " let g:bookmark_save_per_working_dir = 1
  " let g:tagbar_width = 60
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
      set luadll=D:\\Scoop\\apps\\lua\\5.4.2\\lua54.dll
    endif
    " Add D:\bin to PATH
    let $PATH .= ';D:\bin'
    " red language: https://www.red-lang.org/
    let $PATH .= ';D:\red'
    let $PATH .= ';C:\Users\wsdjeg\AppData\Local\Yarn\bin'
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
    " lint:  vint-errors
    let g:neomake_vim_vimlint_maker = {
          \ 'exe': 'cmd',
          \ 'args': ['/c', 'C:\Program Files\Git\bin\bash.exe', 'F:\vim-vimlint\bin\vimlint.sh', '-l', 'F:\vim-vimlint', '-p', 'F:\vim-vimlparser'],
          \ 'errorformat': '%f:%l:%c: %m',
          \ 'output_stream': 'stdout',
          \ }
  endif
  " }}}

  " here is a list of plugins which are used in SpaceVim, and I need to
  " debug locally:
  " All plugins arg cloned into $MYSRCDIR default is D:/repos
  let $MYSRCDIR = 'D:/repos'
  " 某些情况下该目录需要手动新建。
  " defind global var before using it:
  " vim-nim           {{{
  if SpaceVim#layers#isLoaded('lang#nim')
    let $PATH .= ';D:\nim\bin'
  endif
  " }}}
  " vim-powershell           {{{
  " }}}
  " }}}
  " markdown layer      {{{
  if SpaceVim#layers#isLoaded('lang#markdown')
  endif
  " lang#j layer      {{{
  if SpaceVim#layers#isLoaded('lang#j')
    let $PATH .= ';D:\Program Files\j\bin'
  endif
  " }}}
  " lang#ring layer      {{{
  if SpaceVim#layers#isLoaded('lang#ring')
    let $PATH .= ';D:\Program Files\ring\bin'
  endif
  " }}}
  " lang#vbnet layer      {{{
  if SpaceVim#layers#isLoaded('lang#vbnet')
    " visual basic .net
    let $PATH .= ';C:\Windows\Microsoft.NET\Framework\v3.5'
  endif
  " }}}
  " lang#zig layer      {{{
  if SpaceVim#layers#isLoaded('lang#zig')
    let $PATH .= ';D:\zig'
  endif
  " }}}
  " lang#io layer      {{{
  if SpaceVim#layers#isLoaded('lang#io')
    let $PATH .= ';D:\Program Files\io\bin'
  endif
  " }}}
  " lang#batch layer      {{{
  if SpaceVim#layers#isLoaded('lang#batch')
  endif
  " }}}
  " lang#idris layer      {{{
  if SpaceVim#layers#isLoaded('lang#idris')
    let $PATH .= ';D:\idris;D:\idris\mingw\bin'
  endif
  " }}}
  " lang#gosu layer      {{{
  if SpaceVim#layers#isLoaded('lang#gosu')
    let $PATH .= ';D:\gosu\bin'
  endif
  " }}}
  " lang#lisp layer      {{{
  if SpaceVim#layers#isLoaded('lang#lisp')
  endif
  " lang#dart layer      {{{
  if SpaceVim#layers#isLoaded('lang#dart')
    " fuck dart gfw https://flutter.cn/community/china
    let $PUB_HOSTED_URL = 'https://pub.flutter-io.cn'
    let $FLUTTER_STORAGE_BASE_URL = 'https://storage.flutter-io.cn'
  endif
  " }}}
  " lang#supercollider layer      {{{
  if SpaceVim#layers#isLoaded('lang#supercollider')
  endif
  " }}}
  " ctrlp layer      {{{
  if SpaceVim#layers#isLoaded('ctrlp')
  endif
  " }}}
  " vim-slumlord      {{{
  " }}}
  " Github.vim        {{{
  " }}}
  " vim-elm           {{{
  " }}}
  " vim-asciidoc      {{{
  if SpaceVim#layers#isLoaded('lang#asciidoc')
  endif
  " }}}
  " perldoc-vim       {{{
  " }}}
  " ChineseLinter.vim      {{{
  " }}}
  " gtags.vim         {{{
  " }}}
  " gtags.vim         {{{
  " }}}
  " vim-coffeescript         {{{
  if SpaceVim#layers#isLoaded('lang#coffeescript')
  endif
  " }}}
  " gina.vim         {{{
  " }}}
  " vimpyter         {{{
  if SpaceVim#layers#isLoaded('lang#ipynb')
  endif
  " }}}
  " lang#pact layer local config
  if SpaceVim#layers#isLoaded('lang#pact')
  endif
  " go language config
  let $PATH .= ';D:\GOPATH\bin'
  let $GOPATH = 'D:\GOPATH'
  if SpaceVim#layers#isLoaded('lang#go')
  endif
  if SpaceVim#layers#isLoaded('autocomplete')
    " so ~\.Spacevim\config\plugins\deoplete.vim
  endif
  " lang#assembly layer local config
  if SpaceVim#layers#isLoaded('lang#assembly')
  endif
  " lang#python layer local config
  if SpaceVim#layers#isLoaded('lang#python')
  endif
  if SpaceVim#layers#isLoaded('lang#xquery')
  endif
  if SpaceVim#layers#isLoaded('lang#janet')
    let $PATH .= ';D:\janet'
  endif
  " debug layer local config
  if SpaceVim#layers#isLoaded('debug')
  endif
  " lang#pony layer local config
  if SpaceVim#layers#isLoaded('lang#pony')
    " download pony.zip from https://dl.bintray.com/pony-language/ponyc-win/
    " install .net framwork 4.5.1 https://www.microsoft.com/en-us/download/details.aspx?id=40779
    " install MSVC 2015 build tools https://visualstudio.microsoft.com/vs/older-downloads/
    " Microsoft Build Tools 2015 Update 3 
    let $PATH .= ';D:\Program Files\pony\ponyc\bin'
  endif
  " debug.vim         {{{
  " }}}
  " tagbar-markdown         {{{
  " }}}
  " vim-translate-me         {{{
  " }}}
  for repo in s:repos
    call s:check_local_repo(repo)
  endfor
  let g:delimitMate_expand_cr = 1
  let g:spacevim_layer_lang_java_formatter = '/home/wsdjeg/Downloads/google-java-format-1.5-all-deps.jar'
  command! CursorHighlight call s:cursor_highlight()
  let profile = SpaceVim#mapping#search#getprofile('rg')
  " let default_opt = profile.default_opts + ['-g', '!bundle']
  " call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})

  let g:vimfiler_tree_opened_icon = ''
  let g:vimfiler_tree_closed_icon = ''

  function! s:cargo_task() abort
    let cargo_conf = SpaceVim#util#findFileInParent('Cargo.toml', expand('%:p'))
    if !empty(cargo_conf)
      let commands = ['build', 'run', 'test']
      let conf = {}
      for cmd in commands
        call extend(conf, {
              \ cmd : {
              \ 'command': 'cargo',
              \ 'args' : [cmd],
              \ 'isDetected' : 1,
              \ 'detectedName' : 'cargo:',
              \ 'options' : {'cwd' : fnamemodify(cargo_conf, ':p:h') },
              \ }
              \ })
      endfor
      call extend(conf, {
            \ 'build-relase' : {
            \ 'command': 'cargo',
            \ 'args' : ['build', '--release'],
            \ 'isDetected' : 1,
            \ 'detectedName' : 'cargo:',
            \ 'options' : {'cwd' : fnamemodify(cargo_conf, ':p:h') },
            \ }
            \ })
      return conf
    else
      return {}
    endif
  endfunction
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_task'))
  function! s:mdbook_task() abort
    let mdbook_conf = SpaceVim#util#findFileInParent('book.toml', expand('%:p'))
    if !empty(mdbook_conf)
      let commands = ['serve', 'build', 'watch']
      let conf = {}
      for cmd in commands
        call extend(conf, {
              \ cmd : {
              \ 'command': 'mdbook',
              \ 'args' : [cmd],
              \ 'isDetected' : 1,
              \ 'detectedName' : 'mdbook:',
              \ 'isBackground' : 1,
              \ 'options' : {'cwd' : fnamemodify(mdbook_conf, ':p:h') },
              \ }
              \ })
      endfor
      return conf
    else
      return {}
    endif
  endfunction
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:mdbook_task'))

  autocmd BufNewFile,BufEnter *.c let b:alternate_file_config = {
        \ "src/*.c" : {
        \ "doc" : "docs/{}.md",
        \ "alternate" : "include/{}.h",
        \ }
        \ }
  " autocmd BufEnter * call s:update_defx()
  autocmd BufNewFile,BufEnter *.h let b:alternate_file_config = {
        \ "include/*.h" : {
        \ "alternate" : "scr/{}.c",
        \ }
        \ }
  call SpaceVim#custom#SPCGroupName(['S'], '+StaySharp0 Custom')
  call SpaceVim#custom#SPC('noremap', ['S','a'], 'ggvG$', 'all selection', 0)
  call SpaceVim#custom#SPC('nmap', ['S','y'], '<Space>Sa<leader>y', 'all copy', 0)
  call SpaceVim#custom#SPC('nmap', ['S','d'], '<Space>Sy<Space>Sad', 'all cut', 0)
endfunction

function! s:update_defx() abort
  if filereadable(bufname('%'))
    normal [SPC]fo
    wincmd p
  endif
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
  if has('nvim-0.7.0')
    autocmd InsertLeave * lua require('spacevim.plugin.imselect').english()
  endif
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
  let g:async_dicts = 'D:\me\dict\words.txt'
  let &dictionary = g:async_dicts
  let  g:LanguageClient_useVirtualText="No"
  lua require('wsdjeg.ftplugin.lua')
endfunction
