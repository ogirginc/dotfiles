local function erb_format_buffer()
  require("conform").format({
    formatters = { "erb_format" },
    async = true,
    lsp_format = "never",
  })
end

return {
  {
    "stevearc/conform.nvim",
    init = function()
      vim.api.nvim_create_user_command("ErbFormat", erb_format_buffer, {
        desc = "Format current buffer with erb-format (manual; bypasses save formatter)",
      })
    end,
    keys = {
      {
        "<leader>cE",
        erb_format_buffer,
        mode = { "n", "v" },
        desc = "Format with erb-format",
        ft = "eruby",
      },
    },
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
        yaml = { "yamlfmt" },
        eruby = { "herb_format" },
      },
      formatters = {
        rubocop = {
          command = "bundle",
          args = {
            "exec",
            "rubocop",
            "--auto-correct",
            "--force-exclusion",
            "--stderr",
            "--format",
            "quiet",
            "--stdin",
            "$FILENAME",
          },
          cwd = require("conform.util").root_file({ "Gemfile" }),
          require_cwd = true,
        },
        herb_format = {
          command = "bundle",
          args = { "exec", "herb", "format", "-" },
          stdin = true,
          cwd = require("conform.util").root_file({ "Gemfile" }),
          require_cwd = true,
        },
      },
    },
  },
}
