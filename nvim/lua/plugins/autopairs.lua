-- Import nvim-autopairs safely
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
  return
end

-- Import nvim-autopairs completion functionality safely
local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
  return
end

-- Import nvim-cmp plugin safely (completions plugin)
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- Configure autopairs
autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
})

-- Make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
