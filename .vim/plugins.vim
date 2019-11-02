call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'd': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'

Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive' " TODO: learn how to use this
Plug 'tpope/vim-rhubarb'

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

" rainbow parens for lisp
Plug 'amdt/vim-niji'

Plug 'sjl/tslime.vim'

" async completion/syntax/linting
if (has('nvim'))
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'shougo/neco-vim'
    Plug 'shougo/neco-syntax'
    Plug 'sheerun/vim-polyglot'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'nvie/vim-flake8'
    Plug 'ambv/black'
    Plug 'prettier/vim-prettier'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif

if (has('nvim-0.4'))
    Plug 'rhysd/git-messenger.vim'
endif

" Plug 'janko-m/vim-test'

call plug#end()

""" ack.vim
nnoremap <C-F> :Ack  *<Left><Left>
nnoremap <C-D> :Ack <cword> *<CR>

""" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = '!'
nnoremap <leader>gl :SignifyToggleHighlight<CR>
nnoremap <leader>gd :SignifyDiff<CR>

""" FZF
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
nnoremap <C-p> :FZF<CR>
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

""" deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" closetag
let g:closetag_filenames = '*.html,*.ract,*.jsx,*.tsx'

""" tslime
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'
let g:tslime_ensure_trailing_newlines = 1

" async plugins
if (has('nvim'))
    """ ALE settings
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = '⚠️'
    let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier']}
    let g:ale_echo_msg_format = '[%linter%]  %s'
    nmap <silent><C-k> <Plug>(ale_previous_wrap)
    nmap <silent><C-j> <Plug>(ale_next_wrap)

    """ prettier
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.html,*.yaml,*.json,*.css execute ':PrettierAsync'

    """ black
    let g:black_virtualenv = '~/.local/share/virtualenvs/black'
    autocmd BufWritePre *.py execute ':Black'
endif
