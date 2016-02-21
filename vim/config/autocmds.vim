"autocmds
augroup quick_loc_list
    au!
    au! BufWinEnter quickfix nnoremap <silent> <buffer>
                \   q :cclose<cr>:lclose<cr>
    au! BufWinEnter quickfix if (winnr('$') == 1 ) |
                \   q | endif
augroup END
autocmd FileType jsp call JspFileTypeInit()
autocmd FileType html,css,jsp EmmetInstall
autocmd FileType java call JavaFileTypeInit()
autocmd BufEnter,WinEnter,InsertLeave * set cursorline
autocmd BufLeave,WinLeave,InsertEnter * set nocursorline
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
autocmd BufNewFile,BufEnter * set cpoptions+=d " NOTE: ctags find the tags file from the current path instead of the path of currect file
autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
autocmd BufNewFile,BufRead *.avs set syntax=avs " for avs syntax file.
autocmd FileType text setlocal textwidth=78 " for all text files set 'textwidth' to 78 characters.
autocmd FileType c,cpp,cs,swig set nomodeline " this will avoid bug in my project with namespace ex, the vim will tree ex:: as modeline.
autocmd FileType c,cpp,java,javascript set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://
autocmd FileType cs set comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f:///,f://
autocmd FileType vim set comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",f:\"
autocmd FileType lua set comments=f:--
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd Filetype html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml call XmlFileTypeInit()
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufEnter *
            \   if empty(&buftype)&&has('nvim')
            \|      nnoremap <silent><buffer> <C-]> :call MyTagfunc()<CR>
            \|      nnoremap <silent><buffer> <C-[> :call MyTagfuncBack()<CR>
            \|  else
                \|      nnoremap <silent><buffer> <leader>] :call MyTagfunc()<CR>
                \|      nnoremap <silent><buffer> <leader>[ :call MyTagfuncBack()<CR>
                \|  endif
"}}}
autocmd FileType python,coffee call s:check_if_expand_tab()
function! s:check_if_expand_tab()
    let has_noexpandtab = search('^\t','wn')
    let has_expandtab = search('^    ','wn')

    "
    if has_noexpandtab && has_expandtab
        let idx = inputlist ( ['ERROR: current file exists both expand and noexpand TAB, python can only use one of these two mode in one file.\nSelect Tab Expand Type:',
                    \ '1. expand (tab=space, recommended)',
                    \ '2. noexpand (tab=\t, currently have risk)',
                    \ '3. do nothing (I will handle it by myself)'])
        let tab_space = printf('%*s',&tabstop,'')
        if idx == 1
            let has_noexpandtab = 0
            let has_expandtab = 1
            silent exec '%s/\t/' . tab_space . '/g'
        elseif idx == 2
            let has_noexpandtab = 1
            let has_expandtab = 0
            silent exec '%s/' . tab_space . '/\t/g'
        else
            return
        endif
    endif

    "
    if has_noexpandtab == 1 && has_expandtab == 0
        echomsg 'substitute space to TAB...'
        set noexpandtab
        echomsg 'done!'
    elseif has_noexpandtab == 0 && has_expandtab == 1
        echomsg 'substitute TAB to space...'
        set expandtab
        echomsg 'done!'
    else
        " it may be a new file
        " we use original vim setting
    endif
endfunction
