return {
  "vim-test/vim-test",
  keys = {
    { "<leader>txn", ":TestNearest<CR>", desc = "Test nearest (Vim Test)" },
    { "<leader>txf", ":TestFile<CR>", desc = "Test file (Vim Test)" },
    { "<leader>txl", ":TestLast<CR>", desc = "Test last (Vim Test)" },
  },
}
