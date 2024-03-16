return {
  -- -- Add colorscheme plugin
  -- { "ishan9299/nvim-solarized-lua" },
  { "craftzdog/solarized-osaka.nvim" },

  -- Configure LazyVim to load preferred colorscheme
  {
    -- "ishan9299/nvim-solarized-lua",
    "LazyVim/LazyVim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      -- colorscheme = "solarized",
      colorscheme = "solarized-osaka",
    },
  },
}
