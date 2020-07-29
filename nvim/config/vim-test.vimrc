nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tsn :TestNearest -strategy=neovim<CR>

nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>tsf :TestFile -strategy=neovim<CR>

nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tsl :TestLast -strategy=neovim<CR>

nnoremap <silent> <leader>tv :TestVisit<CR>
nnoremap <silent> <leader>tsv :TestVisit -strategy=neovim<CR>

" Some strategies clear the screen before executing the test command,
" but you can disable this:
let g:test#preserve_screen = 1

tmap <C-o> <C-\><C-n>
