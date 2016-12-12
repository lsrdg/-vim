filetype plugin on
syntax on
" Vim-plug 
call plug#begin()
Plug 'vimwiki/vimwiki'
let g:vimwiki_folding='list'
let g:vimwiki_use_calendar= 1
Plug 'junegunn/goyo.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='luna'
Plug 'itchyny/calendar.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

nnoremap <leader>, :vsplit $MYVIMRC<CR>
nnoremap <leader>. :source $MYVIMRC<CR>
nnoremap <space> :w<CR>

" -- Escape
inoremap jk <Esc>
inoremap kj <Esc>

" -- Text width
nnoremap <leader>tw :set tw=80 <CR>
nnoremap <leader>twt :set tw=0 <CR>


" Tab
set shiftwidth=4

"------------------ Relative and absolute line numbers
set number 
set relativenumber 
noremap <leader>n :set number! <CR>
noremap <leader>nn :set rnu! <CR>

" ----------------- Highlight and toggle off
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase 
nnoremap <leader><space> :noh<cr>

" Colors
hi SpellBad ctermbg=16 ctermfg=194
hi Vwlink cterm=none ctermbg=18 gui=none guifg=5
hi link VimwikiLink Vwlink 

"------------------ Spellcheck MAPPING
noremap <leader>lp :set spell! spelllang=pt<CR>
noremap <leader>li :set spell! spelllang=en<CR>
noremap <leader>ld :set spell! spelllang=da<CR>
noremap <leader>le :set spell! spelllang=eo<CR>
noremap <leader>ls :set spell! spelllang=es<CR>
noremap <leader>lf :set spell! spelllang=fr<CR>

"------------------ Windows/Splits/Buffers/Tabs
"Netrw in a vertical split
nnoremap <leader>ff :20Lexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" ViFm in a vertical split
nnoremap <leader>fv :50vs<CR>:terminal vifm<CR>

" ------------------Splits minimals
set winheight=15
set winminheight=5
set winwidth=30
set winminwidth=5

" Buffers - Cycling
set hidden
noremap <F6> :bp<CR>:bd#<CR>
noremap <F5> :bn<CR>
noremap <F4> :bp<CR>
noremap <F3> :buffers<CR>:buffer<space>

" -- Goyo
nmap <leader>g :Goyo <CR>
" Enter line
nnoremap <C-j> i<CR><ESC>

" -- Macros
"    -- Comment div closing tags with class' names
noremap <leader>t yi"%A <!--"--> 
"    -- Create Jekyll's posts front matter | 
nnoremap <leader>p :0r _drafts/base.md<CR>/+<CR>i<C-r>=strftime('%F %T ')<CR><ESC>/"<CR>:noh<CR>a
inoremap ysnipraw <ESC>:r ysnipraw<CR>o

