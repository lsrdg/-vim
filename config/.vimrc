set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
syntax on

" Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
let g:vimwiki_folding='list'
Plug 'junegunn/goyo.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='luna'
Plug 'itchyny/calendar.vim'
call plug#end()

" Mappings
" Spellcheck MAPPING
map <leader>lp :set spell! spelllang=pt<CR>
map <leader>li :set spell! spelllang=en<CR>
map <leader>ld :set spell! spelllang=da<CR>
map <leader>le :set spell! spelllang=eo<CR>
map <leader>ls :set spell! spelllang=es<CR>
map <leader>lf :set spell! spelllang=fr<CR>
" -- Relative and absolute line numbers
set number 
set relativenumber 
map <leader>n :set number <CR>
map <leader>nn :set relativenumber <CR>
map <leader>nm :set nonu <CR>
map <leader>nmn :set rnu! <CR>
" -- Highlight and toggle off
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase
nnoremap <leader><space> :noh<cr>

