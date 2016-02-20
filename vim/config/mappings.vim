"mapping
"{{{
"全局映射
"也可以通过'za'打开或者关闭折叠
nnoremap <silent><leader><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"Super paste it does not work
"ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
"对于没有权限的文件使用 :w!!来保存
cnoremap w!! %!sudo tee > /dev/null %


" 映射Ctrl+上下左右来切换窗口
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Left>  <C-W><Left>
nnoremap <C-Up>    <C-W><Up>
nnoremap <C-Down>  <C-W><Down>
if has('nvim')
    tnoremap <C-Right> <C-\><C-n><C-w><Right>
    tnoremap <C-Left>  <C-\><C-n><C-w><Left>
    tnoremap <C-Up>    <C-\><C-n><C-w><Up>
    tnoremap <C-Down>  <C-\><C-n><C-w><Down>
    tnoremap <esc>     <C-\><C-n>
endif

"for buftabs
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>

"Quickly add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"Use jk switch to normal model
inoremap jk <esc>

"]e or [e move current line ,count can be useed
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

"Ctrl+Shift+上下移动当前行
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
"上下移动选中的行
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv
