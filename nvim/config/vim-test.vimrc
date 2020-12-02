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

" On Neovim the basic and neovim strategies will run test commands using
" Neovim's terminal, and leave you in insert mode, so that you can just press
" Enter to close the terminal session and go back to editing. If you want to
" scroll through the test command output, you'll have to first switch to
" normal mode. The built-in mapping for exiting terminal insert mode is CTRL-\
" CTRL-n, which is difficult to press, so I recommend mapping it to CTRL-o:
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
