return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_b = {}, -- Don't display default branch
        lualine_z = {}, -- Don't display default date
      },
    },
  },
}
