-- Import saga plugin safely
local saga_status, saga = pcall(require, "saga")
if not saga_status then
  return
end

saga.init_lsp_saga({
  -- Keybinds for navigation in lspsaga window
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },

  -- Use enter to open file with finder
  finder_action_keys = {
    open = "<CR>",
  },

  -- Use enter to open file with definition preview
  definition_action_keys = {
    edit = "<CR>",
  },
})
