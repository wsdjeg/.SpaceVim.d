let g:spacevim_enable_debug = 1
"let g:spacevim_enable_ycm = 1
let g:spacevim_realtime_leader_guide = 1
augroup custom_config
    au!
    au VimEnter * call s:customSetting()
augroup END
func s:customSetting()

    inoremap <silent> <buffer> <leader>UU <esc>bgUwea
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
call SpaceVim#layers#load('lang#lisp')
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
let g:spacevim_buffer_index_type = 0
set rtp+=~/private/hospital-info
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
let g:spacevim_layer_lang_java_formatter = expand('~/Downloads/google-java-format-1.3-all-deps.jar')
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''
let g:spacevim_statusline_separator = 'arrow'
let g:spacevim_guifont = 'Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12'
let g:neomake_open_list = 0
let g:neomake_cpp_enabled_makers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11"]
