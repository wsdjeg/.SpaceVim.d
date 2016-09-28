" make vim and neovim use same job func.
let s:jobs = {}
function! job#start(cmd, ...) abort
   if has('nvim')
   endif
   let job = job_start(a:cmd)
   let id = len(s:jobs) + 1
   call extend(s:jobs, {id : job})
   return id
endfunction

function! job#stop(id) abort
   if has('nvim')
   endif
   if has_key(s:jobs, a:id)
       call job_stop(get(s:jobs, a:id))
       call remove(s:jobs, a:id)
   endif
endfunction

function! job#send(job, data) abort

endfunction

function! job#status(id) abort
   if has('nvim')
   endif
   if has_key(s:jobs, a:id)
       return job_status(get(s:jobs, a:id))
   endif
endfunction

function! job#list() abort
    return copy(s:jobs)
endfunction
