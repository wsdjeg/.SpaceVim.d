let g:neomake_open_list = 2  " 1 open list and move cursor 2 open list without move cursor
let g:neomake_verbose = 0
if g:settings.enable_neomake
    augroup Neomake_wsd
        au!
        autocmd! BufWritePost * Neomake
    augroup END
endif
