-- Prevent auto CtrlSF closing.
vim.g.ctrlsf_auto_close = 0

-- Search project root when no explicit path is given.
vim.g.ctrlsf_default_root = "project"

-- rg's location.
vim.g.ctrlsf_ackprg = "/opt/homebrew/bin/rg"

-- " let g:ctrlsf_debug_mode = 1

-- Runs :CtrlSF
vim.cmd([[nmap <leader>f <Plug>CtrlSFPrompt<CR>]])

-- Runs :CtrlSF [pattern]
vim.cmd([[nmap <leader>F <Plug>CtrlSFPrompt]])
