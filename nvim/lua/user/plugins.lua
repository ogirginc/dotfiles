local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  max_jobs = 5,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "windwp/nvim-autopairs"

  -- Colorschemes
  use "ishan9299/nvim-solarized-lua"
  -- use "~/neovim/nvim-solarized-lua"
  -- use "~/neovim/solarized-light.nvim"
  -- use "lifepillar/vim-solarized8"
  -- use "iCyMind/NeoSolarized"
  use "folke/lsp-colors.nvim"
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp completions
  -- use "hrsh7th/cmp-copilot"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter & friends
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  -- use "JoosepAlviste/nvim-ts-context-commentstring"

  use {
    "cuducos/yaml.nvim",
    ft = {"yaml"}, -- optional
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim" -- optional
    },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use "dyng/ctrlsf.vim"
  use { "junegunn/fzf", run = "./install --bin" }
  use "junegunn/fzf.vim"

  use "numToStr/Comment.nvim"
  use "tpope/vim-surround"

  use "tpope/vim-rhubarb"
  use "tpope/vim-fugitive"
  use "ruanyl/vim-gh-line"

  use "itchyny/lightline.vim"
  use "janko-m/vim-test"

  use "akinsho/toggleterm.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  -- use "airblade/vim-gitgutter"

  use "github/copilot.vim"
  use {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
    cmp_method = "getPanelCompletions",
  }

  -- Ruby
  use "tpope/vim-rails"
  use "tpope/vim-bundler"
  use "tpope/vim-endwise"
  use "ck3g/vim-change-hash-syntax"

  -- Javascript
  use "pangloss/vim-javascript"
  use "HerringtonDarkholme/yats.vim"
  use "maxmellon/vim-jsx-pretty"
  use "leafgarland/typescript-vim"

  -- " Ember
  use "joukevandermaas/vim-ember-hbs"
  use "AndrewRadev/ember_tools.vim"

  -- " Code styling
  use "tpope/vim-abolish"
  use "ConradIrwin/vim-bracketed-paste"

  -- " Unix
  use "lambdalisue/suda.vim"

  -- " Other
  use "AndrewRadev/splitjoin.vim"
  use "henrik/vim-indexed-search"
  use "inkarkat/vim-SyntaxRange"
  use "junegunn/vim-easy-align"
  use "kana/vim-textobj-user"
  use "matze/vim-move"
  use "rizzatti/dash.vim"
  use "schickling/vim-bufonly"
  use "tpope/vim-jdaddy" -- JSON manipulation and pretty printing
  use "tpope/vim-obsession"
  use "tpope/vim-repeat"
  use "tpope/vim-speeddating"
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
