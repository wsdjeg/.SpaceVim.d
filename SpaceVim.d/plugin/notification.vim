let s:FLOATING = SpaceVim#api#import('neovim#floating')
let s:BUFFER = SpaceVim#api#import('vim#buffer')


let s:buffer_id = nvim_create_buf(v:false, v:false)

function! s:close() abort

endfunction

function! s:notification(msg, color) abort
    let s:notification_winid =  s:FLOATING.open_win(s:buffer_id, v:true,
                \ {
                \ 'relative': 'editor',
                \ 'width'   : strlen(a:msg), 
                \ 'height'  : 1,
                \ 'row': 2,
                \ 'col': &columns - strlen(a:msg)
                \ })
  call s:BUFFER.buf_set_lines(s:buffer_id, 0 , -1, 0, [a:msg])
endfunction


command! -nargs=* Echo call s:notification(<q-args>, 'Normal')
command! -nargs=* Echoerr call s:notification(<q-args>, 'WarningMsg')
