let s:JOB = SpaceVim#api#import('job')



command! -nargs=? Bing call s:find(<q-args>)


function! s:find(expr) abort
    if empty(a:expr)
        let qstr = expand('<cword>')
    else
        let qstr = a:expr
    endif
    let cmd = ['C:\Program Files\Google\Chrome\Application\chrome.exe', printf('https://cn.bing.com/search?q=%s', qstr)]
    call s:JOB.start(cmd, {
                \ 'detach' : v:true,
                \ })
endfunction
