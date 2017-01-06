filetype plugin on
syntax on

" Vim-plug ---------------------{{{
call plug#begin()
Plug 'vimwiki/vimwiki'
let g:vimwiki_folding='list'
let g:vimwiki_use_calendar= 1
Plug 'junegunn/goyo.vim'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='gotham'
Plug 'itchyny/calendar.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'chrisbra/Recover.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
" }}}
" ======================================
    " TESTING ZONE ------------------------{{{
" Vim-Slash 

" Leader
let mapleader = ","
nnoremap \\ ,
" Shell
nnoremap <leader>dd :vsplit <BAR> :terminal <CR>
nnoremap <leader>ds :split <BAR> :terminal <CR>
" Translate shell
nnoremap <leader>s :05split <BAR> :term <CR> trans -b :pt+da 
" translate shell
set keywordprg=trans\ :ja
" -------------
"  }}}

" Folding vimscript files ---------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Augroups ---------------------{{{
" Limelight Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" HTML Identing
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html :setlocal nowrap
    autocmd BufWritePre,BufRead *html ":execute normal! gg=G ''"
augroup END

" Goyo always with mardown
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md :Goyo
    autocmd BufNewFile,BufRead *.md :setlocal tw=80
augroup END
" }}}
" =======================================
" Settings -----------------{{{
" Tab
set shiftwidth=4
set number 
set relativenumber 
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase 
set hidden
" Colors ---------------------{{{
set termguicolors
hi SpellBad ctermbg=52 ctermfg=194
hi Vwlink cterm=none ctermbg=52 gui=none guifg=5
" hi Comment ctermfg=12
hi link VimwikiLink Vwlink 
colorscheme gotham   
" }}}
" }}}

" Mappings -------------------------"{{{
" Buffers/Splits/Tabs/Windows ---------------------{{{
"Netrw in a vertical split
nnoremap <leader>ff :20Lexplore<CR>
" Buffers - flow 
noremap <C-A>s :bp<CR>:bd#<CR>
nnoremap dc :bn<CR>
nnoremap cd :bp<CR>
noremap <F4> :buffers<CR>:buffer<space>

" Splits - flow
nnoremap ds <C-W>w
nnoremap <C-S>a :q<CR>

" Tabs - flow
nnoremap <C-T>t :tabnew<CR>

" init.vim in a vertical split
nnoremap <leader>, :vsplit $MYVIMRC<CR>
" source init.vim
nnoremap <leader>. :source $MYVIMRC<CR>
" write
nnoremap <space> :w<CR>
" -- Escape
inoremap jk <Esc>
inoremap kj <Esc>
" -- Text width
nnoremap <leader>tw :set tw=80 <CR>
nnoremap <leader>twt :set tw=0 <CR>
"------------------ Relative and absolute line numbers
noremap <leader>n :set number! <CR>
noremap <leader>nn :set rnu! <CR>
" ----------------- Highlight and toggle off
nnoremap <leader><space> :noh<cr>
" Spellcheck MAPPING"{{{
noremap <leader>lp :set spell! spelllang=pt<CR>
noremap <leader>li :set spell! spelllang=en<CR>
noremap <leader>ld :set spell! spelllang=da<CR>
noremap <leader>le :set spell! spelllang=eo<CR>
noremap <leader>ls :set spell! spelllang=es<CR>
noremap <leader>lf :set spell! spelllang=fr<CR>
"}}}
" :terminal ------------------{{{
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>
tnoremap <C-S>a <C-\><C-n>:q<CR>
tnoremap <C-Q> <C-\><C-n>
tnoremap ds <C-W>w
tnoremap dc :bn<CR>
tnoremap cd :bp<CR>
" }}}
"}}}

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

" -- Goyo
nmap <leader>g :Goyo <CR>
nmap <Leader>ll <Plug>(Limelight)
xmap <Leader>ll <Plug>(Limelight)
" Enter line
nnoremap <C-j> i<CR><ESC>
" }}}

" Macros ---------------------{{{
"    -- Comment div closing tags with class' names
noremap <leader>t yi"%A <!--"--> 
"    -- Create Jekyll's posts front matter | 
nnoremap <leader>p :0r _drafts/base.md<CR>/+<CR>i<C-r>=strftime('%F %T ')<CR><ESC>/"<CR>:noh<CR>a
" }}}
