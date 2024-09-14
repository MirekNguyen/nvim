return {
  "jackMort/ChatGPT.nvim",
  cmd = { "ChatGPT", "ChatGPTRun" },
  config = function()
    require("chatgpt").setup({
      chat = {
        openai_params = {
          model = "gpt-4o-2024-08-06",
          max_tokens = 4096,
        },
        openai_edit_params = {
          model = "gpt-4o-2024-08-06",
        },
        keymaps = {
          select_session = "o",
        },
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
