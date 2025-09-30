return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = false,
      },
      diagnostics = {
        underline = false,
        virtual_text = false,
      },
      servers = {
        ruby_lsp = {
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
          mason = false,
          enabled = true,
          cmd = { "/Users/ogirginc/.local/share/mise/shims/ruby-lsp" },
          -- cmd = { "bundle", "exec", "ruby-lsp" },
        },
        rubocop = {
          mason = false,
          enabled = true,
          cmd = { "/Users/ogirginc/.local/share/mise/shims/rubocop", "--lsp" },
          -- cmd = { "bundle", "exec", "rubocop", "--lsp" },
          -- cmd = { "/Users/ogirginc/.asdf/shims/rubocop", "--lsp" },
        },
        turbo_ls = {
          mason = false,
          enabled = true,
          cmd = { "/Users/ogirginc/.local/share/mise/shims/turbo-language-server", "--stdio" },
        },
      },
    },
  },
}
