local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better terminal navigation
local term_opts = { silent = true }
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- If g[o]t[ab], why no g[o]b[ack]
keymap("n", "gb", "gT", opts)

-- Move to the split
keymap("n", "mh", "<C-w>h", opts)
keymap("n", "mj", "<C-w>j", opts)
keymap("n", "mk", "<C-w>k", opts)
keymap("n", "ml", "<C-w>l", opts)

-- Move tabs easier
keymap("n", "<leader>-", ":tabm-<CR>", opts)
keymap("n", "<leader>+", ":tabm+<CR>", opts)

-- Yank just filename
keymap("n", "<leader>yfn", ":let @+ = expand(\"%:t\")<CR>", opts)

-- Yank relative path
keymap("n", "<leader>yrp", ":let @+ = expand(\"%\")<CR>", opts)

-- Yank full path
keymap("n", "<leader>yfp", ":let @+ = expand(\"%:p\")<CR>", opts)

-- Trim blanks
keymap("n", "<leader>tb", ":%s/\\s\\+$//<CR>", opts)
keymap("n", "<leader>tws", ":%s/\\s\\+$//<CR>", opts)
