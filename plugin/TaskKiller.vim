let s:fuck_process = ['Thunder.exe', 'gitter.exe']

function! s:killer_task(task) abort
    call system('taskkill /f /t /im ' . a:task)
endfunction


function! s:killer_all() abort
    for task in s:fuck_process
        call s:killer_task(task)
    endfor
endfunction

command! -nargs=+ -complete=custom,s:complete TaskKiller call s:killer_task(<f-args>)
command! TaskKillerAll call s:killer_all()

if has('nvim') && has('win32')
    " lua require('taskmanager').clear('nvim.exe', getpid())
end





function! s:complete(ArgLead, CmdLine, CursorPos) abort
    return join(map(systemlist('tasklist | grep exe'), 'tolower(matchstr(v:val, ".*.exe"))'), "\n")
endfunction
