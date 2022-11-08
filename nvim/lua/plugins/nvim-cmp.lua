-- Import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- Import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- Import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- Load VSCode like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
    ["<C-n>"] = cmp.mapping.select_next_item(), -- Next suggestion
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll down on docs
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll up on docs
    ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),

  -- Sources for autocompletion
  sources = cmp.config.sources({
    { name = "copilot" }, -- copilot
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
  }),

  -- Configure lspkind for vs-code like icons
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
