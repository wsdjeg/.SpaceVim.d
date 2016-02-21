let s:save_cpo = &cpo
set cpo&vim

" Fsep && Psep

fu! zvim#util#source_rc(file)
    execute 'source ' . g:Config_Main_Home  . '/' . a:file
endf


let &cpo = s:save_cpo
unlet s:save_cpo
