local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local ft = require "Comment.ft"
ft.set("html.handlebars", "{{!-- %s --}}")
ft.set("handlebars", "{{!-- %s --}}")

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
