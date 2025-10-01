return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
      },
      formatters = {
        rubocop = {
          command = "/Users/ogirginc/.local/share/mise/shims/bundle",
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
      },
    },
  },
}
