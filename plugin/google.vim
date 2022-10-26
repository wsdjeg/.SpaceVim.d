let s:JOB = SpaceVim#api#import('job')



command! -nargs=? Google call s:find(<q-args>)


function! s:find(expr) abort
    if empty(a:expr)
        let qstr = expand('<cword>')
    else
        let qstr = a:expr
    endif
    let cmd = ['C:\Program Files (x86)\Google\Chrome\Application\chrome.exe', printf('https://www.google.com/search?q=%s', qstr)]
    call s:JOB.start(cmd, {
                \ 'detach' : v:true,
                \ })
endfunction

