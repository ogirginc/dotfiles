return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        mappings = {
          -- Insert mode
          i = {
            ["<c-t>"] = actions.select_tab, -- Open selection in new tab
          },

          -- Normal mode
          n = {
            ["<c-t>"] = actions.select_tab, -- Open selection in new tab
          },
        },
      },
    }
  end,
}
