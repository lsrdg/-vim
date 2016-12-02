filetype plugin on
syntax on
" Vim-plug 
call plug#begin()
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

" Splits

" splits minimals
" set winheight=30
" set winminheight=5
" set winwidth=30
" set winminwidth=5

" Netrw in a vertical split
nmap <leader>ff :30vs.<CR>
" ViFm in a vertical split
nmap <leader>fv :50vs<CR>:terminal vifm<CR>

" Mappings and options
" -- Spellcheck MAPPING
map <leader>lp :set spell! spelllang=pt<CR>
map <leader>li :set spell! spelllang=en<CR>
map <leader>ld :set spell! spelllang=da<CR>
map <leader>le :set spell! spelllang=eo<CR>
map <leader>ls :set spell! spelllang=es<CR>
map <leader>lf :set spell! spelllang=fr<CR>

" -- Relative and absolute line numbers
set number 
set relativenumber 
map <leader>n :set number! <CR>
map <leader>nn :set rnu! <CR>

" -- Highlight and toggle off
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase 
nnoremap <leader><space> :noh<cr>

" -- Escape
imap kk <Esc>

" -- Text width
nmap <leader>tw :set tw=80 <CR>
nmap <leader>twt :set tw=0 <CR>

" -- Macros
"    -- Comment div closing tags with class' names
map <leader>t yi"%A <!--"--> 

" -- Goyo
map <leader>g :Goyo <CR>
