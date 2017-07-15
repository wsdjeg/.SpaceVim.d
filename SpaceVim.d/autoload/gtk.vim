let s:JOB = SpaceVim#api#import('job')

function! gtk#box()
    call s:JOB.start(['python', 'messagebox.py'], {'on_stdout':funcref('s:stdout'), 'pty' : 1})
endfunction

function! s:stdout(id, data, event) abort
    let message = a:data[0]
    let m = substitute(message, '$', '', 'g')
    echom m
endfunction
