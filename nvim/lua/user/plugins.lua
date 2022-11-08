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
  -- max_jobs = 5, -- If packer sync fails
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
  -- EDITOR FUNCTIONALITY
  ------------------------------------------------------------------------------
    -- CODE SEARCH
    use "dyng/ctrlsf.vim"
    use "junegunn/fzf.vim"
    use { "junegunn/fzf", run = "./install --bin" }
    use { "kyazdani42/nvim-ree.lua", requires = { "kyazdani42/nvim-web-devicons" }}

    -- TESTING
    use "janko-m/vim-test"

    -- CODE MANIPULATION
    use "AndrewRadev/splitjoin.vim" -- Switch between single & multiline code
    use "junegunn/vim-easy-align" -- Align your code
    use "matze/vim-move" -- Move code by line
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

  ------------------------------------------------------------------------------
  -- LANGUAGE SPECIFIC PLUGINS
  ------------------------------------------------------------------------------
    -- GIT
    use "lewis6991/gitsigns.nvim"
    use "tpope/vim-rhubarb"
    use "tpope/vim-fugitive"
    use "ruanyl/vim-gh-line"

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

  ------------------------------------------------------------------------------
  -- MISC
  ------------------------------------------------------------------------------
    -- THIRD PARTY TOOLING
    use "rizzatti/dash.vim"

    -- ARE WE SURE ABOUT THAT THIS IS NEEDED MY DEAR???
    use "ConradIrwin/vim-bracketed-paste"
    -- use "henrik/vim-indexed-search"
    -- use "inkarkat/vim-SyntaxRange"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
