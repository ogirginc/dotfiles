-- Import nvim-cmp plugin safely
local neo_tree_status, neo_tree = pcall(require, "neo-tree")
if not neo_tree_status then
  return
end

neo_tree.setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },

  source_selector = {
    -- winbar = true, -- toggle to show selector on winbar
    tab_labels = { -- falls back to source_name if nil
      filesystem = "  Files ",
      buffers =    "  Buffers ",
      git_status = "  Git ",
      diagnostics = " 裂Diagnostics ",
    },
    content_layout = "center", -- center tab label
  },

  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd [[ setlocal relativenumber ]] -- Display relative numbers
      end,
    }
  },

  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "", -- default is 
        renamed   = "",
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      },
      align = "right",
    },
  },

  window = {
    mappings = {
      ["o"] = "open",
      ["v"] = "vsplit_with_window_picker",
      ["s"] = "split_with_window_picker",
      ["w"] = "",
      ["m"] = "",
      ["mv"] = "move",
      ["z"] = "",
      ["Z"] = "close_all_nodes",
    },
  },

  filesystem = {
    window = {
      mappings = {
        ["[c"] = "prev_git_modified",
        ["]c"] = "next_git_modified",
      }
    },
  },

  git_status = {
    window = {
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "",
      },
    },
  },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>e", ":Neotree action=show source=filesystem position=left toggle=true<cr>", opts)
keymap("n", "<leader>E", ":Neotree reveal<CR>", opts)
