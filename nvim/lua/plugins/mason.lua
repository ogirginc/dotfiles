return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- "shfmt",
        "stylua",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      handlers = {
        -- Don't use Mason for rubocop - use bundled version
        rubocop = function() end,
      },
    },
  },
}
