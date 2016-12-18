" pathogen - https://github.com/tpope/vim-pathogen
" NERDTree - https://github.com/scrooloose/nerdtree
" NERDCommenter - https://github.com/scrooloose/nerdcommenter
" YouCompleteMe - https://github.com/Valloric/YouCompleteMe
" autopairs - https://github.com/jiangmiao/auto-pairs
" surround.vim - https://github.com/tpope/vim-surround
" vim-flake8 - https://github.com/nvie/vim-flake8
" syntastic - https://github.com/vim-syntastic/syntastic.git
" lots of colors - https://github.com/flazz/vim-colorschemes
" jay colorscheme - https://github.com/josuegaleas/jay.git

execute pathogen#infect()

syntax enable 
filetype plugin indent on

"""" colors
" colorscheme jay
" colorscheme jellybeans
colorscheme landscape

"""" visibility stuff
set number
set cursorline
" set showmatch
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

"""" cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"""" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

"""" search
set hlsearch 
nnoremap "" :nohlsearch<CR>

"""" misc
set wildmenu " autocompletion in :cl mode
set showcmd

""" ctrl+n toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
""" close NERDTree if it's last tab open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1 " lol
let g:NERDDefaultAlign = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
