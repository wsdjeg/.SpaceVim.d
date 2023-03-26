function! bootstrap_before#init()
 autocmd Syntax * call SyntaxRange#Include('"""//c', '"""', 'c')   

endfunction
