" +----------------------------------------------------------+
" | egbertcarl@gmail.com                                     |
" | see also: .config/nvim/init.vim (which sources this file |
" | and several others)                                      |
" +----------------------------------------------------------+

syntax enable
filetype plugin indent on


colorscheme desert
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
if (!has('nvim'))
     let &t_SI = "\<Esc>[6 q"
     let &t_SR = "\<Esc>[4 q"
     let &t_EI = "\<Esc>[2 q"
endif

autocmd Filetype html setlocal  sts=2 sw=2
autocmd Filetype javascript setlocal  sts=2 sw=2
autocmd Filetype css setlocal sts=2 sw=2
autocmd Filetype json setlocal sts=2 sw=2
autocmd Filetype sh setlocal ts=2 sts=2 sw=2

""" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

""" indentation settings
set smartindent

""" fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

""" search
set hlsearch 
set incsearch
set wrapscan
set ignorecase
set smartcase
nnoremap <silent><Esc> :nohlsearch<CR>

""" split settings
set splitright
set splitbelow

""" command-mode settings
set wildmenu
set showcmd

""" misc
set number
set cursorline
set title
set lazyredraw
set hidden
set mouse=a
set scrolloff=10
set nowrap
set noswapfile

" +----------------------+
" | aliases and mappings |
" +----------------------+

" catch common typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wall wall
cnoreabbrev Qall qall
cnoreabbrev Qall! qall
cnoreabbrev Wqall wqall

" jk = esc in insert mode
inoremap jk <Esc>

" space is leader
let mapleader = "\<Space>"

nnoremap <silent><leader><leader>w :w<CR>
nnoremap <silent><leader><leader>q :q<CR>

" space-space-][ to cycle through buffers
nnoremap <silent><leader><leader>] :bnext<CR>
nnoremap <silent><leader><leader>[ :bprev<CR>
" space-space-del to delete buffer
nnoremap <silent><leader><leader>d :bdelete<CR>
" space-b to list buffers and prompt for numbered selection
nnoremap <silent><leader>b :ls<CR>:b<space>

" space-w instead of ctrl-w
nnoremap <leader>w <C-w>

" tab -> % in normal/visual mode
nnoremap <tab> %
vnoremap <tab> %

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
