""" load plugins with vim-plug

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-vinegar'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-syntastic/syntastic'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " TODO: learn how to use this

call plug#end()
