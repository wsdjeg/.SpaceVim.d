let s:SYS = SpaceVim#api#import('system')

function! myspacevim#before() abort
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    call SpaceVim#logger#info('myspacevim#before called')

    " Windows bin utils {{{
    if s:SYS.isWindows
        " Downloads gun global from:
        " http://adoxa.altervista.org/global/
        " GLOBAL 6.6.3 Win32 (938k)
        let $PATH .= ';D:\Program Files\gtags\bin'
        " Downloads coreutils from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/coreutils/5.3.0/coreutils-5.3.0-bin.zip
        " coreutils-5.3.0-bin.zip
        let $PATH .= ';D:\Program Files\coreutils\bin'
        " Downloads grep from
        " https://nchc.dl.sourceforge.net/project/gnuwin32/grep/2.5.4/grep-2.5.4-setup.exe
        let $PATH .= ';D:\Program Files\GnuWin32\bin'
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
        let $PATH .= ';D:\bin'
        "
        " When using neovim in windows the only var need to be set is:
        " PYTHON_HOST_PROG 
        " C:\Python27\python.exe
        " PYTHON3_HOST_PROG
        " C:\Users\Administrator\AppData\Local\Programs\Python\Python37\python.exe
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
    set rtp+=$MYSRCDIR/vim-nim
    " }}}
    " gtags.vim         {{{
    call add(g:spacevim_disabled_plugins, 'gtags.vim')
    set rtp+=$MYSRCDIR/gtags.vim
    " }}}
    " vim-markdown      {{{
    call add(g:spacevim_disabled_plugins, 'vim-markdown')
    set rtp+=$MYSRCDIR/vim-markdown
    " }}}
    " vim-slumlord      {{{
    call add(g:spacevim_disabled_plugins, 'vim-slumlord')
    set rtp+=$MYSRCDIR/vim-slumlord
    " }}}
    " SourceCounter     {{{
    call add(g:spacevim_disabled_plugins, 'SourceCounter.vim')
    set rtp+=$MYSRCDIR/SourceCounter.vim
    " }}}
    " Github.vim        {{{
    call add(g:spacevim_disabled_plugins, 'GitHub-api.vim')
    set rtp+=$MYSRCDIR/GitHub.vim
    " }}}
    " vim-elm           {{{
    call add(g:spacevim_disabled_plugins, 'vim-elm')
    set rtp+=$MYSRCDIR/vim-elm
    " }}}
    " vim-asciidoc      {{{
    call add(g:spacevim_disabled_plugins, 'vim-asciidoc')
    set rtp+=$MYSRCDIR/vim-asciidoc
    " }}}
    " perldoc-vim       {{{
    call add(g:spacevim_disabled_plugins, 'perldoc-vim')
    set rtp+=$MYSRCDIR/perldoc-vim
    " }}}
    " JavaUnit.vim      {{{
    call add(g:spacevim_disabled_plugins, 'JavaUnite.vim')
    set rtp+=$MYSRCDIR/JavaUnit.vim
    " }}}


    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
    set rtp+=~/SpaceVim/ChineseLinter.vim
    augroup myspacevim
        autocmd!
        autocmd FileType defx call s:defx_my_settings()
    augroup END
    let g:spacevim_layer_lang_java_formatter = '/home/wsdjeg/Downloads/google-java-format-1.5-all-deps.jar'
    command! CursorHighlight call s:cursor_highlight()
    let profile = SpaceVim#mapping#search#getprofile('rg')
    let default_opt = profile.default_opts + ['--no-ignore-vcs']
    call SpaceVim#mapping#search#profile({'rg' : {'default_opts' : default_opt}})
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
