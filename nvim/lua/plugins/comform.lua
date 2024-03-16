return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },

      -- ruby = { "rubocop" },
      eruby = { "htmlbeautifier" },

      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },

      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    -- format_on_save = function(bufnr)
    --   if vim.bo[bufnr].filetype == "ruby" then
    --     return
    --   end
    --
    --   return { timeout_ms = 1000, lsp_fallback = false }
    -- end,
    -- format_after_save = function(bufnr)
    --   if vim.bo[bufnr].filetype ~= "ruby" then
    --     return
    --   end
    --
    --   return { lsp_fallback = false }
    -- end,
    -- formatters = {
    --   rubocop = {
    --     inherit = false,
    --     command = "bundle",
    --     args = {
    --       "exec",
    --       "rubocop",
    --       "-f",
    --       "quiet",
    --       "--fix-layout",
    --       "--stderr",
    --       "--stdin",
    --       "$FILENAME",
    --     },
    --     cwd = require("conform.util").root_file({ ".rubocop.yml", ".rubocop-gdk.yml" }),
    --     require_cwd = true,
    --     exit_codes = { 0, 1 },
    --   },
    -- },
    -- formatters = {
    --   rubocop = {
    --     inherit = false,
    --     command = "rubocop",
    --     args = {
    --       "-a", -- Removing breaks the comform for some reason.
    --       "-f",
    --       "quiet",
    --       "--stderr",
    --       "--stdin",
    --       "$FILENAME",
    --     },
    --     exit_codes = { 0, 1 },
    --   },
    -- },
  },
}
