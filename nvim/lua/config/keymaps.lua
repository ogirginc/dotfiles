-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- BUFFERS
vim.keymap.set("n", "<leader>by", function()
  vim.fn.setreg(vim.v.register, vim.fn.expand("%:."))
end, { desc = "Yank buffer's path to clipboard" })
