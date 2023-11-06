-- :help options
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp

-- vim.opt.cmdheight = 2                        -- more space in the neovim command line for displaying messages
-- vim.opt.conceallevel = 0                     -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8"               -- the encoding written to a file
-- vim.opt.hlsearch = true                      -- highlight all matches on previous search pattern
-- vim.opt.pumheight = 10                       -- pop up menu height
-- vim.opt.showmode = false                     -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 2                      -- always show tabs
-- vim.opt.smartindent = true                   -- make indenting smarter again
vim.opt.termguicolors = true                 -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                    -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                     -- faster completion (4000ms default)
vim.opt.cursorline = true                    -- highlight the current line
-- vim.opt.number = true                        -- set numbered lines
-- vim.opt.numberwidth = 4                      -- set number column width to 2 {default 4}
-- vim.opt.signcolumn = "yes"                   -- always show the sign column, otherwise it would shift the text each time
-- vim.opt.scrolloff = 8                        -- Change buttom & top view size. Try 8.
-- vim.opt.sidescrolloff = 8
-- vim.opt.guifont = "monospace:h17"            -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

--
-- OGULCAN's old settings are below.
--

-- In visual mode select the lines, then `zf` to make them foldable.
-- Toggle with `za`, close all with `zm`, open all with `zR`
vim.opt.foldmethod = "manual"

-- Enable persistent undo & set folders.
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo'
vim.opt.backupdir = vim.fn.stdpath('config') .. '/.backup'
vim.opt.undodir = vim.fn.stdpath('config') .. '/.swp'

vim.opt.mouse = "a"                 -- Allow the mouse to be used in neovim.
vim.opt.clipboard = "unnamedplus"   -- Allows neovim to access the system clipboard.

vim.opt.showcmd = true              -- Show partial commands on the screen as it is being typed.
vim.opt.incsearch = true            -- Highlight matches as you type.

-- https://stackoverflow.com/questions/43579742/toggle-absolute-and-relative-numbering-in-vim-by-insert-normal-mode
vim.opt.number = true               -- Set number to toggle.
vim.opt.relativenumber = true       -- Set relative numbered lines.

vim.opt.backup = false              -- Get rid of annoying ~file.

vim.opt.ignorecase = true           -- All your searches will be case insensitive.
vim.opt.smartcase = true            -- Search will be case sensitive if it contains an uppercase letter.

vim.opt.colorcolumn = "81,101"      -- Show column colors.

vim.opt.expandtab = true            -- Insert space characters whenever the tab key is pressed.
vim.opt.shiftwidth = 2              -- Number of space characters inserted for indentation.
vim.opt.tabstop = 2                 -- Number of spaces will be inserted when the tab key is pressed.

vim.opt.splitbelow = true           -- force all horizontal splits to go below current window
vim.opt.splitright = true           -- force all vertical splits to go to the right of current window

-- Automatically equalize splits when Vim is resized.
vim.cmd[[autocmd VimResized * wincmd =]]

-- Prevent adding newline character to the end of the last line for hbs files.
-- https://stackoverflow.com/a/39627416/4565485
vim.cmd[[autocmd FileType html.handlebars setlocal noendofline nofixendofline]]
