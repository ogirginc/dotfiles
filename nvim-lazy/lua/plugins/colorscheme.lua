return {
  -- Add colorscheme plugin
  { "ishan9299/nvim-solarized-lua" },

  -- Configure LazyVim to load preferred colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  }
}
