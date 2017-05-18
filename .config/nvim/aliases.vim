""" aliases and mappings

" ; instead of :
nnoremap ; :

" jk = esc in insert mode
inoremap jk <Esc>

" space is leader
let mapleader = "\<Space>"

" space-space-w to save
nnoremap <leader><leader>w :w<CR>

" space-space-][ to cycle through buffers
nnoremap <leader><leader>] :bnext<CR>
nnoremap <leader><leader>[ :bprev<CR>
" space-space-del to delete buffer
nnoremap <leader><leader><Del> :bdelete<CR>
" space-b to list buffers and prompt for numbered selection
nnoremap <leader>b :ls<CR>:b<space>

" space-w instead of ctrl-w
nnoremap <leader>w <C-w>

""" space-# to toggle number/relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <leader># :call NumberToggle()<CR>
