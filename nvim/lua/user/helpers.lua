vim.cmd([[
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
]])

vim.cmd([[
function! StringToJson()
  echom "StringToJson is called"
  normal ggx
  normal G$x
  exec ':%s/\\"/"/g'
  normal gqaj
  set syntax=json
endfunction
]])

vim.cmd([[
function! FormatXml()
  set filetype=xml syntax=xml | %!xmllint --format -
endfunction
]])

vim.cmd([[
function! PrettyXml()
  set filetype=xml syntax=xml | %!xmllint --format -
endfunction
]])


vim.cmd([[
" Use leader + rn to rename
nnoremap <leader>rnf :call RenameFile()<CR>
]])

vim.cmd([[
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
]])
