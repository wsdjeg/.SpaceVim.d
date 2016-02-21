" Fsep && Psep
if has('win16') || has('win32') || has('win64')
    let s:Psep = ';'
    let s:Fsep = '\'
else
    let s:Psep = ':'
    let s:Fsep = '/'
endif
" auto install plugin manager
if g:settings.plugin_manager == 'neobundle'
    "auto install neobundle
    if filereadable(expand(g:settings.plugin_bundle_dir) . 'neobundle.vim'. s:Fsep. 'README.md')
        let g:settings.neobundle_installed = 1
    else
        if executable('git')
            exec '!git clone https://github.com/Shougo/neobundle.vim ' . g:settings.plugin_bundle_dir . 'neobundle.vim'
            let g:settings.neobundle_installed = 1
        else
            echohl WarningMsg | echom "You need install git!" | echohl None
        endif
    endif
    exec 'set runtimepath+='.g:settings.plugin_bundle_dir . 'neobundle.vim'
elseif g:settings.plugin_manager == 'dein'
    "auto install dein
    if filereadable(expand(g:settings.plugin_bundle_dir) . 'dein.vim'. s:Fsep. 'README.md')
        let g:settings.dein_installed = 1
    else
        if executable('git')
            exec '!git clone https://github.com/Shougo/dein.vim ' . g:settings.plugin_bundle_dir . 'dein.vim'
            let g:settings.dein_installed = 1
        else
            echohl WarningMsg | echom "You need install git!" | echohl None
        endif
    endif
    exec 'set runtimepath+='.g:settings.plugin_bundle_dir . 'dein.vim'
elseif g:settings.plugin_manager == 'vim-plug'
    "auto install vim-plug
    if filereadable(expand('~/.cache/vim-plug/autoload/plug.vim'))
        let g:settings.dein_installed = 1
    else
        if executable('curl')
            exec '!curl -fLo ~/.cache/vim-plug/autoload/plug.vim --create-dirs '
                        \. 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            let g:settings.dein_installed = 1
        else
            echohl WarningMsg | echom "You need install curl!" | echohl None
        endif
    endif
    exec 'set runtimepath+=~/.cache/vim-plug/'
endif
