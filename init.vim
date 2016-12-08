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

"------------------ Relative and absolute line numbers
set number 
set relativenumber 
map <leader>n :set number! <CR>
map <leader>nn :set rnu! <CR>

" ----------------- Highlight and toggle off
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase 
hi SpellBad ctermbg=16 ctermfg=194
nnoremap <leader><space> :noh<cr>

"------------------ Spellcheck MAPPING
map <leader>lp :set spell! spelllang=pt<CR>
map <leader>li :set spell! spelllang=en<CR>
map <leader>ld :set spell! spelllang=da<CR>
map <leader>le :set spell! spelllang=eo<CR>
map <leader>ls :set spell! spelllang=es<CR>
map <leader>lf :set spell! spelllang=fr<CR>

"------------------ Windows/Splits/Buffers/Tabs
"Netrw in a vertical split
nmap <leader>ff :20Lexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" ViFm in a vertical split
nmap <leader>fv :50vs<CR>:terminal vifm<CR>

" ------------------Splits minimals
set winheight=15
set winminheight=5
set winwidth=30
set winminwidth=5

" Buffers - Cycling
set hidden
nmap <F6> :bp<CR>:bd#<CR>
nmap <F5> :bn<CR>
nmap <F4> :bp<CR>
nnoremap <F3> :buffers<CR>:buffer<space>

" -- Escape
imap ii <Esc>
imap kk <Esc>

" -- Text width
nmap <leader>tw :set tw=80 <CR>
nmap <leader>twt :set tw=0 <CR>

" -- Goyo
nmap <leader>g :Goyo <CR>
" Enter line
nnoremap <C-j> i<CR><ESC>

" -- Macros
"    -- Comment div closing tags with class' names
map <leader>t yi"%A <!--"--> 
"    -- Create Jekyll's posts front matter | 
nmap <leader>p :0r _drafts/base.md<CR>/+<CR>i<C-r>=strftime('%F %T ')<CR><ESC>/"<CR>:noh<CR>a

