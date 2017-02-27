let g:spacevim_enable_debug = 1
"let g:spacevim_enable_ycm = 1
let g:spacevim_error_symbol = '✹'
let g:spacevim_warning_symbol = '✴'
let g:airline#extensions#neomake#error_symbol = '•:'
let g:airline#extensions#neomake#warning_symbol = '•:'
let g:spacevim_realtime_leader_guide = 1
augroup custom_config
    au!
    au VimEnter * call s:customSetting()
augroup END
set showcmd
func s:customSetting()
endf
let g:spacevim_custom_plugins = [
            \ ['colepeters/spacemacs-theme.vim', {'merged' : 0}],
            \ ['liuchengxu/space-vim-dark', {'merged' : 0}],
            \ ]
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('shell')   
let g:spacevim_guifont='Source\ Code\ Pro:h9'
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_buffer_index_type = 1
