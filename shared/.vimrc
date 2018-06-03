filetype plugin indent on
syntax enable
set background=dark

set omnifunc=syntaxcomplete#Complete
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

if (!empty(glob("$HOME/.vim/autoload/plug.vim")))
    source $HOME/.vim/plugins.vim
    source $HOME/.vim/pluginsettings.vim
    source $HOME/.vim/syntasticsettings.vim
    colorscheme gruvbox
    let g:airline_theme="gruvbox"
endif

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
if (has('autocmd'))
    let &t_SI = "\033[5 q"
    let &t_SR = "\033[1 q"
    let &t_EI = "\033[1 q"
endif

autocmd Filetype html setlocal  sts=2 sw=2
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

""" search
set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase

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

" hide search results with space-n
nnoremap <leader>s /
nnoremap <leader>r :%s/
nnoremap <silent><leader>n :nohlsearch<Enter>

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
