filetype plugin on
syntax on

" Vim-plug ---------------------{{{
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'itchyny/calendar.vim'
Plug 'rstacruz/sparkup'
Plug 'junegunn/limelight.vim'
Plug 'mhinz/vim-startify'
Plug 'ron89/thesaurus_query.vim'
Plug 'justinmk/vim-sneak'
Plug '~/git/elysian.vim'
Plug 'lsrdg/tatoeba-karini.nvim'
Plug '~/git/vibusen.vim'
Plug '~/.config/nvim/plugged/markdumb.vim'
Plug '~/prog/potion.vim'
let g:potion_command = '~/builds/potion/bin/potion'
Plug '~/git/beback.vim'
Plug '~/git/dumbnote.vim'
let g:dumbnoteDefaultCollection = $HOME . '/dumbnote-collection/'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/vim-pdf'
Plug 'tweekmonster/startuptime.vim'
Plug 'ap/vim-css-color'
Plug 'junegunn/vader.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'tpope/vim-liquid'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'mitsuhiko/vim-jinja'
call plug#end()
" }}}


" ======================================
    " TESTING ZONE ------------------------{{{

" Potion command
let g:potion_command = "~/builds/potion/bin/potion"
    " folding


"------------------
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
" -------------
"  }}}
"
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

augroup sparkup_types
    autocmd!
    autocmd FileType yml,php,markdown runtime! ftplugin/html/sparkup.vim
augroup END

" }}}
" =======================================
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
set inccommand=split

" Quickfix
set efm=%m


" statusline
set statusline=%f
set statusline+=%=  
set statusline+=%m  
set statusline+=%-l/%L\ 
set statusline+=(%c\ %03p%%)
"%8*\ %=\ 


" Colors ---------------------{{{
set termguicolors
set t_Co=256
colorscheme elysian-dark
set background=dark
hi SpellBad ctermbg=52 ctermfg=194

if has('nvim')
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=re guifg=white ctermbg=1 ctermfg=15
endif

" }}}
" }}}

" Mappings -------------------------"{{{

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nnoremap <cr> i<cr><esc>

inoremap {<cr> {<cr>}<esc>O

" Buffers/Splits/Tabs/Windows ---------------------{{{

nnoremap <leader>f :find *
nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>

"Netrw in a vertical split
nnoremap <leader>nv :20Lexplore<CR>
" Buffers - flow 
nnoremap <space>w :bprevious<cr>:confirm bd#<cr>
nnoremap <space>e :bn<CR>
nnoremap <space>r :bp<CR>
nnoremap <space>i :buffers<CR>:buffer<space>

" Splits - flow
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l

nnoremap <C-w>v <C-w>v<C-w>w
nnoremap <C-w>s <C-w>s<C-w>w

" init.vim in a vertical split
nnoremap m, :vsplit $MYVIMRC<CR>
" source init.vim
nnoremap m. :source $MYVIMRC<CR>
" write
nnoremap <space>s :write<CR>
"------------------ Relative and absolute line numbers
noremap <leader>n :set number! <CR>
noremap <leader>nn :set relativenumber! <CR>
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" Search for the next identifier in Vim help files
nnoremap ]i :call search('\v\\|.{-}\\|')<CR>

" Netrw's configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1

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

" Functions ..................{{{
function! JekyllServer()
    execute "terminal jekyll_server"
endfunction

function! Elysian(background)
   if a:background == "light" 
     colorscheme elysian-light
     set background=light
   elseif a:background == "dark"
     colorscheme elysian-dark
     set background=dark
   else
     echom "Invalid input."
   endif
endfunction

" }}}

" Commands ...................{{{
command! -bang -nargs=0 JekyllServer call JekyllServer()
command! -bang -nargs=1 Elysian call Elysian(<f-args>)
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
