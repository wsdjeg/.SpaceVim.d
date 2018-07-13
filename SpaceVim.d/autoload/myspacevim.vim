function! myspacevim#before() abort
    call SpaceVim#logger#info('myspacevim#before called')
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
endfunction
