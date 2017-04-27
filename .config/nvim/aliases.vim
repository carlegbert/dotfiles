""" aliases and mappings

" common ex mode typos
cnoreabbrev W w
cnoreabbrev Wall wall
cnoreabbrev W! w!
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Q! q!
cnoreabbrev Qall! qall

" space is leader
let mapleader = "\<Space>"

" space-space-w to save
nnoremap <leader><leader>w :w<CR>

" space-space-][ to cycle through buffers
nnoremap <leader><leader>] :bnext<CR>
nnoremap <leader><leader>[ :bprev<CR>

" space-w instead of ctrl-w
nnoremap <leader>w <C-w>

""" motion
nnoremap H ^
nnoremap L $
