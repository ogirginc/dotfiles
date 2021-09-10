lua << EOF
  vim.g.mapleader = " " -- Use spacebar as leader.
EOF

if has('mouse')
  set mouse=a
end
set clipboard=unnamed

" In visual mode select the lines, then `zf` to make them foldable.
" Toggle with `za`, close all with `zm`, open all with `zR`
set foldmethod=manual

set undofile
set undodir=~/.config/nvim/.undo//
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swp//

set showcmd           " Show partial commands on the screen as it is being typed.
set incsearch         " Highlight matches as you type.
set relativenumber
set nobackup          " Get rid of annoying ~file.

set ignorecase " All your searches will be case insensitive.
set smartcase  " Search will be case sensitive if it contains an uppercase letter.

set colorcolumn=81,101

set expandtab    " Insert space characters whenever the tab key is pressed.
set tabstop=2		 " Number of spaces will be inserted when the tab key is pressed.
set shiftwidth=2 " Number of space characters inserted for indentation

" If g[o]t[ab], why no g[o]b[ack]
nnoremap gb gT

" Move to the split
nnoremap mh <C-w>h
nnoremap mj <C-w>j
nnoremap mk <C-w>k
nnoremap ml <C-w>l

" reselect pasted text – https://vimtricks.com/p/reselect-pasted-text/
nnoremap gp `[v`]

" Move tabs easier
nnoremap <leader>- :tabm-<CR>
nnoremap <leader>+ :tabm+<CR>

" Yank just filename
nnoremap <leader>yfn :let @+ = expand("%:t")<CR>
" Yank relative path
nnoremap <leader>yrp :let @+ = expand("%")<CR>
" Yank full path
nnoremap <leader>yfp :let @+ = expand("%:p")<CR>

" Count last searched item
nnoremap <leader>cnt :%s//&/gn<CR>

" Trim blanks
nnoremap <leader>tb :%s/\s\+$//<CR>
nnoremap <leader>tws :%s/\s\+$//<CR>

" Automatically equalize splits when Vim is resized
autocmd VimResized * wincmd =

" Prevent adding newline character to the end of the last line for hbs files.
" https://stackoverflow.com/a/39627416/4565485
autocmd FileType html.handlebars setlocal noendofline nofixendofline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! WriteAllAndQuitAll()
  exec ':wa'
  exec ':qa'
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! StringToJson()
  echom "StringToJson is called"
  normal ggx
  normal G$x
  exec ':%s/\\"/"/g'
  normal gqaj
  set syntax=json
endfunction

function! FormatXml()
  set filetype=xml syntax=xml | %!xmllint --format -
endfunction

function! PrettyXml()
  set filetype=xml syntax=xml | %!xmllint --format -
endfunction

" Use leader + rn to rename
nnoremap <leader>rn :call RenameFile()<CR>

" Save all files and quit
" cnoremap saq<CR> :call WriteAllAndQuitAll()<CR>
nnoremap <leader>saq :call WriteAllAndQuitAll()<CR>
