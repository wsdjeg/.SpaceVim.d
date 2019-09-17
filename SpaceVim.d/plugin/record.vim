" Load SpaceVim APIs: {{{
let s:JOB = SpaceVim#api#import('job')
let s:JSON = SpaceVim#api#import('data#json')
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


" vim:set nofoldenable:
