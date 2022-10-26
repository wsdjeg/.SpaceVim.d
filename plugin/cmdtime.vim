let s:CLOCK = SpaceVim#api#import('clock')
function! CmdTime(str) abort
    call s:CLOCK.start()
    exe a:str
    return s:CLOCK.end()
endfunction
