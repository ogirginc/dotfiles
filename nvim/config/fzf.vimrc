nnoremap <C-f> <Nop>

nnoremap <C-f>f :Files<CR>

nnoremap <C-f>g :GFiles<CR>
nnoremap <C-f>s :GitFiles?<CR>

nnoremap <C-f>c :Commits!<CR>
nnoremap <C-f>h :BCommits!<CR>

nnoremap <C-f>b :Buffers<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <C-f>r :Rg!<CR>

" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit' }

" let g:fzf_layout = { 'down': '~70%' }

" command! -bang ParasutFile
"   \ call fzf#vim#files('~/Developer/parasut', fzf#vim#with_preview(), <bang>0)

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" command! -bang -nargs=? -complete=dir GFiles
"   \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(),
"   \   <bang>0)

" " Enable per-command history.
" " CTRL-N and CTRL-P will be automatically bound to next-history and
" " previous-history instead of down and up. If you don't like the change,
" " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'
