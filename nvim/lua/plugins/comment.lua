local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local ft = require "Comment.ft"
ft.set("html.handlebars", "{{! %s }}")
ft.set("handlebars", "{{! %s }}")

-- ft.set('eruby', { '<%# %s %>', "<% <<-COMMENT %>\n%s\n<%\nCOMMENT\n%>" })
-- ft.set('eruby', { '<%# %s ', "<%# %s " })

comment.setup {
  toggler = {
    ---Block-comment toggle keymap
    block = 'gBc',
  },
  opleader = {
    ---Block-comment keymap
    block = 'gB',
  },
}

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

-- vim.cmd('autocmd FileType handlebars setlocal commentstring={{! %s }}')
-- vim.cmd('autocmd FileType html.handlebars setlocal commentstring={{! %s }}')

-- vim.cmd([[
-- autocmd FileType handlebars setlocal commentstring={{! %s }}
-- ]])

-- vim.cmd('autocmd FileType handlebars setlocal commentstring=#\ %s')
-- vim.cmd([[
-- autocmd FileType html.handlebars setlocal commentstring={{!\ %s\ }}
-- ]])

-- vim.cmd('autocmd FileType handlebars setlocal commentstring={{! %s }}')
-- vim.cmd('autocmd FileType html.handlebars setlocal commentstring={{! %s }}')
