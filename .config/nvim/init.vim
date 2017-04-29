" neovim configuration

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-vinegar'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'zchee/deoplete-jedi'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elzr/vim-json'

Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " TODO: learn how to use this

call plug#end()

source $HOME/.config/nvim/pluginsettings.vim
source $HOME/.config/nvim/syntasticsettings.vim
source $HOME/.config/nvim/aliases.vim

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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"""" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2

"""" search
set hlsearch
set noincsearch
nnoremap ;; :nohlsearch<CR>

"""" misc
set wildmenu
set showcmd
set lazyredraw
