-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- You don't need this as you can use `<Leader><Tab>[` or `<Leader><Tab>]` instead!
vim.keymap.set("n", "gb", "gT", { desc = "Go back one tab", noremap = true, silent = true })

vim.keymap.set("n", "<leader><tab>-", ":tabm-<CR>", { desc = "Move tab to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>+", ":tabm+<CR>", { desc = "Move tab to the right", noremap = true, silent = true })

-- BUFFERS
vim.keymap.set(
  "n",
  "<leader>bx",
  ":%bd|e#<CR>",
  { desc = "Delete Buffers Except Current", noremap = true, silent = true }
)
---------------------------------------------------------------------------------
-- PLUGINGS
---------------------------------------------------------------------------------

-- VIM TEST
vim.keymap.set("n", "<leader>ttn", ":TestNearest<CR>", { desc = "Test nearest", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ttf", ":TestFile<CR>", { desc = "Test file", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ttl", ":TestLast<CR>", { desc = "Test last", noremap = true, silent = true })
