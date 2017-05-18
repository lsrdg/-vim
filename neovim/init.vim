filetype plugin on
syntax on

" Vim-plug ---------------------{{{
call plug#begin()
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/markdown/',
		   \ 'syntax': 'markdown', 'ext': '.md'},
                   \ {'path': '~/vimwiki/wiki', 'ext': '.wiki'}]
let g:vimwiki_folding='list'
Plug 'junegunn/goyo.vim'
Plug 'rstacruz/sparkup'
Plug 'whatyouhide/vim-gotham'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'mhinz/vim-janah'
Plug 'junegunn/limelight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'sjl/strftimedammit.vim'
Plug 'ron89/thesaurus_query.vim'
Plug 'justinmk/vim-sneak'
Plug 'lsrdg/tatoeba-karini.nvim'
Plug 'lsrdg/elysian.vim'
Plug '~/git/vibusen.vim'
Plug '~/.config/nvim/plugged/markdumb.vim'
Plug '~/prog/potion.vim'
let g:potion_command = '~/builds/potion/bin/potion'
Plug '~/prog/comeback.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "chromium"
let g:mkdp_auto_open = 1
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/vim-pdf'
Plug 'romainl/Apprentice'
Plug 'fmoralesc/vim-tutor-mode'
call plug#end()
" }}}
" ======================================
    " TESTING ZONE ------------------------{{{

function! g:SafeQuit()
    if &modified ==# 'nomodified'
	bprevious
	bd#
    else
	echo 'Remember to save it!'
    endif
endfunction
    
" Quickfix
set efm=%m
" Potion command
let g:potion_command = "~/builds/potion/bin/potion"
    " folding

"let g:markdown_folding = 1
" statusline
set statusline=%f
set statusline+=%=  
set statusline+=%m  
set statusline+=%-l/%L\ 
set statusline+=(%03p%%)
"%8*\ %=\ 
" html
inoremap jk <Esc>/<\/<CR>f> :noh <CR> a
inoremap kj <Esc>?<\/\@!<CR> :noh <CR> 2bi

"-------------------
" Leader
let mapleader = ","
nnoremap \\ ,
" Edit macro
nnoremap <leader>mn  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" Shell
nnoremap <leader>mk :vsplit <BAR> :terminal <CR>
nnoremap <leader>mj :split <BAR> :terminal <CR>
nnoremap <leader>mm :terminal <CR>
" Translate shell
nnoremap <leader>ss :05split <BAR> :term <CR> trans -b :pt+da 
nnoremap <leader>sd :08split <BAR> :term <CR> trans :pt+da 
" translate shell
set keywordprg=trans\ :ja
" Node Thesaurus
nnoremap <leader>sa :05split <BAR> :term <CR> tcom 
" -------------
"  }}}


" Augroups ---------------------{{{
" Folding vimscript files 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Limelight Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" HTML Identing
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html :setlocal wrap
    autocmd BufWritePre,BufRead *html ":execute normal! gg=G ''"
augroup END

" Goyo always with mardown
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md :setlocal tw=80
    autocmd BufNewFile,BufRead *.md :setlocal expandtab
augroup END
" }}}
" =======================================
" Settings -----------------{{{
" Mouse setting
set mouse=a
" Tab
set shiftwidth=4
set number 
set relativenumber 
set showmatch
set ignorecase
set smartcase 
set hidden
set scroll=2
" Colors ---------------------{{{
set termguicolors
hi SpellBad ctermbg=52 ctermfg=194
hi Vwlink cterm=none ctermbg=52 gui=none guifg=5
" hi Comment ctermfg=12
hi link VimwikiLink Vwlink 
colorscheme elysian
set background=dark
" }}}
" }}}

" Mappings -------------------------"{{{
" Buffers/Splits/Tabs/Windows ---------------------{{{
"Netrw in a vertical split
nnoremap <leader>ff :20Lexplore<CR>
" Buffers - flow 
noremap <C-A>s :call SafeQuit()<cr>
"noremap <C-A>s :bp<CR>:bd#<CR>
nnoremap dc :bn<CR>
nnoremap cd :bp<CR>
noremap <F4> :buffers<CR>:buffer<space>

" Splits - flow
nnoremap ds <C-W>w
nnoremap <C-S>a :q<CR>

" init.vim in a vertical split
nnoremap m, :vsplit $MYVIMRC<CR>
" source init.vim
nnoremap m. :source $MYVIMRC<CR>
" write
nnoremap <space> :w<CR>
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
noremap <leader>lsp :set spell! spelllang=es<CR>
noremap <leader>lsv :set spell! spelllang=sv<CR>
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
nnoremap <A-l> <C-w>l
tnoremap <C-S>a <C-\><C-n>:q<CR>
tnoremap <C-Q> <C-\><C-n>:bd!<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap ds <C-W>w
tnoremap dc :bn<CR>
tnoremap cd :bp<CR>
" }}}
"}}}

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" Netrw's configuration
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
nnoremap <leader>t A<!-- --><ESC>F i
"    -- Create Jekyll's posts front matter | 
nnoremap <leader>p :0r _drafts/base.md<CR>/+<CR>i<C-r>=strftime('%F %T ')<CR><ESC>/"<CR>:noh<CR>a
" }}}

