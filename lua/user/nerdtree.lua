local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- nnoremap <leader>n :NERDTreeToggle<CR>
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", opts)
-- nnoremap <leader>w <C-w>w
keymap("n", "<leader>w", "<C-w>w", opts)
-- nnoremap <leader>fn :NERDTreeFind<CR>
keymap("n", "<leader>fn", ":NERDTreeFind<CR>", opts)

-- Enable line numbers
vim.cmd([[
let NERDTreeShowLineNumbers=1
]])

-- Use relative line numbers
vim.cmd([[
autocmd FileType nerdtree setlocal relativenumber
]])
