let s:color1 = '#121212'
let s:color2 = '#121212'
let s:color3 = '#121212'
let s:color4 = '#121212'
let s:color5 = '#121212'
let s:color6 = '#121212'
let s:color7 = '#121212'
let s:color8 = '#121212'
let s:color9 = '#121212'
let s:color0 = '#121212'

" 32 列 16                                                  |                                               |       

let s:logo = 
            \ [
            \ [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            \ [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 2, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
            \ [5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 2, 1, 5, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5],
            \ [5, 5, 1, 5, 3, 3, 3, 3, 3, 3, 3, 3, 6, 1, 4, 4, 4, 2, 1, 5, 1, 3, 3, 3, 3, 3, 3, 3, 3, 3, 6, 1],
            \ [5, 5, 5, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 4, 2, 1, 5, 1, 6, 3, 3, 3, 3, 3, 3, 6, 1, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 4, 4, 4, 2, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 5, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 4, 4, 4, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 5, 5, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 4, 4, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 5, 5, 5, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 4, 1, 5, 3, 5, 3, 3, 3, 3, 6, 1, 5, 5, 5, 5, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 4, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 5, 5, 5, 5, 5, 5],
            \ [5, 5, 5, 5, 1, 5, 3, 3, 3, 3, 6, 1, 4, 4, 4, 1, 5, 3, 3, 3, 3, 3, 3, 6, 1, 1, 5, 5, 5, 5, 5, 5],
            \ ]

let s:colorids = []

function! s:set_bg_color() abort
    " clear all color in current buffer
endfunction

function! s:set_color(pos, line) abort

endfunction

function! s:clear_colors() abort

endfunction

function! s:show_logo() abort
    call add(s:colorids, s:set_bg_color())
    let l = line('w0')
    for pos in s:logo
        call extend(s:colorids, s:set_color(pos))
        let l = l + 1
    endfor

    call timer_start(2000, function('s:clear_colors'), {'repeat' : 1})
endfunction

command! VimLogo call s:show_logo()

