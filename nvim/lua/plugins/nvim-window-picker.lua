return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  version = "2.*",
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",

      -- Whether to show 'Pick window:' prompt
      show_prompt = false,

      filter_rules = {
        include_current_win = false,

        -- When there is only one window available to pick from, DO NOT use
        -- that window without prompting the user to select
        autoselect_one = false,

        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify" },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
    })
  end,
}
