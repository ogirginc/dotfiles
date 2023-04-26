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
  max_jobs = 5, -- If packer sync fails
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

--------------------------------------------------------------------------------
-- PACKER PLUGINS
--------------------------------------------------------------------------------
return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  ------------------------------------------------------------------------------
  -- COLORSCHEMES
  ------------------------------------------------------------------------------
  use "ishan9299/nvim-solarized-lua"

  ------------------------------------------------------------------------------
  -- MODERN EDITOR FUNCTIONALITY
  ------------------------------------------------------------------------------
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},             -- Required
      {"williamboman/mason.nvim"},           -- Optional
      {"williamboman/mason-lspconfig.nvim"}, -- Optional

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},         -- Required
      {"hrsh7th/cmp-nvim-lsp"},     -- Required
      {"hrsh7th/cmp-buffer"},       -- Optional
      {"hrsh7th/cmp-path"},         -- Optional
      { "hrsh7th/cmp-cmdline" },      -- Optional
      {"hrsh7th/cmp-nvim-lua"},     -- Optional

      -- Snippets
      {"L3MON4D3/LuaSnip"},             -- Required
      {"saadparwaiz1/cmp_luasnip"},     -- Optional
      {"rafamadriz/friendly-snippets"}, -- Optional
    }
  }

    -- FORMATTING & LINTING
    use "jose-elias-alvarez/null-ls.nvim"
    use "jayp0521/mason-null-ls.nvim"

    -- TREESITTER
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
      end,
    }

    -- TREESITTER TOOLING
    use "windwp/nvim-autopairs" -- autoclose parens, brackets, quotes, etc...
    use { "windwp/nvim-ts-autotag", after = "nvim-treesitter" } -- autoclose tags

    -- COPILOT
    use {
      "zbirenbaum/copilot.lua",
      -- after = "lightline.nvim", -- whichever statusline plugin you use here
      event = "VimEnter",
      config = function ()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    }
    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }

  ------------------------------------------------------------------------------
  -- OTHER EDITOR FUNCTIONALITY
  ------------------------------------------------------------------------------
    -- CODE SEARCH
    use "dyng/ctrlsf.vim"
    use "junegunn/fzf.vim"
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
    use { "junegunn/fzf", run = "./install --bin" }
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          {
            -- only needed if you want to use the commands with "_with_window_picker" suffix
            's1n7ax/nvim-window-picker',
            tag = "v1.*",
            config = function()
              require'window-picker'.setup({
                autoselect_one = true,
                include_current = false,
                filter_rules = {
                  -- filter using buffer options
                  bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { 'terminal', "quickfix" },
                  },
                },
                other_win_hl_color = '#e35e4f',
              })
            end,
          }
        }
      }

      -- TESTING
      use "janko-m/vim-test"

      -- CODE MANIPULATION
      use "AndrewRadev/splitjoin.vim" -- Switch between single & multiline code
      use "junegunn/vim-easy-align" -- Align your code
      use "matze/vim-move" -- Move code by line
      use "tpope/vim-commentary"
      use "JoosepAlviste/nvim-ts-context-commentstring"
      use "numToStr/Comment.nvim"
      use "tpope/vim-jdaddy" -- JSON manipulation and pretty printing
      use "tpope/vim-repeat"
      use "tpope/vim-speeddating"
      use "tpope/vim-surround"
      use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }

      -- EX COMMANDS
      use "lambdalisue/suda.vim" -- SUDO access
      use "schickling/vim-bufonly" -- Keep open buf only
      use "tpope/vim-obsession" -- All about :mksession

      -- OTHER
      use "akinsho/toggleterm.nvim"
      use "itchyny/lightline.vim"

    ----------------------------------------------------------------------------
    -- LANGUAGE SPECIFIC PLUGINS
    ----------------------------------------------------------------------------
      -- GIT
      use "lewis6991/gitsigns.nvim"
      use "tpope/vim-rhubarb"
      use "tpope/vim-fugitive"
      use "ruanyl/vim-gh-line"
      use { "2kabhishek/co-author.nvim", requires = "stevearc/dressing.nvim" }

      -- RUBY
      use "tpope/vim-rails"
      use "tpope/vim-bundler"
      use "tpope/vim-endwise"
      use "ck3g/vim-change-hash-syntax"

      -- JAVASCRIPT
      use "pangloss/vim-javascript"
      use "HerringtonDarkholme/yats.vim"
      use "maxmellon/vim-jsx-pretty"
      use "leafgarland/typescript-vim"

      -- EMBER JS
      use "joukevandermaas/vim-ember-hbs"
      use "AndrewRadev/ember_tools.vim"

      -- YAML
      use "cuducos/yaml.nvim"

    ----------------------------------------------------------------------------
    -- MISC
    ----------------------------------------------------------------------------
      -- THIRD PARTY TOOLING
      use "rizzatti/dash.vim"

      -- ARE WE SURE ABOUT THAT THIS IS NEEDED MY DEAR???
      use "ConradIrwin/vim-bracketed-paste"
      -- use "henrik/vim-indexed-search"
      -- use "inkarkat/vim-SyntaxRange"

  ------------------------------------------------------------------------------
  -- PACKER END
  ------------------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
