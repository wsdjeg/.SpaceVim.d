function! s:test(...) abort
    for func in a:000
        let start = reltime()
        call call(func, [])
        let seconds = reltimefloat(reltime(start))
        echo printf('%s: %s seconds', func, seconds)
    endfor
endfunction

command! -nargs=+ TestFunc call s:test(<f-args>)
