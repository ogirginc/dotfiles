-- turn this to :Vscode
vim.api.nvim_set_keymap(
  'n',
  '<leader>code',
  '<cmd>lua require("export-to-vscode").launch()<cr>',
  { noremap = true, silent = true }
)
