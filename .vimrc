" minimal vim settings for use over SSH or other machines

syntax enable 
filetype plugin indent on

set number
colorscheme desert
set cursorline
hi CursorLine cterm=NONE ctermbg=236
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"""" tab settings
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype html setlocal  sts=2 sw=2
autocmd Filetype javascript setlocal  sts=2 sw=2
autocmd Filetype css setlocal sts=2 sw=2
autocmd Filetype json setlocal sts=2 sw=2

"""" search
set hlsearch 
nnoremap ;; :nohlsearch<CR>

"""" misc
set wildmenu " autocompletion in :cl mode
set showcmd

"""" load aliases
source $HOME/.vim_aliases
