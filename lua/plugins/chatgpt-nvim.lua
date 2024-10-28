return {
  "MirekNguyen/ChatGPT.nvim",
  ft = { "chatgpt" },
  config = function()
    require("chatgpt").setup({
      chat = {
        openai_params = {
          model = vim.env.OPENAI_MODEL or "gpt-4o",
          max_tokens = 4096,
        },
        openai_edit_params = {
          model = vim.env.OPENAI_MODEL or "gpt-4o",
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
