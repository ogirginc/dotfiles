--------------------------------------------------------------------------------
-- LSP KEYBINDINGS
--------------------------------------------------------------------------------
-- Enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  local keymap = vim.keymap

  -- Keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Lsp finder find the symbol definition implement reference
  -- if there is no implement it will hide
  -- when you use action in finder like open vsplit then you can
  -- use <C-t> to jump back
  keymap.set("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references

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
  keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window

  -- Got to declaration
  keymap.set("n", "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
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

--------------------------------------------------------------------------------
-- LSP SERVER CONFIGURATIONS
--------------------------------------------------------------------------------
require("mason").setup()
require("mason-lspconfig").setup()

-- To enable autocompletion (assign to every lsp server config)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,

  -- ["ruby_ls"] = function ()
  --   lspconfig.ruby_ls.setup {
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --     init_options = {
  --       {
  --         enabledFeatures = {
  --           "codeActions",
  --           "diagnostics",
  --           "documentHighlights",
  --           "documentSymbols",
  --           -- "formatting",
  --           "inlayHint"
  --         },
  --       },
  --     },
  --   }
  -- end,

  -- ["solargraph"] = function ()
  --   lspconfig.solargraph.setup {
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --     -- settings = { solargraph = { diagnostics = true, completion = true } },
  --     -- settings = { solargraph = { formatting = false } },
  --     -- init_options = {
  --     --   formatting = false,
  --     -- },
  --     settings = {
  --       solargraph = {
  --         formatting = false,
  --         diagnostics = true,
  --         completion = true,
  --         definitions = true,
  --         symbols = true,
  --         hover = true,
  --         references = true
  --       }
  --     },
  --     -- init_options = {
  --     --   {
  --     --     formatting = { false },
  --     --   },
  --     -- },
  --   }
  -- end,

  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `sumneko_lua`:
  ["sumneko_lua"] = function ()
    lspconfig.sumneko_lua.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        }
      }
    }
  end
}

vim.diagnostic.config({
  virtual_text = false, -- TODO: is there a better way than global?
})

--------------------------------------------------------------------------------
-- LINTER CONFIGURATIONS
--------------------------------------------------------------------------------
-- require("mason-null-ls").setup({
--   ensure_installed = {
--     -- Opt to list sources here, when available in mason.
--   },
--   automatic_installation = false,
--   automatic_setup = true, -- Recommended, but optional
-- })

-- require("null-ls").setup({
--   sources = {
--     -- Anything not supported by mason.
--   }
-- })

-- require('mason-null-ls').setup_handlers() -- If `automatic_setup` is true.

-- local null_ls = require("null-ls")

-- -- register any number of sources simultaneously
-- local sources = {
--   null_ls.builtins.formatting.standardrb,
--   null_ls.builtins.diagnostics.standardrb,
-- }

-- null_ls.setup({ sources = sources })

require('lint').linters_by_ft = {
  ruby = {'standardrb',}
}
--------------------------------------------------------------------------------
-- FORMATTER CONFIGURATIONS
--------------------------------------------------------------------------------
