-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- You don't need this as you can use `<Leader><Tab>[` or `<Leader><Tab>]` instead!
vim.keymap.set("n", "gb", "gT", { desc = "Go back one tab", noremap = true, silent = true })
