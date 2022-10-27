let g:paste_command = 'powershell -c "Get-Clipboard -TextFormatType Html"'
"
"
" install html2md
"
" npm install -g to-markdown-cli
function! TestPaste() abort
  let html = systemlist(g:paste_command)
  if len(html) > 3
    let html = join(html[6:], "\n")
  endif
  let @" = system('html2md', html)
  normal! p
endfunction


" nnoremap \p <cmd>call TestPaste()<Cr>
