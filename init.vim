let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
if 0 | endif
if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif
	set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/deoplete.nvim'
let s:hooks = neobundle#get_hooks("deoplete.nvim")
function! s:hooks.on_source(bundle)
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#data_directory='~/.cache/deoplete'
	let g:acp_enableAtStartup = 0
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#enable_camel_case = 1
	let g:deoplete#enable_ignore_case = 1
	let g:deoplete#enable_fuzzy_completion = 1
	" Set minimum syntax keyword length.
	let g:deoplete#sources#syntax#min_keyword_length = 3
	let g:deoplete#lock_buffer_name_pattern = '\*ku\*'
	" Define dictionary.
	let g:deoplete#sources#dictionary#dictionaries = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }
	" Define keyword.
	if !exists('g:deoplete#keyword_patterns')
		let g:deoplete#keyword_patterns = {}
	endif
	let g:deoplete#keyword_patterns['default'] = '\h\w*'


	" AutoComplPop like behavior.
	let g:deoplete#enable_auto_select = 0

	if !exists('g:deoplete#sources#omni#input_patterns')
		let g:deoplete#sources#omni#input_patterns = {}
	endif

	let g:deoplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	let g:deoplete#sources#omni#input_patterns.java = '[^. *\t]\.\w*\|\h\w*::'
	let g:deoplete#force_omni_input_patterns = {}
	"let g:deoplete#force_omni_input_patterns.java = '^\s*'
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h>
				\ deolete#mappings#smart_close_popup()."\<C-h>"
	inoremap <expr><BS>
				\ deoplete#mappings#smart_close_popup()."\<C-h>"	
	inoremap <expr><C-y>  deoplete#close_popup()
	inoremap <expr><C-e>  deoplete#cancel_popup()

endfunction
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neopairs.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim' "{{{
let g:neosnippet#snippets_directory='~/DotFiles/snippets'
let g:neosnippet#enable_snipmate_compatibility=1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<C-n>" : "\<TAB>")
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
NeoBundle 'simnalamburt/vim-mundo'
NeoBundle 'artur-shaik/vim-javacomplete2'
let g:JavaComplete_UseFQN = 1
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'
let g:Powerline_sybols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
syntax on
autocmd FileType java set omnifunc=javacomplete#Complete
