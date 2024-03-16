return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTEditWithInstructions",
    "ChatGPTRun",
  },
  config = function()
    require("chatgpt").setup({
      -- api_key_cmd = "$OPENAI_TERMINAL",
      -- api_key_cmd = "echo $OPENAI_TERMINAL",
      -- NOTE: Don't use as it keep asking to confirm.
      -- api_key_cmd = "pass show openai/terminal",
      -- api_key_cmd = "op read op://personal/Openai/terminal --no-newline",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
