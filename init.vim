" neovim configuration

" vim-plug
" To install plugins:
" :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elzr/vim-json'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

source $HOME/.config/nvim/pluginsettings.vimrc
source $HOME/.config/nvim/syntasticsettings.vimrc

syntax enable 
filetype plugin indent on

"""" colors
set background=dark
colorscheme gruvbox
let g:airline_theme="gruvbox"

"""" visibility stuff
set number
set cursorline
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

"""" tab settings
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype html setlocal sts=2 sw=2
autocmd Filetype javascript setlocal sts=2 sw=2
autocmd Filetype css setlocal sts=2 sw=2

"""" search
set hlsearch 
nnoremap ;; :nohlsearch<CR>

"""" misc
set wildmenu " autocompletion in :cl mode
set showcmd
