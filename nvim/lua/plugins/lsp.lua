---------------------------------------------------------------------------------
-- LSP ZERO & NVIM CMP
---------------------------------------------------------------------------------
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  -- Mappings for cmp-nvim
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),             -- Show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),                    -- Close completion window

    ["<C-p>"] = cmp.mapping.select_prev_item(),         -- Previous suggestion
    ["<C-n>"] = cmp.mapping.select_next_item(),         -- Next suggestion
    ["<C-f>"] = cmp.mapping.scroll_docs(4),             -- Scroll down on docs
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),            -- Scroll up on docs

    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
  }),

  -- Ordered sources for autocompletion
  sources = {
    { name = "copilot" },  -- copilot
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- text within current buffer
    { name = "path" },     -- file system paths
  },
})

lsp.setup()

---------------------------------------------------------------------------------
-- NULL LS
---------------------------------------------------------------------------------
local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    -- You can add tools not supported by mason.nvim
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  automatic_setup = true,
  handlers = {},
})

-- Required when `automatic_setup` is true
-- require('mason-null-ls').setup_handlers()
