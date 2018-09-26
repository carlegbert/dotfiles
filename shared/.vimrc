filetype plugin indent on
syntax enable
set t_Co=256
set background=dark

colorscheme murphy

set omnifunc=syntaxcomplete#Complete
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

autocmd Filetype css setlocal sts=2 sw=2
autocmd Filetype json setlocal sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2

""" indentation settings
set smartindent

""" fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

""" search/replace
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
set gdefault

""" split settings
set splitright
set splitbelow

""" command-mode settings
set wildmenu
set showcmd

""" misc
set signcolumn=yes
set fillchars+=vert:\█
set number
set cursorline
set title
set lazyredraw
set hidden
set mouse=a
set scrolloff=10
set sidescrolloff=10
set nowrap
set noswapfile
set showmatch

""" aliases and mappings

" catch common typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wall wall
cnoreabbrev Qall qall
cnoreabbrev Qall! qall
cnoreabbrev Wqall wqall

" space is leader
let mapleader = "\<Space>"

nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>q :q<CR>

" space-][ to cycle through buffers
nnoremap <silent><leader>] :bnext<CR>
nnoremap <silent><leader>[ :bprev<CR>
" space-del to delete buffer
nnoremap <silent><leader>d :bdelete<CR>
" space-b to list buffers and prompt for numbered selection
nnoremap <leader><silent>b :ls<CR>:b<space>

" space-w instead of ctrl-w
nnoremap <leader>w <C-w>

" tab -> % in normal/visual mode
nnoremap <tab> %
vnoremap <tab> %

" H and L -> ^ and $
nnoremap H ^
nnoremap L $

" shift+tab to unindent
inoremap <S-tab> <C-d>

" jk to leave insert
inoremap jk <Esc>

" leader+o leader+O to insert newline in normal mode
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>j

" find/replace with leader+r
nnoremap <leader>r :%s/

" hide search results with space-n
nnoremap <silent><leader>n :nohlsearch<Enter>

" leader+s to save
nnoremap <leader>s  :w<CR>

" set some marks when moving around document
nnoremap / ml/
nnoremap ? ml?
nnoremap gg mlgg
nnoremap G mlG

" space-# to toggle number/relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <silent><leader># :call NumberToggle()<CR>

" .ract files use mustache syntax highlighting
autocmd BufNewFile,BufRead *.ract set filetype=mustache
