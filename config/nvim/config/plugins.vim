" Fsep && Psep
if has('win16') || has('win32') || has('win64')
    let s:Psep = ';'
    let s:Fsep = '\'
else
    let s:Psep = ':'
    let s:Fsep = '/'
endif
" auto install plugin manager
if g:settings.plugin_manager == 'neobundle'
    "auto install neobundle
    if filereadable(expand(g:settings.plugin_bundle_dir) . 'neobundle.vim'. s:Fsep. 'README.md')
        let g:settings.neobundle_installed = 1
    else
        if executable('git')
            exec '!git clone https://github.com/Shougo/neobundle.vim ' . g:settings.plugin_bundle_dir . 'neobundle.vim'
            let g:settings.neobundle_installed = 1
        else
            echohl WarningMsg | echom "You need install git!" | echohl None
        endif
    endif
    exec 'set runtimepath+='.g:settings.plugin_bundle_dir . 'neobundle.vim'
elseif g:settings.plugin_manager == 'dein'
    "auto install dein
    if filereadable(expand(g:settings.plugin_bundle_dir) . 'repos/github.com/Shougo/dein.vim'. s:Fsep. 'README.md')
        let g:settings.dein_installed = 1
    else
        if executable('git')
            exec '!git clone https://github.com/Shougo/dein.vim ' . g:settings.plugin_bundle_dir . 'repos/github.com/Shougo/dein.vim'
            let g:settings.dein_installed = 1
        else
            echohl WarningMsg | echom "You need install git!" | echohl None
        endif
    endif
    exec 'set runtimepath+='.g:settings.plugin_bundle_dir . 'repos/github.com/Shougo/dein.vim'
elseif g:settings.plugin_manager == 'vim-plug'
    "auto install vim-plug
    if filereadable(expand('~/.cache/vim-plug/autoload/plug.vim'))
        let g:settings.dein_installed = 1
    else
        if executable('curl')
            exec '!curl -fLo ~/.cache/vim-plug/autoload/plug.vim --create-dirs '
                        \. 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            let g:settings.dein_installed = 1
        else
            echohl WarningMsg | echom "You need install curl!" | echohl None
        endif
    endif
    exec 'set runtimepath+=~/.cache/vim-plug/'
endif

"init manager func

fu! s:begin(path)
    let g:unite_source_menu_menus.AddedPlugins = {'description': 'All the Added plugins                    <leader>lp'}
    let g:unite_source_menu_menus.AddedPlugins.command_candidates = []
    nnoremap <silent><Leader>lp :Unite -silent -winheight=17 -start-insert menu:AddedPlugins<CR>
    if g:settings.plugin_manager == 'neobundle'
        call neobundle#begin(a:path)
    elseif g:settings.plugin_manager == 'dein'
        call dein#begin(a:path)
    elseif g:settings.plugin_manager == 'vim-plug'
        call plug#begin(a:path)
    endif
endf

fu! s:end()
    if g:settings.plugin_manager == 'neobundle'
        call neobundle#end()
        if g:settings.checkinstall == 1
            NeoBundleCheck
        endif
    elseif g:settings.plugin_manager == 'dein'
        call dein#end()
        if g:settings.checkinstall == 1
            if dein#check_install()
                call dein#install()
            endif
        endif
        call dein#call_hook('source')
    elseif g:settings.plugin_manager == 'vim-plug'
        call plug#end()
    endif
endf

fu! s:parser(args)
    return a:args
endf

fu! s:add(repo,...)
    if g:settings.plugin_manager == 'neobundle'
        exec 'NeoBundle "'.a:repo.'"'.','.join(a:000,',')
    elseif g:settings.plugin_manager == 'dein'
        if len(a:000) > 0
            call dein#add(a:repo,s:parser(a:000[0]))
        else
            call dein#add(a:repo)
        endif
    endif
    exec "call add(g:unite_source_menu_menus.AddedPlugins.command_candidates, ['["
                \ . a:repo . (len(a:000) > 0 ? (']' . repeat(' ', 80 - len(a:repo)) . '[lazy loaded') : '')
                \ . "]','OpenBrowser https://github.com/"
                \ . a:repo
                \ . "'])"
