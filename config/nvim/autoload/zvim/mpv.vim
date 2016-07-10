let s:playId = 0
function! zvim#mpv#play(file,...) abort
   if s:playId != 0
       call jobstop(s:playId)
       let s:playId = 0
   endif
   let s:playId =  jobstart(['mpv','--vid=no',a:file])
endfunction
