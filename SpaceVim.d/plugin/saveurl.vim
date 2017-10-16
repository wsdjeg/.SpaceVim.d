command! -nargs=+ SaveUrl call saveurl#save(<f-args>)
command! -nargs=1 -complete=custom,findbin#complete Findbin call findbin#find(<q-args>)
