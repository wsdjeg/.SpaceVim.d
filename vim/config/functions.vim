function! OnmiConfigForJsp()
    let pos1 = search("</script>","nb",line("w0"))
    let pos2 = search("<script","nb",line("w0"))
    let pos3 = search("</script>","n",line("w$"))
    let pos4 = search("<script","n",line("w$"))
    let pos0 = line('.')
    if pos1 < pos2 && pos2 < pos0 && pos0 < pos3
        set omnifunc=javascriptcomplete#CompleteJS
        return "\<esc>a."
    else
        set omnifunc=javacomplete#Complete
        return "\<esc>a."
    endif
endf
function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endf
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction
function! BracketsFunc()
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "]"
        return "{}\<esc>i"
    else
        return "{\<cr>}\<esc>O"
    endif
endf
function! XmlFileTypeInit()
    set omnifunc=xmlcomplete#CompleteTags
    if filereadable("AndroidManifest.xml")
        set dict+=~/.vim/bundle/vim-dict/dict/android_xml.dic
    endif
endf
function! JavaFileTypeInit()
    let b:javagetset_setterTemplate =
                \ "/**\n" .
                \ " * Set %varname%.\n" .
                \ " *\n" .
                \ " * @param %varname% the value to set.\n" .
                \ " */\n" .
                \ "%modifiers% void %funcname%(%type% %varname%){\n" .
                \ "    this.%varname% = %varname%;\n" .
                \ "}"
    let b:javagetset_getterTemplate =
                \ "/**\n" .
                \ " * Get %varname%.\n" .
                \ " *\n" .
                \ " * @return %varname% as %type%.\n" .
                \ " */\n" .
                \ "%modifiers% %type% %funcname%(){\n" .
                \ "    return %varname%;\n" .
                \ "}"
    set omnifunc=javacomplete#Complete
    set tags +=~/others/openjdksrc/java/tags
    set tags +=~/others/openjdksrc/javax/tags
    inoremap <silent> <buffer> <leader>UU <esc>bgUwea
    inoremap <silent> <buffer> <leader>uu <esc>bguwea
    inoremap <silent> <buffer> <leader>ua <esc>bgulea
    inoremap <silent> <buffer> <leader>Ua <esc>bgUlea
    nmap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
    imap <silent><buffer> <F4> <Plug>(JavaComplete-Imports-Add)
endf
function! WSDAutoComplete(char)
    if(getline(".")=~?'^\s*.*\/\/')==0
        let line = getline('.')
        let col = col('.')
        if a:char == "."
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 2] == " "||line[col -2] == "("||line[col - 2] == ","
            return a:char."\<c-x>\<c-o>\<c-p>"
        elseif line[col - 3] == " "&&line[col - 2] =="@"
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return a:char
        endif
    else
        "bug exists
        let col = col('.')
        normal ma
        let [commentline,commentcol] = searchpos('//','b',line('.'))
        normal `a
        if commentcol == 0
            return a:char."\<c-x>\<c-o>\<c-p>"
        else
            return "\<Right>".a:char
        endif
    endif
endf
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

function! CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endf

function! QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
    else
        "Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf
function! JspFileTypeInit()
    set tags+=/home/wsdjeg/others/openjdk-8-src/tags
    set omnifunc=javacomplete#Complete
    inoremap . <c-r>=OnmiConfigForJsp()<cr>
    nnoremap <F4> :JCimportAdd<cr>
    inoremap <F4> <esc>:JCimportAddI<cr>
endfunction
