let s:save_cpo = &cpo
set cpo&vim

let s:unite_source = {
      \ 'name': 'bmarks',
      \ 'hooks': {},
      \ 'action_table': {'*': {}},
      \ }

function! s:openurl(url) abort
 return printf('OpenBrowser %s', a:url)
endfunction

function! s:unite_source.gather_candidates(args, context)
  " [ ['desc', 'url'], ...]
  let urls = []
  let item = readfile(expand('~/.config/qutebrowser/bookmarks/urls'))
  for line in item
    let it = split(line)
    call add(urls, [join(it[1:]), it[0]])
  endfor
  let g:wsd = urls

  " "action__type" is necessary to avoid being added into cmdline-history.
  return map(urls, '{
        \ "word": v:val[0],
        \ "source": "bmarks",
        \ "kind": [ "command"],
        \ "action__command": s:openurl(v:val[1]),
        \ "action__type": ": ",
        \ }')
endfunction

function! unite#sources#bmarks#define()
  return s:unite_source
endfunction


"unlet s:unite_source

let &cpo = s:save_cpo
unlet s:save_cpo
