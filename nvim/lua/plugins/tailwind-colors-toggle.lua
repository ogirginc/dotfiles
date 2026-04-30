return {
  "neovim/nvim-lspconfig",
  init = function()
    vim.api.nvim_create_user_command("TailwindColorsToggle", function()
      local dc = vim.lsp.document_color
      if not dc then
        return vim.notify(
          "vim.lsp.document_color is unavailable (requires Neovim 0.11+)",
          vim.log.levels.WARN
        )
      end

      local now_on = not dc.is_enabled()
      dc.enable(now_on)
      vim.notify("Tailwind colors: " .. (now_on and "on" or "off"))
    end, { desc = "Toggle Tailwind LSP color highlights" })
  end,
}
