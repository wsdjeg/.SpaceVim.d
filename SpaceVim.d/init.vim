let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
augroup custom_config
    au!
    au VimEnter * call s:customMappings()
augroup END
func s:customMappings()
endf
let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
