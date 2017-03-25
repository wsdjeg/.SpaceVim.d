function! saveurl#save(url, ...) abort
    if a:0 > 0
        let line = a:url . '  -  ' . join(a:000, ' ')
    else
        let line = a:url
    endif
    if index(s:urls, line) == -1
        call add(s:urls, line)
    endif
    call s:sync()
endfunction

let s:database = fnamemodify(expand('<sfile>'), ':h').'/urls.txt'
let s:urls = []
if filereadable(s:database)
    let s:urls = readfile(s:database, '')
endif

func! s:sync() abort
    if filewritable(s:database)
        call writefile(s:urls,s:database, '')
    endif
endf


