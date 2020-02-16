let s:numbers = []
function! s:find_fuck_num(...) abort
    let opt = get(a:000, 0, '==')
    let num = get(a:000, 1, str2nr(expand('<cword>')))
    for line in range(line('$'))
        call add(s:numbers, s:get_nums(line, opt, num))
    endfor
endfunction
" heloo ss 123 ss 879 sss 1112
function! s:get_nums(line, opt, num) abort
    
endfunction


command! -nargs=* FindFuckNum call s:find_fuck_num(<f-args>)
