return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local user_lsp_config_path = vim.fn.stdpath("config") .. "/lua/lsp-options-custom.lua"
    local config

    -- Check if lsp-options-custom.lua exists
    if vim.fn.filereadable(user_lsp_config_path) == 1 then
      config = require("../lsp-options-custom")
    else
      config = require("../lsp-options")
    end

    null_ls.setup({
      sources = config.sources(null_ls),
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
