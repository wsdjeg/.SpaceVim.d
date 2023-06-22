" Drag & Drop: echo 'You just opened: {filename}` before opening the file.
function! GuiDropCustomHandler(...)
  let l:fnames = deepcopy(a:000)
  let l:args = map(l:fnames, 'fnameescape(v:val)')

  if &ft ==# 'markdown' 
    let f = l:args[0]
    let urltext = '[' . fnamemodify(f, ':t') . '](' . f . ')'
    let savereg = @"
    let @" = urltext
    noautocmd normal! p
    let @" = savereg
  else
    for l:file in l:args
      echo "You just opened: " . l:file
      exec 'drop '.join(l:args, ' ')
    endfor
  endif
endfunction
