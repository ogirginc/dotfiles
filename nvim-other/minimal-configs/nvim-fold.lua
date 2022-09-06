vim.o.packpath = '~/.local/share/nvim/site'
vim.cmd('packadd promise-async')
vim.cmd('packadd nvim-ufo')

-- Setting
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = -1
vim.o.foldenable = true

local ufo = require('ufo')
ufo.setup()
vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
