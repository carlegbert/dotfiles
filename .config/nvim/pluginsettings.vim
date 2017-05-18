""" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1 " lol
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""" vim-gitgutter settings
nnoremap <F9> :GitGutterToggle<CR>
nnoremap <C-F9> :GitGutterLineHighlightsToggle<CR>

""" airline settings
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_powerline_fonts=1

""" deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""" autopair settings (default, reproduced for reference)
" <CR>  " Insert new indented line after return if cursor in blank brackets or quotes.
" <BS>  " Delete brackets in pair
" <M-p> " Toggle Autopairs (g:AutoPairsShortcutToggle)
" <M-e> " Fast Wrap (g:AutoPairsShortcutFastWrap)
" <M-n> " Jump to next closed pair (g:AutoPairsShortcutJump)
" <M-b> " BackInsert (g:AutoPairsShortcutBackInsert)
