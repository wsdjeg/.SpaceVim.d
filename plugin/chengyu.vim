let s:JSON = SpaceVim#api#import('data#json')
let s:VIM = SpaceVim#api#import('vim')
let s:idioms_file = 'idiom.json'

function! s:readdata() abort
    let cache_context = join(readfile(s:idioms_file, ''), '')
    if !empty(cache_context)
        let cache_object = s:JSON.json_decode(cache_context)
        if s:VIM.is_list(cache_object)
            let s:idioms_data = cache_object
        endif
    endif
endfunction

function! Idioms() abort
    call s:readdata()
endfunction

