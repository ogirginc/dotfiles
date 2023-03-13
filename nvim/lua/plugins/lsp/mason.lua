-- Import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- Import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- Import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "ember",
    "graphql",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "ruby_ls",
    "solargraph",
    "tailwindcss",
    "yamlls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

-- See what's available below:
-- https://github.com/jayp0521/mason-null-ls.nvim#available-null-ls-sources
mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "rubocop",
    "erb_lint",
    "haml_lint",
    "zsh",
    "stylua",
    "eslint_d",
  }
})
