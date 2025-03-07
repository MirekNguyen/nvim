return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = false,
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = require("config.lsp-options").sources(null_ls),
    })
  end,
}
