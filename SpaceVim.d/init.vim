let g:spacevim_enable_debug = 1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let g:spacevim_enable_ycm = 1
let g:spacevim_realtime_leader_guide = 1
augroup custom_config
    au!
    au VimEnter * call s:customSetting()
augroup END
set showcmd
func s:customSetting()

endf
let g:spacevim_custom_plugins = [
    \ ['tweekmonster/startuptime.vim', {'merged' : 0}],
    \ ['SpaceVim/spacemacs-theme.vim', {'merged' : 0}],
    \ ['mivok/vimtodo', {'merged' : 0}],
    \ ['rakr/vim-one', {'merged' : 0}],
    \ ]
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#swig')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('tools#screensaver')
call SpaceVim#layers#load('shell')   
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
set rtp+=~/private/hospital-info
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
let g:spacevim_layer_lang_java_formatter = expand('~/Downloads/google-java-format-1.3-all-deps.jar')
let g:ctrlp_map = ''
nnoremap <silent> <C-p> :Denite file_rec<CR>
let ack = filter(['ack-grep', 'ack'], 'executable(v:val)')
if !empty(ack)
    let &grepprg=ack[0]. ' -H --column'
    set grepformat^=%f:%l:%c:%m
elseif executable('ag')
    let &grepprg='ag --vimgrep'
    set grepformat^=%f:%l:%c:%m
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

