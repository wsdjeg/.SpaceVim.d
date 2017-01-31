function! saveurl#save(url) abort
    if index(s:urls, a:url) == -1
        call add(s:urls, a:url)
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


