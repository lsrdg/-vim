filetype plugin on
syntax on

" Settings -----------------{{{
set path=.,**
set mouse=a
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
set number 
set relativenumber 
set showmatch
set ignorecase
set smartcase 
set hidden
set scroll=2
set undofile

" :find settings
set wildmenu
" make filename-completion skip these files and directories
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.cache,*.pdb,*.min.*
set wildignore+=*/.git/**/*
set wildignore+=*/min/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*
" case-insensitive
set wildignorecase
" list files and let the user choose with the wildmenu
set wildmode=list:full

if has('nvim')
set inccommand=split
endif

" Quickfix
set efm=%m


" statusline
set statusline=%f
set statusline+=%=  
set statusline+=%m  
set statusline+=%-l/%L\ 
set statusline+=(%c\ %03p%%)
"%8*\ %=\ 

"------------------
" Leader
let mapleader = ","
nnoremap \\ ,

" Colors ---------------------{{{
set termguicolors
set t_Co=256

if has('nvim')
colorscheme molokai
else
colorscheme pablo
endif


set background=dark
hi SpellBad ctermbg=52 ctermfg=194

" translate shell
set keywordprg=trans\ :ja


if has('nvim')
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=re guifg=white ctermbg=1 ctermfg=15
endif

" }}}
" }}}

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('lsrdg/vibusen.vim')
call minpac#add('lsrdg/markdumb.vim')

call minpac#add('lsrdg/dumbnote.vim')
let g:dumbnoteDefaultCollection = $HOME . "/dumbnote-collection"

call minpac#add('mattn/emmet-vim')
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_install_global = 0

call minpac#add('machakann/vim-highlightedyank')
call minpac#add('ap/vim-css-color')
call minpac#add('mitsuhiko/vim-jinja')

" Augroups ---------------------{{{
" Lint
augroup linting
    autocmd!
    "autocmd FileType python setlocal makeprg=flake8\ --format=default\ %
    autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable
    autocmd FileType javascript setlocal makeprg=eslint\ --format\ compact
    "autocmd BufWritePost *.py silent make! <afile> | silent redraw!
    "autocmd BufWritePost *.js silent make! <afile> | silent redraw!
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END
" Folding vimscript files 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
augroup delete_netrw_buffer
    autocmd!
    autocmd FileType netrw setl bufhidden=delete
augroup END

" HTML Identing
augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html :setlocal wrap
    autocmd BufWritePre,BufRead *html ":execute normal! gg=G ''"
augroup END

augroup emmet_types
    autocmd!
    autocmd FileType html,css,yml,php,markdown EmmetInstall
augroup END

" }}}
" =======================================

" Mappings -------------------------"{{{

nnoremap <F5> :Explore ~/dumbnote-collection<cr>/

nnoremap <leader><leader> :terminal <CR>
" Translate shell
nnoremap <leader>ss :05split <BAR> :term <CR> trans -b :pt+da 
nnoremap <leader>sd :08split <BAR> :term <CR> trans :pt+da 

nnoremap <cr> i<cr><esc>
inoremap {<cr> {<cr>}<esc>O

" Buffers/Splits/Tabs/Windows ---------------------{{{

nnoremap <leader>f :find *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>

"Netrw in a vertical split
" nnoremap <leader>nv :20Lexplore<CR>

" Buffers - flow 
nnoremap <space>w :bprevious<cr>:confirm bd#<cr>
nnoremap <space>f :buffers<CR>:buffer<space>
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

" Splits - flow
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l

nnoremap <C-w>v <C-w>v<C-w>w
nnoremap <C-w>s <C-w>s<C-w>w

" init.vim in a vertical split
nnoremap <F4> :vsplit $MYVIMRC<CR>
" source init.vim
nnoremap <F9> :source $MYVIMRC<CR>
" write
nnoremap <space>s :write<CR>
"------------------ Relative and absolute line numbers
noremap yon :set number! <CR>
noremap yor :set relativenumber! <CR>
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
if has('nvim')
"tnoremap <leader>h <C-\><C-n><C-w>h
"tnoremap <leader>j <C-\><C-n><C-w>j
"tnoremap <leader>k <C-\><C-n><C-w>k
"tnoremap <leader>l <C-\><C-n><C-w>l
"tnoremap <space>w <C-\><C-n>:bprevious<cr>:bdelete#<CR>
tnoremap <C-S>a <C-\><C-n>:q<CR>
tnoremap <C-Q> <C-\><C-n>:bd!<CR>
tnoremap <ESC> <C-\><C-n>
endif
" }}}
"}}}

" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" Search for the next identifier in Vim help files
nnoremap ]i :call search('\v\\|.{-}\\|')<CR>

" Netrw's configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1

" ------------------Splits minimals
set winheight=15
set winminheight=5
set winwidth=30
set winminwidth=5

" Enter line
nnoremap <C-j> i<CR><ESC>
" }}}

" Functions ..................{{{
function! JekyllServer()
    execute "terminal jekyll_server"
endfunction
" }}}

" Commands ...................{{{
command! -bang -nargs=0 JekyllServer call JekyllServer()
command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
"  }}}
" Macros ---------------------{{{
"    -- Comment div closing tags with class' names
function! g:CloseTagComment()
  normal %
  execute "normal! yi<"
  normal %
  execute "normal! A<!-- "
  normal p
  execute "normal! A--> "
endfunction

nnoremap <leader>t :call CloseTagComment()<CR>

"    -- Create Jekyll's posts front matter | 
nnoremap <leader>p :0r _drafts/base.md<CR>/+<CR>i<C-r>=strftime('%F %T ')<CR><ESC>/"<CR>:noh<CR>a
" }}}
