if has('nvim')
    let s:F = SpaceVim#api#import('neovim#floating')
else
    let s:F = SpaceVim#api#import('vim#floating')
endif
function! TestFloat() abort
    let b = bufnr()
    let option = 
          \ {
          \ 'relative': 'editor',
          \ 'width'   : &columns, 
          \ 'height'  : 5,
          \ 'row'     : &lines - 7,
          \ 'col'     : 0
          \ }
    let s:id = s:F.open_win(b, 1, option)
    let g:wsd = s:id
endfunction

function! Test_win_exe() abort
    call win_execute(s:id, 'call matchaddpos("WarningMsg", [1, 1, 2])')
endfunction

function! TestFloatClear() abort
    call s:F.win_close(s:id, 1)
endfunction

function! TestFloatconfig() abort
    let option = 
          \ {
          \ 'relative': 'editor',
          \ 'width'   : &columns, 
          \ 'height'  : 3 + 2,
          \ 'row'     : 29,
          \ 'col'     : 0
          \ }
    call s:F.win_config(s:id, option)
    
endfunction


function! Testnoti() abort
    call SpaceVim#api#import('notification').notification('This is a one', 'vimUserFunc')
    sleep 800m
    call SpaceVim#api#import('notification').notification('This is a two', 'vimUserFunc')
    sleep 800m
    call SpaceVim#api#import('notification').notification('This is a three', 'vimUserFunc')
endfunction


function! TestFloterm() abort
    let bf = term_start('cmd', {'hidden' : 1})
    let option = 
          \ {
          \ 'relative': 'editor',
          \ 'width'   : &columns, 
          \ 'height'  : 8,
          \ 'row'     : 3,
          \ 'col'     : 0
          \ }
    let s:id = s:F.open_win(bf, 1, option)
endfunction
