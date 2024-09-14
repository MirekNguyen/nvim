return {
  "piersolenski/wtf.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    openai_model_id = vim.env.OPENAI_MODEL or "gpt-4o",
  },
  cmd = { "Wtf", "WtfSearch" },
}
