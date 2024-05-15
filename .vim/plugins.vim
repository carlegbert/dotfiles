call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-vinegar'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

" rainbow parens for lisp
Plug 'amdt/vim-niji'

Plug 'lervag/vimtex'
Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

call plug#end()

""" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1 " lol
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" this is how to map ctrl + / in vim
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

""" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
set laststatus=2
let g:airline_powerline_fonts=1

""" closetag
let g:closetag_filenames = '*.html,*.ract,*.jsx,*.tsx'

""" vimtex
let g:polyglot_disabled = ['latex']
let g:tex_flavor='latex'
let g:vimtex_view_method='okular'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
