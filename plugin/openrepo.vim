let s:JOB = SpaceVim#api#import('job')
command! Openrepo call s:openrepo()


function! s:openrepo() abort
    let save_reg = @"
    normal! yi'
    let repo = @"
    let @" = save_reg
    let cmd = ['C:\Program Files\Google\Chrome\Application\chrome.exe', printf('https://github.com/%s', repo)]
    call s:JOB.start(cmd, {
                \ 'detach' : v:true,
                \ })
endfunction
