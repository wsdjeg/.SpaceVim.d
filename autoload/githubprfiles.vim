" I want to list all the files changed in github pr

function! githubprfiles#list(user, repos, id) abort

    let files = map(github#api#pulls#ListFiles(a:user, a:repos, a:id), "{'filename' : v:val.filename}")
    if !empty(files)
        call setqflist(files)
        " call setqflist(files, ' ', {'title' : 'PR files:' . a:user . '/' . a:repos . '#' . a:id})
        copen
    endif
endfunction
