let s:JOB = SpaceVim#api#import('job')
let s:NOTI = SpaceVim#api#import('notify')
function! s:stdout(id, data, event) abort
  call s:NOTI.notify(a:data)
endfunction
command! Rnoti call s:run_notiy()
" WMIC PATH Win32_Battery Get EstimatedChargeRemaining
" get the battery status in win 11
function! s:run_notiy() abort
  let input = input('command:')

  call s:JOB.start(input, {
        \ 'on_stdout' : function('s:stdout')
        \ })
endfunction
