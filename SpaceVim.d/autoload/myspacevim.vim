function! myspacevim#before() abort
  call SpaceVim#logger#info('myspacevim#before called')
  set rtp+=~/SpaceVim/SpaceVim/build/vader
call add(g:spacevim_project_rooter_patterns, 'package.json')
endfunction
