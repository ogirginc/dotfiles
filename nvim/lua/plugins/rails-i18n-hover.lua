return {
  "moguls753/rails-i18n-hover.nvim",
  config = function()
    require("rails-i18n-hover").setup()
  end,
  dependencies = {
    "nvim-neotest/nvim-nio",
  },
}
