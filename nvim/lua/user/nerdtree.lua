local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>n", ":NERDTreeToggle<CR>", opts)
keymap("n", "<leader>w", "<C-w>w", opts)
keymap("n", "<leader>fn", ":NERDTreeFind<CR>", opts)

-- Enable line numbers
vim.cmd([[
let NERDTreeShowLineNumbers=1
]])

-- Use relative line numbers
vim.cmd([[
autocmd FileType nerdtree setlocal relativenumber
]])
