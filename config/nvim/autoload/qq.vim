scriptencoding utf-8
let s:save_cpo = &cpoptions
set cpoptions&vim
" Debug
let s:server_log = []

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
let s:last_channel = ''
let s:msg_before = ''
let s:friends = []     " each item is ['channel','nickname']
let s:input_history = []
let s:complete_num = 0
let s:complete_input_history_num = [0,0]

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
" TODO
" handler msg from user， the data must be a string
function! s:handler_stdout_data(data) abort
    call add(s:server_log, a:data)
    if match(a:data, '二维码已下载到本地\[ /tmp/mojo_webqq_qrcode_') != -1
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
        " send:[16/10/22 18:26:58] [群消息] 我->Vim/exVim 开发讨论群 : 测试补全
        " start index 32
        if matchstr(a:data, '[^\ .]*->[^\ .]*') !=# ''
            let idx1 = match(a:data, '->')
            let idx2 = match(a:data, ' : ')
            let msg = [ a:data[32:idx1-1], '#' . a:data[idx1+2:idx2-1], a:data[idx2+3:]]
            let msg[1] = substitute(msg[1], '[\ !！@&]', '', 'g')
            call add(s:history, msg)
            let friend = [msg[1], msg[0]]
            if index(s:friends, friend) == -1
                call add(s:friends, friend)
            endif
            if msg[1] == s:current_channel
                call s:update_msg_screen()
            endif
        " get:[16/10/22 18:26:58] [群消息] 灰灰|Vim/exVim 开发讨论群 : 测试补全
        elseif matchstr(a:data, '[^\ .]*|[^\ .]*') !=# ''
            let idx1 = match(a:data, '|')
            let idx2 = match(a:data, ' : ')
            let msg = [ a:data[32:idx1-1], '#' .a:data[idx1+1:idx2-1], a:data[idx2+3:]]
            let msg[1] = substitute(msg[1], '[\ !！@&]', '', 'g')
            call add(s:history, msg)
            let friend = [msg[1], msg[0]]
            if index(s:friends, friend) == -1
                call add(s:friends, friend)
            endif
            if msg[1] == s:current_channel
                call s:update_msg_screen()
            endif
        endif
    elseif matchstr(a:data, '\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[好友消息\]') !=# ''
        " send: [16/10/22 14:25:56] [好友消息] 我->老婆 : 1
        if matchstr(a:data, '[^\ .]*->[^\ .]*') !=# ''
            let msg = split(matchstr(a:data, '[^\ .]*->[^\ .]*'), '->')
            let f = msg[1]
            let msg[1] = ''
            call add(msg, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[好友消息\].*->[^\ .]*\ \:\ ','','g'))
            call add(msg, f)
            call add(s:history, msg)
            let friend = ['我的好友',f]
            if index(s:friends, friend) == -1
                call add(s:friends, friend)
            endif
            if f == s:current_channel
                call s:update_msg_screen()
            endif
        " get: [16/10/22 14:25:59] [好友消息] 老婆|我的好友 : 测试
        elseif matchstr(a:data, '[^\ .]*|[^\ .]*') !=# ''
            let msg = split(matchstr(a:data, '[^\ .]*|[^\ .]*'), '|')
            let f = msg[0]
            let msg[1] = ''
            call add(msg, substitute(a:data,'\[\d\d/\d\d/\d\d \d\d\:\d\d\:\d\d\] \[好友消息\].*|[^\ .]*\ \:\ ','','g'))
            call add(msg, f)
            call add(s:history, msg)
            let friend = ['我的好友',f]
            if index(s:friends, friend) == -1
                call add(s:friends, friend)
            endif
            if f == s:current_channel
                call s:update_msg_screen()
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
    if s:last_channel !=# ''
        call qq#send('/join ' . s:last_channel)
        let s:current_channel = s:last_channel
        exe 'set statusline =[' . substitute(s:current_channel, ' ', '\\ ', 'g') . ']'
        redraw
        let str = s:msg_before
        let s:prostr= str
        call s:update_msg_screen()
    else
        call s:echon(base)
    endif
    while get(s:, 'quit_qq_win', 0) == 0
        let s:prostr= str
        let s:probase = base
        let nr = getchar()
        if nr != 9
            let s:complete_num = 0
        endif
        if nr !=# "\<Up>" && nr !=# "\<Down>"
            let s:complete_input_history_num = [0,0]
        endif
        if nr == 13
            call s:parser_input(str)
            let str = ''
            call s:echon(base)
        elseif nr ==# "\<M-x>"
            let s:quit_qq_win = 1
            let s:last_channel = s:current_channel
            let s:current_channel = ''
            let s:msg_before = str
        elseif nr == 8 || nr ==# "\<bs>"   " ctrl+h or <bs> delete last char
            let str = substitute(str,'.$','','g')
            call s:echon(base . str)
        elseif nr == 23                   " ctrl+w delete last word
            let str = substitute(str,'[^\ .*]\+\s*$','','g')
            call s:echon(base . str)
        elseif nr == 21                   " ctrl+u clean the message
            let str = ''
            call s:echon(base)
        elseif nr == 9                    " use <tab> complete str
            if s:complete_num == 0
                let complete_base = str
            else
                let str = complete_base
            endif
            let str = s:complete(complete_base, s:complete_num)
            let s:complete_num += 1
            call s:echon(base . str)
        elseif nr == 47                 " if type / and str is none, switch to en method
            if str ==# '' && executable('fcitx-remote')
                call system('fcitx-remote -c')
                let str .= nr2char(nr)
                call s:echon(base . str)

            else
                let str .= nr2char(nr)
                call s:echon(base . str)
            endif
        elseif nr ==# "\<PageUp>"
            let l = line('.') - winheight('$')
            if l < 0
                exe 0
            else
                exe l
            endif
            call s:echon(base . str)
        elseif nr ==# "\<PageDown>"
            exe line('.') + winheight('$')
            call s:echon(base . str)
        elseif nr ==# "\<Up>"
            if s:complete_input_history_num == [0,0]
                let complete_input_history_base = str
            else
                let str = complete_input_history_base
            endif
            let s:complete_input_history_num[0] += 1
            let str = s:complete_input_history(complete_input_history_base, s:complete_input_history_num)
            call s:echon(base . str)
        elseif nr ==# "\<Down>"
            if s:complete_input_history_num == [0,0]
                let complete_input_history_base = str
            else
                let str = complete_input_history_base
            endif
            let s:complete_input_history_num[1] += 1
            let str = s:complete_input_history(complete_input_history_base, s:complete_input_history_num)
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
    if executable('fcitx-remote')
        call system('fcitx-remote -c')          " switch 2 en
    else
        doautocmd InsertEnter
        doautocmd InsertLeave
    endif
endf

function! s:complete(str, num) abort
    if a:str =~# '^/[a-z]*$'
        let rsl = filter(copy(s:irssi_commands), "v:val =~# a:str .'[^\ .]*'")
        if len(rsl) > 0
            return rsl[a:num % len(rsl)] . ' '
        else
            return a:str
        endif
    elseif a:str =~# '/join\s\+#\?$'
        if len(s:qq_channels) > 0
            return a:str[-1:] ==# '#' ? a:str[:-2] . s:qq_channels[0] : a:str . s:qq_channels[0]
        else
            return a:str
        endif
    elseif a:str =~# '/join\s\+#.\+$'
        let results = filter(deepcopy(s:qq_channels), "v:val =~# '" . substitute(a:str , '^/join\s\+', '', 'g') . "'")
        if len(results) > 0
            return '/join ' . results[a:num % len(results)]
        endif
        return a:str
    elseif index(s:qq_channels, s:current_channel) != -1
        let names = filter(deepcopy(s:friends), "v:val[0] == s:current_channel && v:val[1] =~# '^' . a:str")
        if len(names) > 0
            return names[a:num % len(names)][1] . ': '
        endif
        return a:str
    else
        return a:str
    endif
endfunction

function! s:complete_input_history(str,num) abort
    let results = filter(copy(s:input_history), "v:val =~# '^' . a:str")
    if len(results) > 0
        call add(results, a:str)
        let index = ((len(results) - 1) - a:num[0] + a:num[1]) % len(results)
        return results[index]
    else
        return a:str
    endif
endfunction

function! s:echon(str) abort
    redraw!
    echo a:str
endfunction

function! s:update_msg_screen() abort
    if index(s:qq_channels, s:current_channel) == -1
        let msgs = filter(deepcopy(s:history), 'len(v:val) == 4 && v:val[3] == s:current_channel')
        let line = [line('.'),line('$')]
        normal! ggdG
        for msg in msgs
            call append(line('$'), msg[0] . repeat(' ', 13 - strwidth(msg[0])) . ' | ' . msg[2])
        endfor
        if line[0] == line[1]
            normal! G
        else
            exe line[0]
        endif
    else
        let msgs = filter(deepcopy(s:history), 'v:val[1] == s:current_channel')
        let line = [line('.'),line('$')]
        normal! ggdG
        for msg in msgs
            call append(line('$'), msg[0] . repeat(' ', 13 - strwidth(msg[0])) . ' | ' . msg[2])
        endfor
        if line[0] == line[1]
            normal! G
        else
            exe line[0]
        endif
    endif
    redraw
    call s:echon(s:probase . s:prostr)
endfunction

function! s:parser_input(str) abort
    if a:str !=# ''
        call add(s:input_history, a:str)
    endif
    if a:str =~# '^/quit\s*$'
        let s:quit_qq_win = 1
        let s:last_channel = s:current_channel
        let s:current_channel = ''
    elseif a:str =~# '^/join'
        call qq#send(a:str)
        let s:current_channel = '#' . split(a:str, '#')[1]
        exe 'set statusline =[' . substitute(s:current_channel, ' ', '\\ ', 'g') . ']'
        call s:update_msg_screen()
        redraw
    elseif a:str =~# '^/query\ \+.\+'
        call qq#send(a:str)
        let s:current_channel = substitute(a:str, '^/query\ \+', '', 'g')
        exe 'set statusline =[' . substitute(s:current_channel, ' ', '\\ ', 'g') . ']'
        call s:update_msg_screen()
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
    setl wrap
    setl winfixwidth
    setl winfixheight
    setl textwidth=0
    setl nospell
    setl nofoldenable
endf


let &cpoptions = s:save_cpo
unlet s:save_cpo
