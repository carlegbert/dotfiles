" neovim-specific configuration

source $HOME/.vimrc
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/pluginsettings.vim
source $HOME/.config/nvim/syntasticsettings.vim

set list

""" colors
colorscheme gruvbox
let g:airline_theme="gruvbox"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" for some reason normal vim hates this mapping???
nnoremap <silent><Esc> :nohlsearch<CR>
