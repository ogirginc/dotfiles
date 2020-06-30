" Prevent auto CtrlSF closing
let g:ctrlsf_auto_close = 0

" Search project root when no explicit path is given
let g:ctrlsf_default_root = 'project'

let g:ctrlsf_ackprg = '/usr/local/bin/rg'
" let g:ctrlsf_debug_mode = 1

" Runs :CtrlSF
nmap <leader>f <Plug>CtrlSFPrompt<CR>

" Runs :CtrlSF [pattern]
nmap <leader>F <Plug>CtrlSFPrompt
