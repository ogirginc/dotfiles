local null_ls_status, null_ls = pcall(require, "null_ls")
if not null_ls_status then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Ruby
    -- formatting.rubocop,
    -- diagnostics.rubocop,
    formatting.standardrb,
    diagnostics.standardrb,

    -- Javascript
    formatting.prettier,
    diagnostics.eslint_d,

    -- Lua
    formatting.stylua,
  }
})
