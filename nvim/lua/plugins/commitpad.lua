return {
  "Sengoku11/commitpad.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = { "CommitPad" },
  keys = {
    { "<leader>gc", "<cmd>CommitPad<cr>", desc = "CommitPad" },
  },
  config = function()
    require("commitpad").setup()
  end,
}
