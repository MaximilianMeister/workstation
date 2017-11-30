:filetype plugin on
:syntax on
set nu

"set bg=dark
set tabstop=2
set shiftwidth=2
set expandtab

" tab navigation
:noremap <C-l> gt
:noremap <C-h> gT

" load plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set runtimepath^=~/.vim/bundle/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrl-n explorer
map <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=40

" ctrl-s save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" open (and close) split window in new tab
noremap tt :tab split<CR>
noremap TT :tabc<CR>

" colors
colorscheme PaperColor
