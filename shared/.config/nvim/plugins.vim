call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'd': './install --all' }
Plug 'mileszs/ack.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " TODO: learn how to use this

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdcommenter'

" rainbow parens for lisp
Plug 'amdt/vim-niji'

Plug 'sjl/tslime.vim'

" completion/syntax/linting
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

call plug#end()

""" ack.vim
nnoremap <C-F> :Ack  *<Left><Left>


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

""" ALE settings
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier']}
let g:ale_echo_msg_format = '[%linter%]  %s'
nmap <silent><C-k> <Plug>(ale_previous_wrap)
nmap <silent><C-j> <Plug>(ale_next_wrap)

""" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1 " lol
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
nnoremap <C-/> NERDComToggleComment
vnoremap <C-/> NERDComToggleComment

""" vim-gitgutter settings
nnoremap <F9> :GitGutterToggle<CR>
nnoremap <C-F9> :GitGutterLineHighlightsToggle<CR>

""" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
set laststatus=2
let g:airline_powerline_fonts=1

""" deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.html,*.yaml,*.json,*.css execute ':PrettierAsync'

""" black
autocmd BufWritePre *.py execute ':Black'

""" closetag
let g:closetag_filenames = '*.html,*.ract,*.jsx,*.tsx'

""" tslime
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'
let g:tslime_ensure_trailing_newlines = 1
