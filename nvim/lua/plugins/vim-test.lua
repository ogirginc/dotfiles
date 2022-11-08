local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>tn", ":TestNearest<CR>", opts)
keymap("n", "<leader>tsn", ":TestNearest -strategy=neovim<CR>", opts)

keymap("n", "<leader>tf", ":TestFile<CR>", opts)
keymap("n", "<leader>tsf", ":TestFile -strategy=neovim<CR>", opts)

keymap("n", "<leader>tl", ":TestLast<CR>", opts)
keymap("n", "<leader>tsl", ":TestLast -strategy=neovim<CR>", opts)

keymap("n", "<leader>tv", ":TestVisit<CR>", opts)
keymap("n", "<leader>tsv", ":TestVisit -strategy=neovim<CR>", opts)

-- Some strategies clear the screen before executing the test command,
-- but you can disable this:
vim.cmd([[
let g:test#preserve_screen = 1
]])

-- On Neovim the basic and neovim strategies will run test commands using
-- Neovim's terminal, and leave you in insert mode, so that you can just press
-- Enter to close the terminal session and go back to editing. If you want to
-- scroll through the test command output, you'll have to first switch to
-- normal mode. The built-in mapping for exiting terminal insert mode is CTRL-\
-- CTRL-n, which is difficult to press, so I recommend mapping it to CTRL-o:
vim.cmd([[
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
]])