endf
fu! s:tap(plugin)
    if g:settings.plugin_manager == 'neobundle'
        return neobundle#tap(a:plugin)
    elseif g:settings.plugin_manager == 'dein'
        return dein#tap(a:plugin)
    endif
endf
fu! s:defind_hooks(bundle)
    if g:settings.plugin_manager == 'neobundle'
        let s:hooks = neobundle#get_hooks(a:bundle)
        func! s:hooks.on_source(bundle) abort
            call zvim#util#source_rc('plugins/' . split(a:bundle['name'],'\.')[0] . '.vim')
        endf
    elseif g:settings.plugin_manager == 'dein'
        call dein#config(g:dein#name, {
                    \ 'hook_source' : "call zvim#util#source_rc('plugins/" . split(g:dein#name,'\.')[0] . ".vim')"
                    \ })
    endif
endf
fu! s:fetch()
    if g:settings.plugin_manager == 'neobundle'
        NeoBundleFetch 'Shougo/neobundle.vim'
    elseif g:settings.plugin_manager == 'dein'
        call dein#add('Shougo/dein.vim')
    endif
endf

fu! s:enable_plug()
    return g:settings.neobundle_installed || g:settings.dein_installed || g:settings.vim_plug_installed
endf

"plugins and config
if s:enable_plug()
    call s:begin(g:settings.plugin_bundle_dir)
    call s:fetch()
    if count(g:settings.plugin_groups, 'core') "{{{
        call s:add('Shougo/vimproc.vim', {'build': 'make'})
    endif
    if count(g:settings.plugin_groups, 'unite') "{{{
        call s:add('Shougo/unite.vim')
        if s:tap('unite.vim')
            call s:defind_hooks('unite.vim')
        endif
        call s:add('Shougo/neoyank.vim')
        call s:add('soh335/unite-qflist')
        call s:add('ujihisa/unite-equery')
        call s:add('m2mdas/unite-file-vcs')
        call s:add('Shougo/neomru.vim')
        call s:add('kmnk/vim-unite-svn')
        call s:add('basyura/unite-rails')
        call s:add('nobeans/unite-grails')
        call s:add('choplin/unite-vim_hacks')
        call s:add('mattn/webapi-vim')
        call s:add('henices/unite-stock')
        call s:add('mattn/wwwrenderer-vim')
        call s:add('thinca/vim-openbuf')
        call s:add('ujihisa/unite-haskellimport')
        call s:add('oppara/vim-unite-cake')
        call s:add('thinca/vim-ref')
        if s:tap('vim-ref')
            call s:defind_hooks('vim-ref')
        endif
        call s:add('heavenshell/unite-zf')
        call s:add('heavenshell/unite-sf2')
        call s:add('osyo-manga/unite-vimpatches')
        call s:add('Shougo/unite-outline')
        call s:add('hewes/unite-gtags')
        if s:tap('unite-gtags')
            call s:defind_hooks('unite-gtags')
        endif
        call s:add('rafi/vim-unite-issue')
        call s:add('tsukkee/unite-tag')
        call s:add('ujihisa/unite-launch')
        call s:add('ujihisa/unite-gem')
        call s:add('osyo-manga/unite-filetype')
        call s:add('thinca/vim-unite-history')
        call s:add('Shougo/neobundle-vim-recipes')
        call s:add('Shougo/unite-help')
        call s:add('ujihisa/unite-locate')
        call s:add('kmnk/vim-unite-giti')
        call s:add('ujihisa/unite-font')
        call s:add('t9md/vim-unite-ack')
        call s:add('mileszs/ack.vim',{'lazy' : 1 , 'on_cmd' : 'Ack'})
        call s:add('albfan/ag.vim',{'lazy' : 1 , 'on_cmd' : 'Ag'})
        let g:ag_prg="ag  --vimgrep"
        let g:ag_working_path_mode="r"
        call s:add('dyng/ctrlsf.vim',{'lazy' : 1 , 'on_cmd' : 'CtrlSF'})
        if s:tap('ctrlsf.vim')
            call s:defind_hooks('ctrlsf.vim')
        endif
        call s:add('daisuzu/unite-adb')
        call s:add('osyo-manga/unite-airline_themes')
        call s:add('mattn/unite-vim_advent-calendar')
        call s:add('mattn/unite-remotefile')
        call s:add('sgur/unite-everything')
        call s:add('kannokanno/unite-dwm')
        call s:add('raw1z/unite-projects')
        call s:add('voi/unite-ctags')
        call s:add('Shougo/unite-session')
        call s:add('osyo-manga/unite-quickfix')
        call s:add('Shougo/vimfiler.vim',{'lazy' : 1 , 'on_cmd' : 'VimFiler'})
        if s:tap('vimfiler.vim')
            call s:defind_hooks('vimfiler.vim')
            noremap <silent> <F3> :VimFiler<CR>
        endif
        call s:add('mopp/googlesuggest-source.vim')
        call s:add('mattn/googlesuggest-complete-vim')
        call s:add('ujihisa/unite-colorscheme')
        call s:add('mattn/unite-gist')
        call s:add('tacroe/unite-mark')
        call s:add('tacroe/unite-alias')
        call s:add('tex/vim-unite-id')
        call s:add('sgur/unite-qf')
        call s:add('lambdalisue/unite-grep-vcs', {
                    \ 'autoload': {
                    \    'unite_sources': ['grep/git', 'grep/hg'],
                    \}})
        call s:add('klen/unite-radio.vim')
        let g:unite_source_radio_play_cmd='mpv'
        "call s:add('ujihisa/quicklearn')
    endif "}}}


    "{{{ctrlpvim settings
    if count(g:settings.plugin_groups, 'ctrlp') "{{{
        call s:add('ctrlpvim/ctrlp.vim')
        if s:tap('ctrlp.vim')
            call s:defind_hooks('ctrlp.vim')
        endif
        if !has('nvim')
            call s:add('wsdjeg/ctrlp-unity3d-docs',  { 'lazy' : 1 , 'on_cmd' : 'CtrlPUnity3DDocs'})
        endif
        call s:add('voronkovich/ctrlp-nerdtree.vim', { 'lazy' : 1 , 'on_cmd' : 'CtrlPNerdTree'})
        call s:add('elentok/ctrlp-objects.vim',      { 'lazy' : 1 , 'on_cmd' : [
                    \'CtrlPModels',
                    \'CtrlPViews',
                    \'CtrlPControllers',
                    \'CtrlPTemplates',
                    \'CtrlPPresenters']})
        call s:add('h14i/vim-ctrlp-buftab',          { 'lazy' : 1 , 'on_cmd' : 'CtrlPBufTab'})
        call s:add('vim-scripts/ctrlp-cmdpalette',   { 'lazy' : 1 , 'on_cmd' : 'CtrlPCmdPalette'})
        call s:add('mattn/ctrlp-windowselector',     { 'lazy' : 1 , 'on_cmd' : 'CtrlPWindowSelector'})
        call s:add('the9ball/ctrlp-gtags',           { 'lazy' : 1 , 'on_cmd' : ['CtrlPGtagsX','CtrlPGtagsF','CtrlPGtagsR']})
        call s:add('thiderman/ctrlp-project',        { 'lazy' : 1 , 'on_cmd' : 'CtrlPProject'})
        call s:add('mattn/ctrlp-google',             { 'lazy' : 1 , 'on_cmd' : 'CtrlPGoogle'})
        call s:add('ompugao/ctrlp-history',          { 'lazy' : 1 , 'on_cmd' : ['CtrlPCmdHistory','CtrlPSearchHistory']})
        call s:add('pielgrzym/ctrlp-sessions',       { 'lazy' : 1 , 'on_cmd' : ['CtrlPSessions','MkS']})
        call s:add('tacahiroy/ctrlp-funky',          { 'lazy' : 1 , 'on_cmd' : 'CtrlPFunky'})
        call s:add('mattn/ctrlp-launcher',           { 'lazy' : 1 , 'on_cmd' : 'CtrlPLauncher'})
        call s:add('sgur/ctrlp-extensions.vim',      { 'lazy' : 1 , 'on_cmd' : ['CtrlPCmdline','CtrlPMenu','CtrlPYankring']})
        call s:add('FelikZ/ctrlp-py-matcher')
    endif "}}}


    if count(g:settings.plugin_groups, 'autocomplete') "{{{
        call s:add('honza/vim-snippets',{'lazy' : 1 , 'on_i' : 1})
        imap <silent><expr><TAB> MyTabfunc()
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        inoremap <silent> <CR> <C-r>=MyEnterfunc()<Cr>
        inoremap <silent> <Leader><Tab> <C-r>=MyLeaderTabfunc()<CR>
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
        inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
        if g:settings.autocomplete_method == 'ycm' "{{{
            call s:add('SirVer/ultisnips')
            let g:UltiSnipsExpandTrigger="<tab>"
            let g:UltiSnipsJumpForwardTrigger="<tab>"
            let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
            let g:UltiSnipsSnippetsDir='~/DotFiles/snippets'
            call s:add('ervandew/supertab')
            let g:SuperTabContextDefaultCompletionType = "<c-n>"
            let g:SuperTabDefaultCompletionType = '<C-n>'
            autocmd InsertLeave * if pumvisible() == 0|pclose|endif
            let g:neobundle#install_process_timeout = 1500
            call s:add('Valloric/YouCompleteMe')
            "let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
            "let g:ycm_confirm_extra_conf = 0
            let g:ycm_collect_identifiers_from_tags_files = 1
            let g:ycm_collect_identifiers_from_comments_and_strings = 1
            let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
            let g:ycm_key_list_previous_completion = ['<C-S-TAB>','<Up>']
            let g:ycm_seed_identifiers_with_syntax = 1
            let g:ycm_key_invoke_completion = '<leader><tab>'
            let g:ycm_semantic_triggers =  {
                        \   'c' : ['->', '.'],
                        \   'objc' : ['->', '.'],
                        \   'ocaml' : ['.', '#'],
                        \   'cpp,objcpp' : ['->', '.', '::'],
                        \   'perl' : ['->'],
                        \   'php' : ['->', '::'],
                        \   'cs,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
                        \   'java,jsp' : ['.'],
                        \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
                        \   'ruby' : ['.', '::'],
                        \   'lua' : ['.', ':'],
                        \   'erlang' : [':'],
                        \ }
        elseif g:settings.autocomplete_method == 'neocomplete' "{{{
            call s:add('Shougo/neocomplete', {
                        \ 'lazy' : 1,
                        \ 'on_i' : 1,
                        \ })
            if s:tap('neocomplete')
                call s:defind_hooks('neocomplete.vim')
            endif
        elseif g:settings.autocomplete_method == 'neocomplcache' "{{{
            call s:add('Shougo/neocomplcache.vim', {
                        \ 'lazy' : 1,
                        \ 'on_i' : 1,
                        \ })
            if s:tap('neocomplcache.vim')
                call s:defind_hooks('neocomplcache.vim')
            endif
        elseif g:settings.autocomplete_method == 'deoplete'
            call s:add('Shougo/deoplete.nvim', {
                        \ 'lazy' : 1,
                        \ 'on_i' : 1,
                        \ })
            if s:tap('deoplete.nvim')
                call s:defind_hooks('deoplete.nvim')
            endif
            call s:add('zchee/deoplete-jedi',      { 'lazy' : 1 , 'on_ft' : 'python'})
        endif "}}}
        call s:add('Shougo/neco-syntax',           { 'lazy' : 1 , 'on_i' : 1})
        call s:add('ujihisa/neco-look',            { 'lazy' : 1 , 'on_i' : 1})
        call s:add('Shougo/neco-vim',              { 'lazy' : 1 , 'on_i' : 1})
        if !exists('g:necovim#complete_functions')
            let g:necovim#complete_functions = {}
        endif
        let g:necovim#complete_functions.Ref =
                    \ 'ref#complete'
        call s:add('Shougo/context_filetype.vim',  { 'lazy' : 1 , 'on_i' : 1})
        call s:add('Shougo/neoinclude.vim',        { 'lazy' : 1 , 'on_i' : 1})
        call s:add('Shougo/neosnippet-snippets',   { 'lazy' : 1 , 'on_i' : 1 , 'on_ft' : 'neosnippet'})
        call s:add('Shougo/neosnippet.vim',        { 'lazy' : 1 , 'on_i' : 1 , 'on_ft' : 'neosnippet'})
        call s:add('Shougo/neopairs.vim',          { 'lazy' : 1 , 'on_i' : 1})
        let g:neosnippet#snippets_directory = fnamemodify(g:Config_Main_Home, ( has('nvim') ? ':p:h:h:h:h' : ':p:h:h:h')) . s:Fsep . 'snippets'
        let g:neosnippet#enable_snipmate_compatibility=1
        let g:neosnippet#enable_complete_done = 1
        let g:neosnippet#completed_pairs= {}
        let g:neosnippet#completed_pairs.java = {'(' : ')'}
        if g:neosnippet#enable_complete_done
            let g:neopairs#enable = 0
        endif
        imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
        smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
    endif "}}}

    if count(g:settings.plugin_groups, 'colorscheme') "{{{
        "colorscheme
        call s:add('morhetz/gruvbox')
        call s:add('kabbamine/yowish.vim')
        call s:add('tomasr/molokai')
        call s:add('mhinz/vim-janah')
        call s:add('mhartington/oceanic-next')
        call s:add('nanotech/jellybeans.vim')
        call s:add('altercation/vim-colors-solarized')
        call s:add('kristijanhusak/vim-hybrid-material')
    endif

    if count(g:settings.plugin_groups, 'chinese') "{{{
        call s:add('vimcn/vimcdoc')
    endif

    if count(g:settings.plugin_groups, 'vim') "{{{
        call s:add('Shougo/vimshell.vim',                { 'lazy':1,'on_cmd':['VimShell']})
        call s:add('mattn/vim-terminal',                 { 'lazy':1,'on_cmd':['Terminal']})
        call s:add('junegunn/vim-github-dashboard',      { 'lazy':1,'on_cmd':['GHD','GHA','GHActivity','GHDashboard']})
        call s:add('davidhalter/jedi-vim',     { 'lazy' : 1 , 'on_ft' : 'python'})
        if s:tap('jedi-vim')
            call s:defind_hooks('jedi-vim')
        endif
    endif
    if count(g:settings.plugin_groups, 'nvim') "{{{
        call s:add('m2mdas/phpcomplete-extended',            { 'lazy' : 1 , 'on_ft' : 'php'})
        if s:tap('phpcomplete-extended')
            call s:defind_hooks('phpcomplete-extended')
        endif
    endif
    call s:add('tpope/vim-scriptease')
    call s:add('tpope/vim-fugitive')
    call s:add('cohama/agit.vim',                        { 'lazy':1,'on_cmd':['Agit','AgitFile']})
    call s:add('gregsexton/gitv',                        { 'lazy':1,'on_cmd':['Gitv']})
    call s:add('tpope/vim-surround')
    call s:add('terryma/vim-multiple-cursors')
    let g:multi_cursor_next_key='<C-j>'
    let g:multi_cursor_prev_key='<C-k>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'

    "web plugins

    call s:add('groenewege/vim-less',                    { 'lazy':1,'on_ft':['less']})
    call s:add('cakebaker/scss-syntax.vim',              { 'lazy':1,'on_ft':['scss','sass']})
    call s:add('hail2u/vim-css3-syntax',                 { 'lazy':1,'on_ft':['css','scss','sass']})
    call s:add('ap/vim-css-color',                       { 'lazy':1,'on_ft':['css','scss','sass','less','styl']})
    call s:add('othree/html5.vim',                       { 'lazy':1,'on_ft':['html']})
    call s:add('wavded/vim-stylus',                      { 'lazy':1,'on_ft':['styl']})
    call s:add('digitaltoad/vim-jade',                   { 'lazy':1,'on_ft':['jade']})
    call s:add('juvenn/mustache.vim',                    { 'lazy':1,'on_ft':['mustache']})
    call s:add('Valloric/MatchTagAlways',                { 'lazy':1,'on_ft':['html' , 'xhtml' , 'xml' , 'jinja']})
    call s:add('pangloss/vim-javascript',                { 'lazy':1,'on_ft':['javascript']})
    call s:add('maksimr/vim-jsbeautify',                 { 'lazy':1,'on_ft':['javascript']})
    call s:add('leafgarland/typescript-vim',             { 'lazy':1,'on_ft':['typescript']})
    call s:add('kchmck/vim-coffee-script',               { 'lazy':1,'on_ft':['coffee']})
    call s:add('mmalecki/vim-node.js',                   { 'lazy':1,'on_ft':['javascript']})
    call s:add('leshill/vim-json',                       { 'lazy':1,'on_ft':['javascript','json']})
    call s:add('othree/javascript-libraries-syntax.vim', { 'lazy':1,'on_ft':['javascript','coffee','ls','typescript']})
    call s:add('artur-shaik/vim-javacomplete2',          { 'lazy' : 1 , 'on_ft' : ['java','jsp']})
    let g:JavaComplete_UseFQN = 1
    let g:JavaComplete_ServerAutoShutdownTime = 300
    let g:JavaComplete_MavenRepositoryDisable = 0
    call s:add('wsdjeg/vim-dict',                        { 'lazy' : 1 , 'on_ft' : 'java'})
    call s:add('wsdjeg/java_getset.vim',                 { 'lazy' : 1 , 'on_ft' : 'java'})
    if s:tap('java_getset.vim')
        call s:defind_hooks('java_getset')
    endif
    call s:add('wsdjeg/JavaUnit.vim',                    { 'lazy' : 1 , 'on_ft' : 'java'})
    call s:add('jaxbot/github-issues.vim',               { 'lazy' : 1 , 'on_cmd' : 'Gissues'})
    call s:add('wsdjeg/Mysql.vim',                       { 'lazy' : 1 , 'on_cmd' : 'SQLGetConnection'})
    call s:add('vim-jp/vim-java',                        { 'lazy' : 1 , 'on_ft' : 'java'})
    call s:add('vim-airline/vim-airline')
    call s:add('vim-airline/vim-airline-themes')
    if s:tap('vim-airline')
        call s:defind_hooks('vim-airline')
    endif
    call s:add('mattn/emmet-vim',                        { 'lazy' : 1 , 'on_cmd' : 'EmmetInstall'})
    let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key='<C-e>'
    let g:user_emmet_mode='a'
    let g:user_emmet_settings = {
                \  'jsp' : {
                \      'extends' : 'html',
                \  },
                \}
    " use this two command to find how long the plugin take!
    "profile start vim-javacomplete2.log
    "profile! file */vim-javacomplete2/*
    if has('nvim') && g:settings.enable_neomake
        call s:add('wsdjeg/neomake',{'lazy' : 1 , 'on_cmd' : 'Neomake'})
        if s:tap('neomake')
            call s:defind_hooks('neomake')
        endif
    else
        call s:add('wsdjeg/syntastic')
        if s:tap('syntastic')
            call s:defind_hooks('syntastic')
        endif
    endif
    call s:add('syngan/vim-vimlint',{'lazy' : 1 , 'on_ft' : 'vim'})
    let g:syntastic_vimlint_options = {
                \'EVL102': 1 ,
                \'EVL103': 1 ,
                \'EVL205': 1 ,
                \'EVL105': 1 ,
                \}
    call s:add('ynkdir/vim-vimlparser',{'lazy' : 1 ,'on_ft' : 'vim'})
    call s:add('todesking/vint-syntastic',{'lazy' : 1 ,'on_ft' : 'vim'})
    "let g:syntastic_vim_checkers = ['vint']
    call s:add('gcmt/wildfire.vim',{'lazy':1,'on_map' : '<Plug>(wildfire-'})
    noremap <SPACE> <Plug>(wildfire-fuel)
    vnoremap <C-SPACE> <Plug>(wildfire-water)
    let g:wildfire_objects = ["i'", 'i"', 'i)', 'i]', 'i}', 'ip', 'it']

    call s:add('scrooloose/nerdcommenter')
    call s:add('easymotion/vim-easymotion',{'lazy' : 1 , 'on_map' : '<Plug>(easymotion-prefix)'})
    if s:tap('vim-easymotion')
        map <Leader><Leader> <Plug>(easymotion-prefix)
    endif

    call s:add('MarcWeber/vim-addon-mw-utils')
    call s:add('mhinz/vim-startify')
    if s:tap('vim-startify')
        call s:defind_hooks('vim-startify')
    endif
    call s:add('mhinz/vim-signify')
    let g:signify_disable_by_default = 0
    let g:signify_line_highlight = 0
    call s:add('mhinz/vim-grepper' , { 'on_cmd' : 'Grepper' } )
    if s:tap('vim-grepper')
        call s:defind_hooks('vim-grepper')
    endif
    call s:add('airblade/vim-rooter')
    let g:rooter_silent_chdir = 1
    call s:add('Yggdroot/indentLine')
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '¦'
    let g:indentLine_concealcursor = 'niv' " (default 'inc')
    let g:indentLine_conceallevel = 2  " (default 2)
    call s:add('godlygeek/tabular',         { 'lazy':1,'on_cmd': 'Tabularize'})
    call s:add('benizi/vim-automkdir')
    "[c  ]c  jump between prev or next hunk
    call s:add('airblade/vim-gitgutter',{'lazy' : 1 , 'on_cmd' : 'GitGutterEnable'})
    call s:add('itchyny/calendar.vim',      { 'lazy' : 1 , 'on_cmd' : 'Calendar'})
    call s:add('lilydjwg/fcitx.vim',        { 'lazy' : 1 , 'on_i' : 1})
    call s:add('junegunn/goyo.vim',         { 'lazy' : 1 , 'on_cmd' : 'Goyo'})
    if s:tap('goyo.vim')
        call s:defind_hooks('goyo.vim')
    endif
    "vim Wimdows config
    call s:add('scrooloose/nerdtree',{'lazy':1,'on_cmd':'NERDTreeToggle'})
    if s:tap('nerdtree')
        call s:defind_hooks('nerdtree')
        function! OpenOrCloseNERDTree()
            exec "normal! A"
        endfunction
        noremap <silent> <F9> :NERDTreeToggle<CR>
        let g:NERDTreeWinPos='right'
        let g:NERDTreeWinSize=31
        let g:NERDTreeChDirMode=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        autocmd FileType nerdtree nnoremap <silent><buffer><Space> :call OpenOrCloseNERDTree()<cr>
    endif
    call s:add('tpope/vim-projectionist',{'lazy':1,'on_cmd':['A','AS','AV','AT','AD','Cd','Lcd','ProjectDo']})
    call s:add('Xuyuanp/nerdtree-git-plugin')
    call s:add('taglist.vim',{'lazy' : 1 , 'on_cmd' : 'TlistToggle'})
    if s:tap('taglist.vim')
        call s:defind_hooks('taglist.vim')
        noremap <silent> <F8> :TlistToggle<CR>
    endif
    call s:add('ntpeters/vim-better-whitespace',{'lazy' : 1 , 'on_cmd' : 'StripWhitespace'})
    call s:add('junegunn/rainbow_parentheses.vim',{'lazy' : 1 , 'on_cmd' : 'RainbowParentheses'})
    augroup rainbow_lisp
        autocmd!
        autocmd FileType lisp,clojure,scheme,java RainbowParentheses
    augroup END
    let g:rainbow#max_level = 16
    let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}']]
    " List of colors that you do not want. ANSI code or #RRGGBB
    let g:rainbow#blacklist = [233, 234]
    call s:add('majutsushi/tagbar')
    let g:tagbar_width=30
    let g:tagbar_left = 1
    noremap <silent> <F2> :TagbarToggle<CR>
    "}}}

    call s:add('floobits/floobits-neovim',      { 'lazy' : 1 , 'on_cmd' : ['FlooJoinWorkspace','FlooShareDirPublic','FlooShareDirPrivate']})
    call s:add('wsdjeg/MarkDown.pl',            { 'lazy' : 1 , 'on_cmd' : 'MarkDownPreview'})
    call s:add('plasticboy/vim-markdown',       { 'lazy' : 1 , 'on_ft' : 'markdown'})
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_disabled = 1
    call s:add('simnalamburt/vim-mundo',        { 'lazy' : 1 , 'on_cmd' : 'MundoToggle'})
    nnoremap <silent> <F7> :MundoToggle<CR>
    call s:add('TaskList.vim',                  { 'lazy' : 1 , 'on_cmd' : 'TaskList'})
    map <unique> <Leader>td <Plug>TaskList
    call s:add('ianva/vim-youdao-translater',   { 'lazy' : 1 , 'on_cmd' : ['Ydv','Ydc','Yde']})
    vnoremap <silent> <C-l> <Esc>:Ydv<CR>
    nnoremap <silent> <C-l> <Esc>:Ydc<CR>
    call s:add('elixir-lang/vim-elixir',        { 'lazy' : 1 , 'on_ft' : 'elixir'})
    call s:add('editorconfig/editorconfig-vim', { 'lazy' : 1 , 'on_cmd' : 'EditorConfigReload'})
    call s:add('junegunn/fzf',                  { 'lazy' : 1 , 'on_cmd' : 'FZF'})
    nnoremap <Leader>fz :FZF<CR>
    call s:add('junegunn/gv.vim',               { 'lazy' : 1 , 'on_cmd' : 'GV'})
    call s:add('tyru/open-browser.vim',{
                \'lazy' : 1,
                \'on_cmd' : ['OpenBrowserSmartSearch','OpenBrowser','OpenBrowserSearch'],
                \'on_map' : '<Plug>(openbrowser-',
                \})
    if s:tap('open-brower.vim')
        call s:defind_hooks('open-brower.vim')
    endif
    call s:add('racer-rust/vim-racer',          {'lazy' : 1 , 'on_ft' : 'rust'})
    let g:racer_cmd = $HOME."/.cargo/bin/racer"
    call s:add('rust-lang/rust.vim')
    call s:add('PotatoesMaster/i3-vim-syntax',  {'lazy' : 1 , 'on_ft' : 'i3'})
    call s:end()
endif
