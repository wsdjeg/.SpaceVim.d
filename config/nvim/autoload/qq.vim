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
let s:irssi_commands = ['/join','/query','/list']
let s:history = []

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
            let h = split(matchstr(a:data, '[^\ .]*->[^\ .]*'), '->')
            call add(h, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[群消息\].*->[^\ .]*\ \:\ ','','g'))
            call add(s:history, h)
        elseif matchstr(a:data, '[^\ .]*|[^\ .]*') !=# ''
            let h = split(matchstr(a:data, '[^\ .]*|[^\ .]*'), '|')
            call add(h, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[群消息\].*|[^\ .]*\ \:\ ','','g'))
            call add(s:history, h)
        endif
    endif
endfunction
function! Test() abort
    echo s:irssi_job_id
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
        echom a:1
        echom s:irssi_job_id
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
            exe 'silent! botright split ' . '+b' . bufnr('s:name')
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
    while get(s:, 'quit_qq_win', 0) == get(g:, 'wsd', 1)
        let nr = getchar()
        if nr == 13
            call s:ParserInput(str)
            let str = ''
            echon "\r"
            echon base
        else
            let str .= nr2char(nr)
            echon "\r"
            echon base . str
        endif
    endwhile
    setl nomodifiable
endf

function! s:ParserInput(str) abort
    if a:str ==# '/quit'
        let s:quit_qq_win = 1
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
let &cpoptions = s:save_cpo
unlet s:save_cpo
