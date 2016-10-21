scriptencoding utf-8
let s:save_cpo = &cpoptions
set cpoptions&vim

let s:run_script = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'
            \ .((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')
            \ . '/qq/run.pl'

let s:run_job_id = 0
let s:irssi_job_id = 0
let s:feh_code_id = 0
let s:qq_channels = []
let s:irssi_commands = ['/join', '/query', '/list', '/quit']
let s:history = []
let s:current_channel = ''

function! s:feh_code(png) abort
    let s:feh_code_id = jobstart(['feh', a:png])
endfunction

function! s:stop_feh() abort
    if s:feh_code_id != 0
        call jobstop(s:feh_code_id)
        let s:feh_code_id =0
    endif
endfunction

function! s:start_irssi() abort
    if s:irssi_job_id == 0
        let s:irssi_job_id = jobstart(['irssi','-c', '127.0.0.1', '-p', '6667'])
    endif
endfunction

function! s:handler_stdout_data(data) abort
    if match(a:data, '二维码已下载到本地\[ /tmp/mojo_webqq_qrcode_') != -1
        echom a:data
        let png = matchstr(a:data, '/tmp/mojo_webqq_qrcode_\d*.png')
        call s:feh_code(png)
    elseif matchstr(a:data, '帐号(\d*)登录成功') !=# ''
        call s:stop_feh()
    elseif matchstr(a:data,'频道\ #.*\ 已创建') !=# ''
        let ch = matchstr(a:data,'#[^\ .]*')
        if index(s:qq_channels, ch) == -1
            call add(s:qq_channels, ch)
        endif
    elseif matchstr(a:data, '\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[群消息\]') !=# ''
        if matchstr(a:data, '[^\ .]*->[^\ .]*') !=# ''
            let msg = split(matchstr(a:data, '[^\ .]*->[^\ .]*'), '->')
            let msg[1] = '#' . msg[1]
            call add(msg, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[群消息\].*->[^\ .]*\ \:\ ','','g'))
            call add(s:history, msg)
            if msg[1] == s:current_channel
                doautocmd User QQmsgEvent
            endif
        elseif matchstr(a:data, '[^\ .]*|[^\ .]*') !=# ''
            let msg = split(matchstr(a:data, '[^\ .]*|[^\ .]*'), '|')
            let msg[1] = '#' . msg[1]
            call add(msg, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[群消息\].*|[^\ .]*\ \:\ ','','g'))
            call add(s:history, msg)
            if msg[1] == s:current_channel
                doautocmd User QQmsgEvent
            endif
        endif
    endif
endfunction
function! Test(str) abort
    exe a:str
endfunction
function! s:start_handler(id, data, event) abort
    if a:event ==# 'stdout'
        if type(a:data) == type([])
            for a in a:data
                call s:handler_stdout_data(a)
            endfor
        elseif type(a:data) == type('')
            call s:handler_stdout_data(a:data)
        else
        endif

    elseif a:event ==# 'stderr'
    elseif a:event ==# 'exit'
    endif
endfunction

function! qq#start() abort
    let argv = ['perl', s:run_script]
    if s:run_job_id == 0
        let s:run_job_id = jobstart(argv, {
                    \ 'on_stdout': function('s:start_handler'),
                    \ 'on_stderr': function('s:start_handler'),
                    \ 'on_exit': function('s:start_handler'),
                    \ })
        command! -nargs=* -complete=custom,qq#complete Webqq call qq#send(<q-args>)
    endif
endfunction

function! qq#send(...) abort
    if a:0 > 0
        if s:irssi_job_id == 0
            call s:start_irssi()
        endif
        call jobsend(s:irssi_job_id, [a:1,''])
    endif
endfunction

function! qq#complete(ArgLead, CmdLine, CursorPos) abort
    call zvim#debug#completion_debug(a:ArgLead, a:CmdLine, a:CursorPos)
    if a:ArgLead =~# '/.*'
        return join(s:irssi_commands, "\n")
    elseif a:CmdLine =~# 'Webqq\s\+/join\s\+'
        return join(s:qq_channels, "\n")
    else
        return ''
    endif
endfunction

let s:name = '__VimQQ__'
function! qq#OpenMsgWin() abort
    if bufwinnr('s:name') < 0
        if bufnr('s:name') != -1
            exe 'silent! botright split ' . '+b' . bufnr(s:name)
        else
            exe 'silent! botright split ' . s:name
        endif
    else
        exec bufwinnr('s:name') . 'wincmd w'
    endif
    setl modifiable
    "TODO
    let base = '>>>'
    let str = ''
    call s:windowsinit()
    redraw
    echon base
    while get(s:, 'quit_qq_win', 0) == 0
        let nr = getchar()
        if nr == 13
            call s:ParserInput(str)
            let str = ''
            echon "\r"
            echon base
        elseif nr == 8 || nr ==# "\<bs>"   " ctrl+h or <bs> delete last char
            let str = substitute(str,'.$','','g')
            echon "\r"
            echon base . str
        elseif nr == 23                   " ctrl+w delete last word
            let str = substitute(str,'[^\ .*]\+\s*$','','g')
            echon "\r"
            echon base . str
        elseif nr == 21                   " ctrl+u clean the message
            let str = ''
            call s:echon(base)
        elseif nr == 9
            let str = s:complete(str)
            call s:echon(base . str)
        else
            let str .= nr2char(nr)
            call s:echon(base . str)
        endif
    endwhile
    setl nomodifiable
    exe 'bd ' . bufnr(s:name)
    let s:quit_qq_win = 0
    normal! :
endf

function! s:complete(str) abort
    if a:str =~# '^/[a-z]*$'
        let rsl = filter(copy(s:irssi_commands), "v:val =~# a:str .'[^\ .]*'")
        if len(rsl) > 0
            return rsl[0]
        else
            return a:str
        endif
    elseif a:str =~# '/join\s\+#\?$'
        if len(s:qq_channels) > 0
            return a:str[-1:] ==# '#' ? a:str[:-2] . s:qq_channels[0] : a:str . s:qq_channels[0]
        else
            return a:str
        endif
    else
        return a:str
    endif
endfunction

function! s:echon(str) abort
    echon "\r"
    echon a:str
endfunction

function! s:UpdateMsgScreen() abort
    let msgs = filter(deepcopy(s:history), 'v:val[1] == s:current_channel')
    normal! ggdG
    for msg in msgs
        call append(line('$'), msg[0] . repeat('-', 13 - strwidth(msg[0])) . ' | ' . msg[2])
    endfor
    normal! G
    redraw
endfunction

function! s:ParserInput(str) abort
    if a:str ==# '/quit'
        let s:quit_qq_win = 1
        let s:current_channel = ''
    elseif a:str =~# '^/join'
        call qq#send(a:str)
        let s:current_channel = '#' . split(a:str, '#')[1]
        exe 'set statusline =[' . s:current_channel . ']'
        redraw
    elseif a:str !~# '^/.*'
        call qq#send(a:str)
    endif
endfunction

fu! s:windowsinit() abort
    " option
    setl fileformat=unix
    setl fileencoding=utf-8
    setl iskeyword=@,48-57,_
    setl noreadonly
    setl buftype=nofile
    setl bufhidden=wipe
    setl noswapfile
    setl nobuflisted
    setl nolist
    setl nonumber
    setl nowrap
    setl winfixwidth
    setl winfixheight
    setl textwidth=0
    setl nospell
    setl nofoldenable
endf

augroup VimQQ
    autocmd!
    autocmd User QQmsgEvent call s:UpdateMsgScreen()
augroup END

let &cpoptions = s:save_cpo
unlet s:save_cpo
