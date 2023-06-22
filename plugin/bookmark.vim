if !has('nvim')
  finish
endif
" 存储所有书签。
"
" key 值 为项目根目录
"
" 内部每一个key值为文件名，
"
" {
"     "C:\foo\" : {
"         "README.md" : {
"           "2" : {
"             "type" : normal, todo
"             "describtion" : "xxxxxxxxxxxxxxx"
"           }
"         }
"     }
" }
let s:bookmarks = {}

let s:bm_id = nvim_create_namespace('bookmark')

call sign_define("BookMark", {
      \ "text" : "=>",
      \ "texthl" : "Error",
      \ "linehl" : "Search"})


function! bookmark#add() abort
    call nvim_buf_set_extmark(0, s:bm_id, line('.'), 2, {})
endfunction


function! bookmark#remove() abort
			call sign_unplace('', {'buffer' : bufname(), 'id' : s:bm_id})
endfunction


function! s:list_bookmarks() abort

endfunction
