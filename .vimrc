" pathogen - https://github.com/tpope/vim-pathogen
" lots of colors - https://github.com/flazz/vim-colorschemes
" jay colorscheme - https://github.com/josuegaleas/jay.git
" smarties colorscheme - https://github.com/justb3a/vim-smarties

execute pathogen#infect()

syntax enable 
filetype plugin indent on

"""" colors
set background=dark
" colorscheme badwolf 
" let g:badwolf_darkgutter=1
" let g:badwolf_tabline=2
colorscheme jay
" colorscheme smarties

"""" visibility stuff
set number
set cursorline
set showmatch

"""" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"""" search
set hlsearch 
nnoremap "" :nohlsearch<CR>

"""" misc
set wildmenu " autocompletion in :cl mode
set showcmd

""" python stuff
au FileType py set autoindent
au FileTYpe py set smartindent

""" ctrl+n toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
""" close NERDTree if it's last tab open 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
