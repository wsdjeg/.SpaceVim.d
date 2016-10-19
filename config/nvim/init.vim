execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'
command! -nargs=* -complete=custom,qq#complete Webqq call qq#send(<q-args>)
