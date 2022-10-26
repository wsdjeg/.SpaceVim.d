"=============================================================================
" find.vim --- vim plugin for find
" Copyright (c) 2016-2020 Wang Shidong & Contributors
" Author: Wang Shidong 
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" Loading SpaceVim api {{{
scriptencoding utf-8
let s:MPT = SpaceVim#api#import('prompt')
let s:JOB = SpaceVim#api#import('job')
let s:FILE = SpaceVim#api#import('file')
function! s:start_find() abort
  let s:MPT._quit = 1
  call s:MPT._clear_prompt()
  call s:close_buffer()
endfunction


function! s:close_buffer() abort
  exe 'noautocmd bwipeout' s:find_argvs_buffer_id
  noautocmd normal! :
endfunction
let s:MPT._onclose = function('s:close_buffer')

function! s:next_item() abort
  if line('.') == line('$')
    normal! gg
  else
    normal! j
  endif
  let argv = matchstr(getline('.'), '[-a-zA-Z0-9]*')
  let s:MPT._prompt.begin = substitute(s:MPT._prompt.begin, '[-a-zA-Z0-9]*$', argv, 'g')
  redraw
  call s:MPT._build_prompt()
endfunction

function! s:previous_item() abort
  if line('.') == 1
    normal! G
  else
    normal! k
  endif
  let argv = matchstr(getline('.'), '[-a-zA-Z0-9]*')
  let s:MPT._prompt.begin = substitute(s:MPT._prompt.begin, '[-a-zA-Z0-9]*$', argv, 'g')
  redraw
  call s:MPT._build_prompt()
endfunction

function! FindHospital() abort
  let s:MPT._handle_fly = function('s:handle_command_line')
  let s:MPT._function_key = {
        \ "\<Return>" : function('s:start_find'),
        \ "\<Tab>" : function('s:next_item'),
        \ "\<C-j>" : function('s:next_item'),
        \ "\<S-tab>" : function('s:previous_item'),
        \ "\<C-k>" : function('s:previous_item'),
        \ }
  noautocmd rightbelow split __spacevim_find_argv__
  let s:find_argvs_buffer_id = bufnr('%')
  setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nospell nonu norelativenumber
  setf SpaceVimFindArgv
  call s:MPT.open()
endfunction

function! s:enter() abort

endfunction

function! s:handle_command_line(cmd) abort
  noautocmd silent normal! "_dG
  call s:MPT._build_prompt()
endfunction
