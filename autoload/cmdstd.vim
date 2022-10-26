let s:JOB = SpaceVim#api#import('job')
function! cmdstd#run(cmd) abort
    let s:jobid = s:JOB.start(a:cmd, 
                \ {
                \ 'on_stdout' : 'cmdstd#stdout',
                \ 'on_stderr' : 'cmdstd#stderr',
                \ 'on_exit' : 'cmdstd#exit',
                \ }
                \ )
endfunction

function! cmdstd#stdout(id, data, event) abort
    for line in a:data
        echom 'stdout > ' . line
    endfor
endfunction
function! cmdstd#stderr(id, data, event) abort
    for line in a:data
        echom 'stderr > ' . line
    endfor
endfunction
function! cmdstd#exit(id, data, event) abort
    echom 'exit > ' . a:data
endfunction

function! cmdstd#send(data) abort

    call s:JOB.send(s:jobid, a:data)

endfunction

function! cmdstd#log() abort

endfunction
