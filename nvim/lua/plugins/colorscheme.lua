return {
  -- Add colorscheme plugin
  { "ishan9299/nvim-solarized-lua" },

  -- Configure LazyVim to load preferred colorscheme
  {
    "LazyVim/LazyVim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      colorscheme = "solarized",
    },
  }
}
