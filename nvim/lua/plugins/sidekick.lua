return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          wo = {
            -- Use the active colorscheme's defaults for the CLI window.
            winhighlight = "Normal:Normal,NormalNC:Normal,EndOfBuffer:EndOfBuffer,SignColumn:SignColumn",
          },
        },
      },
    },
  },
}
