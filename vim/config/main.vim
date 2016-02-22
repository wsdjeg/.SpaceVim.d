" Enable nocompatible
if has('vim_starting')
    if &compatible
        set nocompatible
    endif
endif


let g:Config_Main_Home = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')

call zvim#util#source_rc('functions.vim')

call zvim#util#source_rc('init.vim')

scriptencoding utf-8

call zvim#util#source_rc('plugins.vim')


call zvim#util#source_rc('general.vim')


"for ctrlp-z
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>





call zvim#util#source_rc('mappings.vim')


call zvim#util#source_rc('autocmds.vim')

if has('nvim')
    call zvim#util#source_rc('neovim.vim')
endif

call zvim#util#source_rc('commands.vim')
