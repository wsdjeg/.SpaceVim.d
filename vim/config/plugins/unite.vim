scriptencoding utf-8
call unite#custom#source('codesearch', 'max_candidates', 30)
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
            \   'safe': 0,
            \   'start_insert': 1,
            \   'short_source_names': 1,
            \   'update_time': 500,
            \   'direction': 'rightbelow',
            \   'winwidth': 40,
            \   'winheight': 15,
            \   'max_candidates': 100,
            \   'no_auto_resize': 1,
            \   'vertical_preview': 1,
            \   'cursor_line_time': '0.10',
            \   'hide_icon': 0,
            \   'candidate-icon': ' ',
            \   'marked_icon': '✓',
            \   'prompt' : '⮀ '
            \ })
call unite#custom#profile('source/neobundle/update', 'context', {
            \   'start_insert' : 0,
            \ })
let g:unite_source_codesearch_ignore_case = 1
let g:unite_source_file_mru_time_format = "%m/%d %T "
let g:unite_source_directory_mru_limit = 80
let g:unite_source_directory_mru_time_format = "%m/%d %T "
let g:unite_source_file_rec_max_depth = 6
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_data_directory='~/.cache/unite'
"let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='>> '
let g:unite_split_rule = 'botright'
let g:unite_winheight=25
let g:unite_source_grep_default_opts = "-iRHn"
            \ . " --exclude='tags'"
            \ . " --exclude='cscope*'"
            \ . " --exclude='*.svn*'"
            \ . " --exclude='*.log*'"
            \ . " --exclude='*tmp*'"
            \ . " --exclude-dir='**/tmp'"
            \ . " --exclude-dir='CVS'"
            \ . " --exclude-dir='.svn'"
            \ . " --exclude-dir='.git'"
            \ . " --exclude-dir='node_modules'"
let g:unite_launch_apps = [
            \ 'rake',
            \ 'make',
            \ 'git pull',
            \ 'git push']
let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.git = {
            \ 'description' : '            gestionar repositorios git
            \                            ⌘ [espacio]g',
            \}
let g:unite_source_menu_menus.git.command_candidates = [
            \['▷ tig                                                        ⌘ ,gt',
            \'normal ,gt'],
            \['▷ git status       (Fugitive)                                ⌘ ,gs',
            \'Gstatus'],
            \['▷ git diff         (Fugitive)                                ⌘ ,gd',
            \'Gdiff'],
            \['▷ git commit       (Fugitive)                                ⌘ ,gc',
            \'Gcommit'],
            \['▷ git log          (Fugitive)                                ⌘ ,gl',
            \'exe "silent Glog | Unite quickfix"'],
            \['▷ git blame        (Fugitive)                                ⌘ ,gb',
            \'Gblame'],
            \['▷ git stage        (Fugitive)                                ⌘ ,gw',
            \'Gwrite'],
            \['▷ git checkout     (Fugitive)                                ⌘ ,go',
            \'Gread'],
            \['▷ git rm           (Fugitive)                                ⌘ ,gr',
            \'Gremove'],
            \['▷ git mv           (Fugitive)                                ⌘ ,gm',
            \'exe "Gmove " input("destino: ")'],
            \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
            \'Git! push'],
            \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
            \'Git! pull'],
            \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
            \'exe "Git! " input("comando git: ")'],
            \['▷ git cd           (Fugitive)',
            \'Gcd'],
            \]
let g:unite_source_grep_max_candidates = 200
if executable('hw')
    " Use hw (highway)
    " https://github.com/tkengo/highway
    let g:unite_source_grep_command = 'hw'
    let g:unite_source_grep_default_opts = '--no-group --no-color'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt (the platinum searcher)
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack
    " http://beyondgrep.com/
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
                \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " Use jvgrep
    " https://github.com/mattn/jvgrep
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif
let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \  '--hidden', '-g', '']
nnoremap <silent><leader>ufa :<C-u>Unite -no-split -buffer-name=Mixed -start-insert file file_mru file_rec buffer<cr>
nnoremap <silent><leader>ufr :<C-u>Unite -buffer-name=files file_rec/async:!<cr>
nnoremap <silent><leader>ufg :<C-u>Unite -buffer-name=git-repo file_rec/git<cr>
call unite#custom#profile('file_rec/async,file_rec/git', 'context', {
            \   'start_insert' : 1,
            \   'quit'         : 1,
            \   'split'        : 1,
            \   'keep_focus'   : 1,
            \   'winheight'    : 20,
            \ })
call unite#custom#source('file_rec/async', 'ignore_globs',['*.png','.git/','*.ttf'])
nnoremap <silent><leader>uf  :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <silent><leader>ufm :<C-u>Unite -no-split -buffer-name=mru   -start-insert file_mru<cr>
nnoremap <silent><leader>ubf :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <silent><leader>utb :<C-u>Unite -buffer-name=buffer_tab  buffer_tab<cr>
call unite#custom#profile('buffer,buffer_tab', 'context', {
            \   'start_insert' : 0,
            \   'quit'         : 1,
            \   'keep_focus'   : 1,
            \   'winheight'    : 20,
            \ })
nnoremap <silent><leader>um  :<C-u>Unite -start-insert mapping<CR>
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"" Tag search
""" For searching the word in the cursor in tag file
nnoremap <silent><leader>f :<c-u>Unite tag/include:<C-R><C-w><CR>
nnoremap <silent><leader>ff :<c-u>Unite tag/include -start-insert<CR>
"" grep dictionay
""" For searching the word in the cursor in the current directory
nnoremap <silent><leader>v :Unite -auto-preview -no-split grep:.::<C-R><C-w><CR>
nnoremap <space>/ :Unite -auto-preview grep:.<cr>
""" For searching the word handin
nnoremap <silent><leader>vs :Unite -auto-preview -no-split grep:.<CR>
""" For searching the word in the cursor in the current buffer
noremap <silent><leader>vf :Unite -auto-preview -no-split grep:%::<C-r><C-w><CR>
""" For searching the word in the cursor in all opened buffer
noremap <silent><leader>va :Unite -auto-preview -no-split grep:$buffers::<C-r><C-w><CR>
nnoremap <silent> <C-b> :<C-u>Unite -start-insert -buffer-name=buffer buffer<cr>
"" outline
nnoremap <silent><leader>o :<C-u>Unite -buffer-name=outline -start-insert -auto-preview -no-split outline<cr>
"" Line search
nnoremap <silent><leader>l :Unite line -start-insert  -auto-preview -no-split<CR>
"" Yank history
nnoremap <silent><leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
" search plugin
" :Unite neobundle/search
"for Unite menu{
nnoremap <silent><leader>ug :Unite -silent -start-insert menu:git<CR>
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    f [unite]
nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
            \ -buffer-name=files -prompt=%\  buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
            \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]s  :<C-u>Unite session<CR>
nnoremap <silent> [unite]n  :<C-u>Unite session/new<CR>
nnoremap <silent> [unite]fr
            \ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
            \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
            \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> [unite]w
            \ :<C-u>Unite -buffer-name=files -no-split
            \ jump_point file_point buffer_tab
            \ file_rec:! file file/new<CR>
