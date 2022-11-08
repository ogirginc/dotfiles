local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_status then
  return
end

treesitter.setup({
  -- highlight = {
  --   enable = true,
  -- },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  ensure_installed = { -- https://github.com/nvim-treesitter/nvim-treesitter
    "bash",
    "comment",
    "css",
    "dockerfile",
    "embedded_template", -- https://github.com/tree-sitter/tree-sitter-embedded-template
    "git_rebase",
    "gitattributes",
    "gitignore",
    "graphql",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "markdown",
    "query", -- https://github.com/nvim-treesitter/tree-sitter-query
    "ruby",
    "scss", -- https://github.com/serenadeai/tree-sitter-scss
    "sql",
    "swift",
    "todotxt",
    "toml", -- https://github.com/ikatyang/tree-sitter-toml
    "tsx",
    "typescript", -- https://github.com/tree-sitter/tree-sitter-typescript
    "vim",
    "yaml",
  },
  auto_install = true,
})
