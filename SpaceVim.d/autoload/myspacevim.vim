function! myspacevim#before() abort
    call SpaceVim#logger#info('myspacevim#before called')
    let g:spacevim_disabled_plugins = ['vim-nim']
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    set rtp+=~/SpaceVim/vim-nim
    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
endfunction
