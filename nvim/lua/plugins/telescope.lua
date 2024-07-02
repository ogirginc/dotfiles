return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
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
