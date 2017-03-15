let g:spacevim_enable_debug = 1
"let g:spacevim_enable_ycm = 1
let g:spacevim_realtime_leader_guide = 1
augroup custom_config
    au!
    au VimEnter * call s:customSetting()
augroup END
set showcmd
func s:customSetting()

endf
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
let g:spacevim_enable_vimfiler_welcome = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
set rtp+=~/private/hospital-info
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
