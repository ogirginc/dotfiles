require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.helpers"

require "plugins.autopairs"
require "plugins.comment"
require "plugins.ctrlsf"
require "plugins.easy-align"
require "plugins.fzf"
require "plugins.gitsigns"
require "plugins.lightline"
require "plugins.neo-tree"
require "plugins.nvim-cmp"
require "plugins.nvimtree"
require "plugins.toggleterm"
require "plugins.treesitter"
require "plugins.vim-move"
require "plugins.vim-test"

require "plugins.lsp.lspsaga" -- Need to load before lsp.config
require "plugins.lsp.config"
