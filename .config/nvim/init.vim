set nocompatible              " be iMproved, required
set nomodeline
syntax on

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab


set mouse=a

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'jalvesaq/Nvim-R'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-sensible'
Plugin 'chrisbra/csv.vim'
Plugin 'jpalardy/vim-slime.git'
Plugin 'lifepillar/pgsql.vim'
Plugin 'chiel92/vim-autoformat'
Plugin 'tell-k/vim-autopep8'
Plugin 'lervag/vimtex'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'davidhalter/jedi'

call vundle#end()            " required
filetype plugin indent on    " required

set clipboard+=unnamedplus

let g:python3_host_prog = '/usr/bin/python3'

" YouCompleteMe and Jedi
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm_venv_config.py'
let g:ycm_autoclose_preview_window_after_completion=0

let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1

" vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_compiler_engine = 'lualatex'
let g:tex_flavor = 'latex'

" Slime:
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1
autocmd FileType python xnoremap <buffer> <C-M> :SlimeSend<cr>
autocmd FileType python nnoremap <buffer> <C-M> :SlimeSend<cr>
autocmd BufRead,BufNewFile *.jl :set filetype=julia
autocmd BufRead,BufNewFile *.sql :set filetype=sql
autocmd FileType julia xnoremap <buffer> <C-M> :SlimeSend<cr>
autocmd FileType julia nnoremap <buffer> <C-M> :SlimeSend<cr>
autocmd FileType sql xnoremap <buffer> <C-M> :SlimeSend<cr>
autocmd FileType sql nnoremap <buffer> <C-M> :SlimeSend<cr>

" NERDTree
map <C-o> :NERDTreeToggle<CR>

" Set bar colors
set laststatus=2
set noshowmode
let g:lightline = {'colorscheme':'wombat'}

" nvimR
" Autocomplete
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
" Send line or paragraph with Enter
vmap <C-M> <Plug>RDSendSelection
nmap <C-M> <Plug>RDSendLine
" Use Ctrl+Space to do omnicompletion:


if has('nvim') || has('gui_running')
   inoremap <C-Space> <C-x><C-o>
else
   inoremap <Nul> <C-x><C-o>
endif
"assign -- to ->
let R_assign_map = "--"
" escape to go to normal mode in R terminal "
let R_esc_term = 1
" don't indent comments when using \xx
let R_indent_commented = 0
" Shortcuts for %>%
autocmd FileType r inoremap <buffer> <C-\> <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> <C-\> <Esc>:normal! a %>%<CR>a
autocmd FileType rmd inoremap <buffer> <C-\> <Esc>:normal! a %>%<CR>a
" initial split configuration
let R_rconsole_width = 0
let R_rconsole_height = 20
" Highlight chunks
let rmd_syn_hl_chunk = 1
let rmd_rrst_hl_chunk = 1
" Start and end R when opening r or rmd doc
autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
" Object Browser details
let R_objbr_place = 'script,right'
let R_objbr_w = 45
let R_objbr_opendf = 0
let R_objbr_openlist = 0
" R documentation:
let R_nvimpager = "tabnew"
" rmd html output
let R_openhtml = 2

" Python settings:
let python_highlight_all=1
let g:syntastic_python_checkers = ['python']
let g:syntastic_python_python_exec = 'python3'
let g:autopep8_disable_show_diff=1
let g:autopep8_aggressive=2
au FileType python setlocal formatprg=autopep8\ -
"let g:autopep8_on_save = 1

" sql
let g:syntastic_sql_checker = ['sqlint']
let g:sql_type_default = 'pgsql'
"autocmd BufWritePre *.sql execute ':Autoformat'

" line numbers:
set number

" Spellcheck for certain filetypes
autocmd FileType rmd,markdown,tex,text setlocal spell
set spelllang=en_ca

" easier pane maneuvering "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <Esc> <C-\><C-n>

set statusline+=%#warningmsg#
set statusline+=%*

" Trip white space using :TrimWhitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

"Highlight colors
hi clear Search
hi Search ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi clear MatchParen
hi MatchParen ctermfg=0 ctermbg=Green
hi Visual term=bold,reverse cterm=bold ctermfg=15 ctermbg=2 gui=bold guifg=bg guibg=DarkGreen
hi QuickFixLine term=underline cterm=underline ctermfg=130 gui=bold guifg=Brown
"Spellcheck colours
hi clear SpellBad
""hi SpellBad term=underline cterm=underline gui=bold ctermbg=1 ctermfg=0
hi SpellBad cterm=underline,bold ctermfg=Darkred
hi clear SpellRare
hi SpellRare cterm=underline,bold ctermfg=Darkred
hi clear SpellCap
hi SpellCap cterm=underline,bold ctermfg=Darkcyan
hi clear SpellLocal
hi SpellLocal cterm=underline ctermfg=Red

