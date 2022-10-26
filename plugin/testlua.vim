function! Testlua() abort
    let fuck1 = SpaceVim#api#import('vim#buffer').create_buf(0, 0)
    let fuck2 = SpaceVim#api#import('vim#buffer').create_buf(0, 0)
    let g:wsd = popup_create(fuck1, {
          \ 'line' : 4,
          \ 'col' : &columns - 15,
          \ 'maxheight' : 3,
          \ 'minheight' : 3,
          \ 'maxwidth' : 15,
          \ 'minwidth' : 15,
          \ 'scrollbar' : 0,
          \ })
    " call popup_create(fuck2, {
          " \ 'line' : 3,
          " \ 'col' : &columns - 17,
          " \ 'maxheight' : 3,
          " \ 'minheight' : 3,
          " \ 'maxwidth' : 15,
          " \ 'minwidth' : 15,
          " \ 'scrollbar' : 0,
          " \ })
    " call FuckSetlines(fuck2, 0, -1, ['fuck', 'fuck', 'fuck'])
    " call FuckSetlines(fuck1, 0, -1, ['fuck'])
endfunction

function! FuckSetlines(buffer, start, end, replacement) abort
    lua require("spacevim.api.vim.buffer").set_lines(
          \ vim.eval("a:buffer"),
          \ vim.eval("a:start"),
          \ vim.eval("a:end"),
          \ vim.eval("a:replacement")
          \ )
endfunction
