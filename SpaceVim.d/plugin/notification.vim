let s:FLOATING = SpaceVim#api#import('neovim#floating')
let s:BUFFER = SpaceVim#api#import('vim#buffer')


let s:buffer_id = nvim_create_buf(v:false, v:false)
let g:wsd = s:buffer_id

function! s:close(...) abort
    noautocmd call nvim_win_close(s:notification_winid, v:true)
endfunction

function! s:notification(msg, color) abort
    let s:notification_winid =  s:FLOATING.open_win(s:buffer_id, v:false,
                \ {
                \ 'relative': 'editor',
                \ 'width'   : strlen(a:msg), 
                \ 'height'  : 1,
                \ 'row': 2,
                \ 'col': &columns - strlen(a:msg) - 3
                \ })
    call s:BUFFER.buf_set_lines(s:buffer_id, 0 , -1, 0, [a:msg])
    call setbufvar(s:buffer_id, '&winhighlight', 'Normal:' . a:color)
    call setbufvar(s:buffer_id, '&number', 0)
    call setbufvar(s:buffer_id, '&relativenumber', 0)
    call setbufvar(s:buffer_id, '&buftype', 'nofile')
    call timer_start(2000, function('s:close'), {'repeat' : 1})
endfunction


command! -nargs=* Echo call s:notification(<q-args>, 'Normal')
command! -nargs=* Echoerr call s:notification(<q-args>, 'WarningMsg')
