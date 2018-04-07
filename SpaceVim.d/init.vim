"=============================================================================
" init.vim --- My SpaceVim config
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
"=============================================================================

" Load SpaceVim APIs: {{{
let s:JOB = SpaceVim#api#import('job')
let s:JSON = SpaceVim#api#import('data#json')
" }}}

" SpaceVim Options: {{{
let g:spacevim_default_indent = 4
let g:spacevim_enable_debug = 1
let g:spacevim_enable_ale = 0
let g:spacevim_enable_ycm = 0
let g:spacevim_lint_on_the_fly = 0
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
" let g:spacevim_enable_statusline_display_mode = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 0
let g:spacevim_statusline_separator = 'arrow'
let g:spacevim_github_username = 'wsdjeg'
let g:spacevim_auto_disable_touchpad = 0
let g:spacevim_layer_lang_java_formatter = expand('~/Downloads/google-java-format-1.3-all-deps.jar')
let g:spacevim_colorscheme = 'gruvbox'
let g:spacevim_guifont = 'DejaVu Sans Mono for Powerline 9'
let g:spacevim_custom_plugins = [
      \ ['lilydjwg/colorizer', {'merged' : 0}]
      \ ]
" }}}

" SpaceVim Layers: {{{
call SpaceVim#layers#load('ctrlp')
call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('github')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('VersionControl')
call SpaceVim#layers#load('tags')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('colorscheme',
      \ {
      \ 'random-theme' : 0,
      \ })
call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('lang#markdown',
      \ {
      \ 'enableWcwidth' : 1,
      \ 'listItemIndent' : 1,
      \ }
      \ )
" call SpaceVim#layers#disable('core#statusline')
" }}}

" My Privite Config: {{{
"
" record window {{{
" use slop to get the position and  weidth and heigth
let s:record_window_x = 0
let s:record_window_y = 0
let s:record_window_w = 1366
let s:record_window_h = 743
let s:record_id = 0
let s:record_file = ''
function! s:start_record() abort
  let s:cmd = ['byzanz-record', '-d', 40, '-x', s:record_window_x, '-y', s:record_window_y, '-w', s:record_window_w, '-h', s:record_window_h]
  redraw!
  let time = strftime('%Y-%m-%d-%H-%M-%S')
  let fname = [expand('~/Pictures/') . time . '.gif']
  let s:record_file = 'file://' . fname[0]
  let s:record_id = s:JOB.start(s:cmd + fname, {'on_exit' : funcref('s:record_exit')})
endfunction
function! s:stop_record() abort
  if s:record_id != 0
    call s:JOB.stop(s:record_id)
  endif
endfunction
function! s:record_exit(...) abort
  call s:fix_cycle(s:record_file)
endfunction

function! s:gifsicle_exit(...) abort
  echom 'record done: ' . s:record_file
  let s:record_id = 0
  let s:record_file = ''
  let s:record_window_x = 0
  let s:record_window_y = 0
  let s:record_window_w = 1366
  let s:record_window_h = 743
endfunction

function! s:fix_cycle(file) abort
  call s:JOB.start(['gifsicle', '--loopcount', a:file, '-o', a:file], {'on_exit' : funcref('s:gifsicle_exit')})
endfunction

function! s:set_record_window() abort
  call s:JOB.start(['slop', '-f', '{"x":%x, "y":%y, "w":%w, "h":%h}'], {'on_stdout' : funcref('s:slop_stdout')})
endfunction
function! s:slop_stdout(...) abort
  if len(a:2) == 1 && !empty(a:2[0])
    let slop_data = s:JSON.json_decode(a:2[0])
    let s:record_window_x = slop_data.x
    let s:record_window_y = slop_data.y
    let s:record_window_w = slop_data.w
    let s:record_window_h = slop_data.h
  endif
endfunction
nnoremap <silent> <Leader>sr :call <SID>start_record()<cr>
nnoremap <silent> <Leader>sd :call <SID>stop_record()<cr>
nnoremap <silent> <Leader>sw :call <SID>set_record_window()<cr>
" }}}

" }}}


autocmd FileType vader nnoremap <buffer> [SPC]lr :call <SID>run_vader()<cr>
let g:Pmd_Cmd = ['/home/wsdjeg/src/pmd/pmd-dist/target/pmd-bin-6.0.0-SNAPSHOT/bin/run.sh', 'pmd']


function! s:run_vader() abort
  Vader %
  nnoremap <buffer> q :bd<cr>
endfunction
set rtp+=~/SpaceVim/fzy.vim
" vim:set nofoldenable:
