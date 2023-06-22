function! s:generate() abort
    return filter(split(&rtp, ','), 'isdirectory(v:val)')
endfunction

function! s:help_files() abort
    return globpath(&rtp, 'doc/*.txt', 0, 1)
endfunction

command! GrepRtp call SpaceVim#plugins#flygrep#open({
          \ 'input' : '',
          \ 'dir' : s:generate(),
          \ })

command! -nargs=? Helpgrep call SpaceVim#plugins#flygrep#open({
          \ 'input' : <q-args>,
          \ 'files' : s:help_files(),
          \ })
