syntax enable 
filetype plugin indent on

set number

colorscheme desert
set cursorline
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

"""" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"""" fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"""" search
set hlsearch 
set incsearch
nnoremap <Esc> :nohlsearch<CR>

""" split settings
set splitright
set splitbelow

"""" misc
set wildmenu " autocompletion in :cl mode
set showcmd
set lazyredraw
set hidden
set mouse=a

"**************************"
"** aliases and mappings **"
"**************************"

" ; instead of :
nnoremap ; :

" jk = esc in insert mode
inoremap jk <Esc>

" space is leader
let mapleader = "\<Space>"

" space-space-w to save
nnoremap <leader><leader>w :w<CR>

" space-space-][ to cycle through buffers
nnoremap <leader><leader>] :bnext<CR>
nnoremap <leader><leader>[ :bprev<CR>
" space-space-del to delete buffer
nnoremap <leader><leader><Del> :bdelete<CR>
" space-b to list buffers and prompt for numbered selection
nnoremap <leader>b :ls<CR>:b<space>

" space-w instead of ctrl-w
nnoremap <leader>w <C-w>

""" space-# to toggle number/relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <leader># :call NumberToggle()<CR>
