return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = false,
        virtual_text = false,
      },
      servers = {
        ruby_lsp = {
          mason = false,
          enabled = true,
          cmd = { "/Users/ogirginc/.asdf/shims/ruby-lsp" },
        },
      },
    },
  },
}
