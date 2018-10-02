function! myspacevim#before() abort
    call SpaceVim#logger#info('myspacevim#before called')
    let g:spacevim_disabled_plugins = ['vim-nim']
    set rtp+=~/SpaceVim/SpaceVim/build/vader
    set rtp+=~/SpaceVim/vim-nim
    " lang#plantuml
    call add(g:spacevim_disabled_plugins, 'vim-slumlord')
    set rtp+=~/SpaceVim/vim-slumlord
    " lang#markdown
    call add(g:spacevim_disabled_plugins, 'vim-markdown')
    set rtp+=~/SpaceVim/vim-markdown
    " lang#elm
    call add(g:spacevim_disabled_plugins, 'vim-elm')
    set rtp+=~/SpaceVim/vim-elm
    set rtp+=~/SpaceVim/ChineseLinter.vim
    call add(g:spacevim_disabled_plugins, 'SourceCounter.vim')
    set rtp+=~/SpaceVim/SourceCounter.vim
    call add(g:spacevim_disabled_plugins, 'GitHub-api.vim')
    set rtp+=~/SpaceVim/GitHub.vim
    call add(g:spacevim_disabled_plugins, 'vim-asciidoc')
    set rtp+=~/SpaceVim/vim-asciidoc
    let g:delimitMate_expand_cr = 1
    call add(g:spacevim_project_rooter_patterns, 'package.json')
    augroup myspacevim
        autocmd!
        autocmd FileType defx call s:defx_my_settings()
    augroup END
    let g:spacevim_layer_lang_java_formatter = '/home/wsdjeg/Downloads/google-java-format-1.5-all-deps.jar'
endfunction
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
endfunction
