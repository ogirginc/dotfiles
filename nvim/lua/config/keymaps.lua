-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TABS
vim.keymap.set("n", "<leader><tab>-", ":tabm-<CR>", { desc = "Move tab to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>+", ":tabm+<CR>", { desc = "Move tab to the right", noremap = true, silent = true })

-- BUFFERS
vim.keymap.set(
  "n",
  "<leader>bx",
  ":%bd|e#<CR>",
  { desc = "Delete Buffers except current", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>by", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:."))
end, { desc = "Yank Buffer's path to clipboard" })

vim.keymap.set("n", "<leader>bcw", function()
  vim.cmd([[%s/\s\+$//e]])
  vim.cmd("noh")
end, { desc = "Remove Buffer trailing whitespace" })
