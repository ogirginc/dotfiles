local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-f>", "<Nop>", opts)

keymap("n", "<C-f>f", ":Files<CR>", opts)

keymap("n", "<C-f>g", ":GFiles<CR>", opts)
keymap("n", "<C-f>s", ":GitFiles?<CR>", opts)

keymap("n", "<C-f>c", ":Commits!<CR>", opts)
keymap("n", "<C-f>h", ":BCommits!<CR>", opts)

keymap("n", "C-f>b", ":Buffers<CR>", opts)
keymap("n", "<leader>b", ":Buffers<CR>", opts)

keymap("n", "<C-f>r", ":Rg!<CR>", opts)

vim.cmd([[
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
]])

-- " Enable per-command history.
-- " CTRL-N and CTRL-P will be automatically bound to next-history and
-- " previous-history instead of down and up. If you don't like the change,
-- " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
vim.g.fzf_history_dir = "~/.local/share/fzf-history"
