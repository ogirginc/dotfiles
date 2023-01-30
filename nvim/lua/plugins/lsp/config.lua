-- Import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- Import cmp_nvim_lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- Import typescript plugin safely
local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  return
end

local keymap = vim.keymap

-- Enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- Keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references

  -- See available code actions
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

  -- Smart rename
  keymap.set("n", "<leader>srn", "<cmd>Lspsaga rename<CR>", opts)

  --- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back- Peek Definition
  -- you can edit the definition file in this flaotwindow
  -- also support open/vsplit/etc operation check definition_action_keys
  -- support tagstack C-t jump back
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window

  -- Got to declaration
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- Go to implementation
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

  -- Show diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  -- Show diagnostics for cursor
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

  -- Diagnsotic jump can use `<c-o>` to jump back
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

  -- Only jump to error
  keymap.set("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, opts)
  keymap.set("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, opts)

  -- Show documentation for what is under cursor
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

  -- See outline on right hand side
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  -- Typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
  end
end

-- To enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

--------------------------------------------------------------------------------
-- SERVER CONFIGURATIONS
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--------------------------------------------------------------------------------

-- html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- ember server
lspconfig["ember"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- graphql server
lspconfig["graphql"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- jsonls server
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- ruby_ls server
lspconfig["ruby_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- solargraph server
lspconfig["solargraph"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- yamlls server
lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Lua server (with special settings)
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = false, -- TODO: is there a better way than global?
})
