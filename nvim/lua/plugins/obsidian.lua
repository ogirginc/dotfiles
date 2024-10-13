return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "main",
        path = "/Users/ogirginc/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main",
      },
    },

    daily_notes = {
      folder = "Daily",
      date_format = "%Y-%m-%d",
      alias_format = nil,
      default_tags = {},
      template = nil,
    },

    -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
    disable_frontmatter = true,

    -- Customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local file_title = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        file_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add os's date time to the suffix.
        file_title = tostring(os.date("%Y%m%d%H%M"))
      end
      return file_title
    end,
  },
}
