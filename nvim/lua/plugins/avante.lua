return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    mappings = {
      -- ask = "<leader>aca",
      -- edit = "<leader>ace",
      -- refresh = "<leader>acr",
      --   --- @class AvanteConflictMappings
      --   diff = {
      --     ours = "<leader>acco",
      --     theirs = "<leader>acct",
      --     none = "<leader>acc0",
      --     both = "<leader>accb",
      --     next = "<leader>ac]x",
      --     prev = "<leader>ac[x",
      --   },
      --   jump = {
      --     next = "<leader>ac]]",
      --     prev = "<leader>ac[[",
      --   },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
