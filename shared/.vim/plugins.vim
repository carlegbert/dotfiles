""" load plugins with vim-plug

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'nvie/vim-flake8'

Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " TODO: learn how to use this

call plug#end()
